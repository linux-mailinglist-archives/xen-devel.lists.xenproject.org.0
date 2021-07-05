Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A233BBA31
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149996.277409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Kwf-0005UR-JU; Mon, 05 Jul 2021 09:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149996.277409; Mon, 05 Jul 2021 09:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Kwf-0005Qy-FO; Mon, 05 Jul 2021 09:31:17 +0000
Received: by outflank-mailman (input) for mailman id 149996;
 Mon, 05 Jul 2021 09:31:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0Kwe-0005Qs-9i
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:31:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68704eec-e8b3-449c-8e79-657a0882a3a5;
 Mon, 05 Jul 2021 09:31:15 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12--4m3hvj5OEuo4V2gMVtPoQ-1; Mon, 05 Jul 2021 11:31:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 5 Jul
 2021 09:31:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 09:31:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:31:10 +0000
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
X-Inumbo-ID: 68704eec-e8b3-449c-8e79-657a0882a3a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625477474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSS7ab6faEUx22k8Q5SlASYn33rjfL9dM86O77nepwY=;
	b=jQgafPXUV0YDVkqOxhnJaryrKWCXjUQAv3BRspTXAFo7BIZFtORK2K7FRps+fXNkVWh4dW
	3Hou3cuDQSqTRA6DFOhx7+BrHfJ8e87hq+tFKfwD/sjHLnVeNWEIyDGb7Tpg5R9mQ2ifPX
	LBho1JZIb+dDyaP7VkYYmgLcAxzkEIY=
X-MC-Unique: -4m3hvj5OEuo4V2gMVtPoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0zbW8vcPROfrUgGbH4VVd9gv7H+hQ3oUcoJN/sVSn/UYT9R2Bd8YVCKlpygukYPga+WSVk4UWGl3ixAqSzlKxGdqCdZ0mhqXNY4qw4/DZo+W0bEGIUReun6Yvc7gTYHzThbI3jk7JycF5rRSYtBsjdnmyTdjzpmEssE5UaOUj5husPt1vKdDPJc65zGgjmnFsA5B30A84agOWV2D4bRneBxamEmtjAoV6Rt6hUJHMDPZSBek1b0+9/MuvpdRdDI6Uf5TgdxQv1xM74FTt3shiMFspu9+WV56GwrekU5OgwXlTP7rhPMC33T8drovrmiH1PwWrCyjkszLjf2dkLHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSS7ab6faEUx22k8Q5SlASYn33rjfL9dM86O77nepwY=;
 b=ILx7CrcJnCkT9RlseQcVRu/19o5r/sDzUQlw6das65AzZyY1D0/M02G+pinNakC1Bbyzg8J3ufTPtxzYItt6NrAJhxu90RJB5KpuxqU43HkRdonNOS5uKKJlpa9hiIhgvubL+HuOfXkaktL2eqgyhlc5uNFNAGOC18oV8XsA54X5QX4CF6h95vqD2hTlpmdX01mX0MsZh9yVSXUkcmSbWoVAbBYrwtl9lQpwjMJJvUY94LmY36j7/JRPxTUGXt05WViQNLZDFKtEwuD7Iy0ocHAIiLSC1l15MuPOjTIOZP1VYtEKkUSAAIi+vyI5mYXSKc6NqdrdQ/SWMgqdOTRWEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
 <06968742-355f-ad37-0681-e51eea256414@suse.com>
 <20210705100228.4947ed4e.olaf@aepfle.de>
 <ed3ceecf-239f-9bd9-e040-5246c9b49f53@suse.com>
 <20210705103224.26f3835d.olaf@aepfle.de>
 <1e2a3967-06e5-75ec-3aa5-1f39b6700e63@suse.com>
 <20210705112548.22ae6d20.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e4986ad-d3ec-18af-b1ea-ccbce57a70ff@suse.com>
Date: Mon, 5 Jul 2021 11:31:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705112548.22ae6d20.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1fc3aaa-abe4-4c88-af14-08d93f97a028
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617493D5FCCA08847FF300C6B31C9@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1AWOWL0iL9vknBiTC8WY0qBv/BZt0FsYV5xEZZmMD6R2PaSnX/GmdL3cZr29m0XWy34S07w1N5MuFJpURwYXhctO189BXhovvarkSDJP9jNFyvVHWwUXeJ43jZXzNVbj98NjFyQReBsHFDu624hKac088fjX70IUh2RV8X0oJagYJ2JlY+NYcSPeRv72fuY6JnGDe1CIltn2OZeWole+uo+MaS55Cl3GaokA6iOUwb8D6jdz5GNIxd0ARpjgdXoeubSBz+s2KMFUG9WfgLZHE0iKKhv/iwXUtJYL7CBnfoNzf9CZduRJZ6HkUpd7mpPT8f3EltHlgpQQiPQGM+vWQXsDLE+FSurQzUzWavvs6oRQJ3VpbsRU6x9I9tIKNabcBD3UQ2DoUeXEX/H+XjVsOHHXtph1/nJyMDHHe8qfsKXvvPCM7V8HID0qm1trx0hTBm3JKULWcB0r+pkP2wEvlsLwOrVRe4ADNdmZ7P2uHTkrZxDjrJVpwYEVrY05Bd3yuDCYxdBRLUQqKjokhLZpPJLw91PrTuAoWZJblEdQCpdHBuiDIqlMHTTKerRRtA0krpLAOkiWSJiXJaA3o4SZvUxRcqK9BXCb+rpunC8iBpwTt7ZeuwZaC9EBQcNwfez7x74riarQWoIx/hW5nA7kN4pGYON2tLIkJtfIG7+d7VkQWJrywoHioiba201VIJCjiNhJ9RMbGEJEtuw3jVKJ49gHyO25Kn3Ja/4YZXetFog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(136003)(366004)(346002)(396003)(31686004)(4744005)(31696002)(186003)(16526019)(8676002)(8936002)(6486002)(86362001)(26005)(83380400001)(4326008)(2616005)(36756003)(38100700002)(478600001)(316002)(66946007)(6916009)(956004)(66556008)(5660300002)(53546011)(66476007)(16576012)(54906003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?UXtAP66G2EkheIjuy3gCUZEBoTjsPEZsS/YQp/vr/DgDEs+Sdca6qK76?=
 =?Windows-1252?Q?lt+PiJB/uaEH07Qj+z/7ezpFX1/lt/0evMa/pNMoL7ERjyVMy/aHzCR+?=
 =?Windows-1252?Q?zLrQbvckbdEGwV3oDosREEJSAFGHInA0ANyaKgrXpHJKleP3VkZk3yZA?=
 =?Windows-1252?Q?hq2jhgRVCaWPfPXVlB6hn0OorOUbP4aQYrQz+E1jQNFhIhH3g9rQ57Hd?=
 =?Windows-1252?Q?/cYd3vCyvt1EWsH83Jv0EanklUUUZcwbc2N1fchwz2UwGUIzRfHQBFVk?=
 =?Windows-1252?Q?5XUkKI+v0Mo9Orz06323pOrbeGsyGcvKLCdRwqRSVI0Q97aoZugzMJAn?=
 =?Windows-1252?Q?8QQrW+E1aqY+OYj05+BTYOuV/pIc/jCeI9MAXr9sjVFETLfYGmCfRGV+?=
 =?Windows-1252?Q?JR3Co1c8yxJFqA5beqsMVdNtz3U8uvyfl1ZvXLhLj+G5xCAql7B8+CAP?=
 =?Windows-1252?Q?MKcmXPoZjigRL/62QC61SAD3802hEWIxuHLAM7cVGmgpROxQubLDGUS7?=
 =?Windows-1252?Q?2/ovP090wkkdoqwZjU1/SRaPcu2us9vfkHFG3w/yrclXrmdsH+XjanUU?=
 =?Windows-1252?Q?G7X21149rNELXVUdpGfwc/VnGGtgAf/NSS8/1Qwp0AgG0+aAMA4nzMLQ?=
 =?Windows-1252?Q?2bbbmyur+kY42TAf7bY81v8VrSwmBRf4DVR+9sX5Nkj5Y5J4pc7iTuQ1?=
 =?Windows-1252?Q?zNB7jbPZ2m4fbm7hfHSuWjWcvy6PZrrPEnaiFNsCbT09dt/xi647J2XO?=
 =?Windows-1252?Q?TT1EU6E1USorKEgCGJWphycoo4bEqnRlcJ495qv7R7mRuNto87dIxGTc?=
 =?Windows-1252?Q?nK5+sZhh/x5g6XNjchaDa7I3oUKBDNx67LrBck8JseX+kCWNgzjf14vn?=
 =?Windows-1252?Q?AswO2A3IvVuNcfk0tI8ZskouLiT/rUxX2kJl+x+T3YcHMHPC5pBjw+3m?=
 =?Windows-1252?Q?EOQYaN5Zk96Bu/MoV17Dd5luY8LhmELedVw/W6aaUCDnR7KlpMANSho7?=
 =?Windows-1252?Q?xiP5J2F3tStAsxSfvFXVcXJuKGZX9RQ7G3VArHKccDo/kJHbAYtanTt/?=
 =?Windows-1252?Q?KgNYAy5ipKwx33Xe5ADrWzjFdbOcbSPDTnEyjz3Xth1w6Qor896Vlgeu?=
 =?Windows-1252?Q?QrCd9XjHaYQaqhPL2ZuZlJMcxFNKzlxUeUpdqOCUZ1Sd/DX/vBCy/PG9?=
 =?Windows-1252?Q?I/S4hA3nIUXj4cwpeNOS4Tk0waH9+uLaUX0TKZmFFxSom4iZg4gpY0pH?=
 =?Windows-1252?Q?MxGgjK7MO7iZni3r/J7bBRGPDnNe1UIihUkzemJmv+dqK/F8XKuT3cI7?=
 =?Windows-1252?Q?Hop2H1DrHstS8rkt/9mbQf8kgp4PCkMbuf9F1HlpraNuReGZWF55sL7l?=
 =?Windows-1252?Q?zCShD0r3T2XOyoKK++qjHi64pr6f7yWttAHHQ9XKzPA2kYqTGDl32DY2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fc3aaa-abe4-4c88-af14-08d93f97a028
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:31:11.0287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzkzVIMz/gMZRRYQQ/Yaz5YVD6yXUQTxoh+Xp1eo5onazmuoFVYhxgdv28wgV2Fn5biCXGpolXEfiqLF+tpzgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 05.07.2021 11:25, Olaf Hering wrote:
> Am Mon, 5 Jul 2021 11:19:59 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>> "The interface" being which one? The tool stack can map the guest's
>> grant table, so it is in the position to find out about all grants
>> without further hypervisor help.
> 
> The interface means the code behind verify_frames.
> 
> If there are indeed ways to query which pages belong to grants, how would the toolstack need to do that?

Map the grant table of the guest and walk it, recording any MFN for
which at least one valid r/w grant exists.

Jan


