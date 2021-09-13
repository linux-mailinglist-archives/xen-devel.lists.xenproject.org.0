Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C961640851D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 09:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185469.334140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPg4X-0005xe-0w; Mon, 13 Sep 2021 07:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185469.334140; Mon, 13 Sep 2021 07:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPg4W-0005vD-Tx; Mon, 13 Sep 2021 07:08:08 +0000
Received: by outflank-mailman (input) for mailman id 185469;
 Mon, 13 Sep 2021 07:08:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPg4V-0005v5-9Z
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 07:08:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57915838-1461-11ec-b3a1-12813bfff9fa;
 Mon, 13 Sep 2021 07:08:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-7Dq20pdkNeeJJtpG_-3E4Q-1; Mon, 13 Sep 2021 09:08:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 07:08:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 07:08:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0120.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 07:08:01 +0000
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
X-Inumbo-ID: 57915838-1461-11ec-b3a1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631516885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32TqImMi+91i8BvvjeHans1WrkYR10xKOADJXdQtMOc=;
	b=UZMTVUZIzO5a1xPozicp3hOoYPm7aM5kGNWT8b81dARGxJsL2DkKi8MwI0nrWo5zS/viN/
	qOrsghrjQkZuCNVP+x1pdzcxm9ENIOO8tQFNxyK/90HVv9wxXusxf4HCkA5UuT4wDVBkoO
	ZjQ1YXZEI35v4oCp71I2o7DNztsC4Fs=
X-MC-Unique: 7Dq20pdkNeeJJtpG_-3E4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzpSyz+DCXr5KwWgJHenk1WbxRrw1loOlPBtpdKzF2Ar01yqtisAN8P0OX4DodTxDBDTySouNRhgoTGkTLJkBLnQcaF0GEbiQqQ5hSH0589gEd7aDCRuVUo34y5/tx8ddffiPYaB2WEcX/6eVIMBNmsaxHe/BgxdEVOT+ywkOQkR8xmAg8plK2DmQzV0f/ltc+C8c6+VPwqRDSSJ61EVNrL/rUkCcplvS+Zm9KTS8NHyqdS3TRD9ZUh2fqXH9toWeYnQCUOOmgJnEQTxF2ZWlRaOZLDVSoNpkFX46dbCLtLn5eakCCp8cpnQZffiFGudvVDQoeX0+58GO2Nki4itWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2knjgkLZn1y6wm3AKSFjUsFCFY2s2it+KcMcLQZnVQE=;
 b=GWcHH+SVtMZ2V8YAxkcTxrsPpOpfRQIQ7LZ49//78rghTP6lskpVMIUih4bKqWTu+ML2h72u1LmnXQtKKrGEM4DXB2rd+Uq7FDW1M9oCNCjWAx1MRC1Aj6Dt3Rdh8Zj7dmB+daYTPSH+pyERWFJ3s2SHAdAqnJTVZ5S/EdEQY6DcJEx5J1PY5qsTXjJWnQynRSeoO71H9SNcakXVFtpWM61ht/RoE1JTDhgJO9OxMfo6i17CNzUh9SreWCXnORu4F2R1btP6pc/HBgBMvnclXqv9XyLPqCbJiYxF1x3rCLLfD+8ghZ0myoa3L7FiFKUA32dlcrJTR1rdiJ+GNPZScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/3] tools/libacpi: Use 64-byte alignment for FACS [and 1
 more messages]
To: Ian Jackson <iwj@xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210909163441.44418-1-kevin.stefanov@citrix.com>
 <20210909163441.44418-3-kevin.stefanov@citrix.com>
 <affca979-4082-e825-dede-b27b5574631b@suse.com>
 <20210909163441.44418-2-kevin.stefanov@citrix.com>
 <bbde0f13-a1a5-53ed-82eb-704cd5d43178@citrix.com>
 <24891.28877.607703.662095@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9bc27296-528e-41eb-b27c-23e4113e9d5b@suse.com>
Date: Mon, 13 Sep 2021 09:08:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24891.28877.607703.662095@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83106f15-4cc0-4ebb-bb23-08d9768539ca
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5597BF5E2F0F6B027CCBF73FB3D99@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SdnERmSht0mHawXEiwQj3AGqORyEqj+eEdKoNzq4OCPiGVjCKYM0gpaLxwv1Wop7/0HC8gNQWxgGuGL8Xd98AzZegW6Z71vAAZZ1QPnfWHr46jM5Xk4rG/J8byq0g0uA/zrth1ExuCFIAjNMW/EtlG3ceZ/RxffzZlEWEcDXuzAalmL4aVV6YOWrcTmcTNs7E7uJYJtRhWocBsJgxKkEVDQX28MSRNx9gCu97V46CfeHEgmE/w63Q9ARh+B6XcpqS37DCFNmv564NVhy3AmlyDvVtMoYSze8gDezPsz8GTU+DeVUCPNU60DuQNwOgSqhTZzipyz963jZ3PsBSkdh8+bn8qO/ZAW2q0aGyUQD/tTQHeBd1SBxXtGUZwaJt/vPhXDk/dVTpRU/Gq+Ssgqfl3TZfStJREV7N/56tOsHX8zvutG4EEhsoGvL2V4vhouJtnEsphLOcGBgOfjV8LndxKUZR1n6NDeq91+uR5NfWm13jxR56ZIqmWX6HDmFsLEn2L/b/jvj1oRjq9bMS7gkcMiodu7/P/UmmcP7utk/3CY2VOdKQZFz2QZPu9eYtknCmT3C/eediVpbE4KQBcVqOemmtgndQ/FOQEWn1USjfH+lHW7blz5/7ne5zMZUAfa+XElpJ1O/AinHPUepxfYYLycfy5nuJtNZ6DcT1gXtuOQ99rA+OeupSX77W9rDf75uUSG5u22q3EBshN3MpFjuTBXqsXddykpd5UQUxTIvTikAqipNiiKSpWsXplbmi0u+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(346002)(366004)(376002)(8676002)(16576012)(186003)(66476007)(316002)(53546011)(54906003)(2906002)(4326008)(66556008)(66946007)(26005)(38100700002)(83380400001)(5660300002)(36756003)(31686004)(6916009)(6486002)(8936002)(956004)(31696002)(478600001)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dRqrYbXMkTpLWuKVgQu/2oHQxt+F5nl+o7mzyalFrG3nmDC4FNrTanKf8RbF?=
 =?us-ascii?Q?AIToBffkM9ASSHfzyKLjeJoaRenfz8aMMhoFF/8AK62ew8PKnRofu92GD217?=
 =?us-ascii?Q?8wTwy0/HUBTjjyAzKkOIK8nHmuaNlxZPd9LUX/ItWVN2jmqjpvYukGtQLgwA?=
 =?us-ascii?Q?1MY3iyDLEFTVWI3QRW7cvCXDYaazGpFLSNJEvNT85lb/M2ojPaot8UPp/BAm?=
 =?us-ascii?Q?icsaPrzMNCtPX6GVulqtq9SQGbMOgHUhyzIwmcPD+2rpab5cHpVltHBB28by?=
 =?us-ascii?Q?KcsQi3cSxK5rAtyFDHLOVEf62x2ig/bLk/NyVPGc0pWSg1SfwHl+9W0kfblX?=
 =?us-ascii?Q?0iy/TzNtKRDyA51BcKDnTm5l71e8W+p0pR2VkI3MzrPzfNPNd9TjljkoKK/9?=
 =?us-ascii?Q?mcgRekw/KUp9aMYlgkXkATOG4GnuYBAAgYx27mqOCdmuksL3cxSEtx4bFtWL?=
 =?us-ascii?Q?s6+3PRCA0cuehQkpvKGfAq9cvyyrM30Pbbq3TH29LX7VnAJUASEfrGYmY1F2?=
 =?us-ascii?Q?xJ+mXvFPfkts7WHqbpP7Osxbo9HgkizAnSWYczkSBiIp0D4tRulk3JQZ0jps?=
 =?us-ascii?Q?+UibE0HRIAKaE5tc0B9uAhYKqi5gdtmF+TESuXQp/OsyIe0YscfPHD+lFeif?=
 =?us-ascii?Q?dGM8Sx78B4qbYEbVHnPnj0JlG0HMUO3vTIgue9edoVK3+CoyQauWQC3mdU7D?=
 =?us-ascii?Q?9Rm/wE7r1iJof73dqhm3v2Z5zXynZQE8feW19kDzmQK1EGThp9dVof43pz9e?=
 =?us-ascii?Q?dxpHOgk5uZoDtMa1bbE7kSC/TU31RQJ/ZJtkYbqhUSsM+gFRJSUyr+rugB9z?=
 =?us-ascii?Q?KvWeZipCza98SppTdtFMrE+SkoPyLE3fTLbsMUk0st6nmLe2fKb6E3h75s2y?=
 =?us-ascii?Q?oeRjaHH8XRc72Nxm9MJjIVcSV66celuW2nb4N1iSRKkTO5DKVcyFZNCND1s+?=
 =?us-ascii?Q?f+5A4eS1S/49x0tU1VbeNwPBQR6fNOjsBhNZpWY11768hxeCWXf6uAac2W7x?=
 =?us-ascii?Q?2+p2HkibAKULkEriIoBUQp8bUEEX176OGVeaEHahnedfQmGXRkdyv/CsEvw7?=
 =?us-ascii?Q?xsexzL6zPqKAflrh2mzqRkK6MfcszmzTaYG1BMobo8wDnRonlGMuH9xC60cJ?=
 =?us-ascii?Q?nU0HLmY28q+6Bgy95fNjI7XMZTTNgjuPW+xDUoO+vy3t3OLZMQTrJxBDiWyk?=
 =?us-ascii?Q?SKRzlZIV3amZyt+7fiEZOfKhgcPQu2kXbLkFm0KOK44V0EOps/YEyY2VJtHZ?=
 =?us-ascii?Q?gUZ3yX0r3d1gIsSTStNefSgMkLFEIW5LdF8JnZPYn5BNZGEp3L3exZCZLle6?=
 =?us-ascii?Q?CqrxGjikzH1ImW1LgjcshwaZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83106f15-4cc0-4ebb-bb23-08d9768539ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 07:08:02.2670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOa19K1ihyU7xLhTD0R2rvnNuLEIc+sFNcXL++Vhd4lEYqL7gmQzVQdrpGhlGXqPUUMqNmHPM+PX4lU7VBtS0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 10.09.2021 16:50, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH 1/3] tools/libacpi: Use 64-byte alignme=
nt for FACS"):
>> The current code is clearly wrong, but happens to work correctly in
>> hvmloader because FACS is the first table written and it starts on a
>> page boundary.=C2=A0 The logic does not work correctly when libxl passes=
 a
>> buffer which doesn't start on a page boundary.
>>
>> As a consequence, I'm not sure what to suggest as a Fixes tag here,
>> except "the logic has been wrong for 15 years - patch everything".
>=20
> Jan Beulich writes ("Re: [PATCH 2/3] tools/libxl: Correctly aligned buffe=
r for ACPI tables"):
>> But the buffers obtained via libxl__malloc() have no association with
>> guest address space layout (or at least they aren't supposed to have).
>> That's solely determined by mem_alloc(). I think it is a bug of
>> mem_alloc() to determine padding from alloc_currp; it should
>> rather/also maintain a current address in guest address space (e.g.
>> by having separate alloc_currp and alloc_currv). Not doing so leaves
>> us prone to encountering the same issue again down the road. For
>> example if higher than page alignment was requested from somewhere in
>> libacpi.
>=20
> I think the two of you are saying roughly the same thing here ?

That's my view of it, indeed.

> There was a question about how (and if) this should be backported.
> I'm afraid I don't quite follow all the implications, but I doubt that
> a a substantial overhaul as described would be a good idea for a
> backport.  What is the impact for backports, and can we have a more
> targeted fix there ?  Are, in fact, Kevin's original patches, suitable
> to fix the issue for stable trees ?

I think they are; the risk with not (also) backporting the more complete
fix to do away with the bad assumptions is that eventual subsequent
backports may then run into the same issue again. Like Andrew suggested,
I think we want to first see how intrusive a "proper" fix is. If it's
really "bad", we can still decide to backport only the original change
(which I'd rather view as a workaround) while trying to make sure future
backports won't end up hitting the underlying problem.

Of course there's also the option to simply declare "future backports
here are unlikely"; I wouldn't really like such, though.

Jan


