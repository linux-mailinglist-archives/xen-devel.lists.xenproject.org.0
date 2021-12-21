Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B347C2CB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 16:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250497.431451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzh2Y-0006Ag-7K; Tue, 21 Dec 2021 15:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250497.431451; Tue, 21 Dec 2021 15:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzh2Y-00068V-40; Tue, 21 Dec 2021 15:26:58 +0000
Received: by outflank-mailman (input) for mailman id 250497;
 Tue, 21 Dec 2021 15:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzh2W-00068P-Ui
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 15:26:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6db776a7-6272-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 16:26:55 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-0PjhxMOaNYK83CCD3TCJiA-1; Tue, 21 Dec 2021 16:26:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Tue, 21 Dec
 2021 15:26:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 15:26:51 +0000
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
X-Inumbo-ID: 6db776a7-6272-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640100414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQWJsX0rf/YZ5fDIJh5gdZSrZ328Ol8HcaJuwLfvPck=;
	b=W1NwQupLzuIATgKOZx+NB4kDOrDTxgLCgU1qq7JpnGAPlcDwGuoMhGO4ckJnpv9LNOp4Ig
	fvc/3oNmtW8qzIOW6zvaTk/mFa2R2rfGjTOZObfrLGhRLUL/i9z087W4JhXpGcfrvDC1gL
	TM+TzZ6MsYFLWFsd1owhl0tcx2nzoa4=
X-MC-Unique: 0PjhxMOaNYK83CCD3TCJiA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anOaOOHJNs1VaeI7C+4F4IHNT0NqCAoGdXG+r99sPaFSaT6akARVr5Pr9NFwaAyfD14hjqDRNkYo2YUj49cI9HwMrFkJLEE5zIKzhJPJ2P2pnMzjZxzJnX+842UoNZ6pE+FCs7QsI331WwNqvMgy4JQumzEz/JebOup5tfD/K49pJDKhMXCNBTtfzBcOIMz7Whl1zUlXiChNzKJvh18qTqx9/1WE+ZFIF6p9QxxpQZTIA9TLohPYpkx21Aan8gpGOrrTNWcZcZerFok1diKCznwxqa0eU8mTLCq2b0b8pNvF2rLxRNn9QMbPP+DEb25g95WRbvEmtD9TiQHHoVsXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQWJsX0rf/YZ5fDIJh5gdZSrZ328Ol8HcaJuwLfvPck=;
 b=PwJnWHPrQzIK9+AWWYHCx6GJVohdEFMqGaT+dIBB+q6VkxBe1uSWQSSjq73k6JurvVintaZpMl6ircLAVegYCZDtNZWBXm1OnP6NTHiV1takEt6zpr7I3OLXEGe7H0TB6EFlW54zNd+GTnfuqdwcJlkBPSNMKs8e0NFxP9HU4RNzCAwvbCX1awZ0pBH8i97EpyOi/9Yzi1jR0AjLzmCAFWbucE+25QE4WyOKD/d7FNOo1wPz/tpxOjazs6Dc1R9C4PaHrxpwDaw/MsMAz1KDBbUskabOTj3axkvNV7W7gkmo6znw/HxyvQbxpe8LR9fFXvGy00M3rtsuv3T2DH0Qqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8cde73b-0e5f-1b3d-c51a-9fef6092dabf@suse.com>
Date: Tue, 21 Dec 2021 16:26:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 00/47] xen: Build system improvements, now with
 out-of-tree build!
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Connor Davis <connojdavis@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Paul Durrant <paul@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0267.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41ea1a60-2359-4805-add5-08d9c4964f9d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447D5BEF5E9C310A0F97329B37C9@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bs0fenzOhBeT6IRkoIbGEdB9GQQSkAYjB9x0qdpz+REKMRWoWmpjDIpXfV8+fGe5g7loE1uaZvD6E/uASADORDHDR4ZiEnWsbR/Xn2xEqqhijrELS/PPUqje5LKe/VjbVjh4wV4MjglJ47rBjK5mkGh0OvbnqiQacty0EqVmesXmCPI0lQjC8v8ik+KsV7F2a4xK68zeChQThUDOztHxKbjXPRHyO2l2oLJMy6of6LZbgADg68mRhffVSOdAJ3OLQwLqC0au8L8Q13rxImmxRbLLJ6Mju93rLb9bZVam60wEZnH0529UVC9xH00IcKAE2na5CzMzwWOkoaptDm/y/YHLqWs2Eanfq/sk4nLlcGm2MkWTiV8cjasoS8f9P9rQXgSOMFciwNx+R3yPKd1UTyR46tJjgoQkc9biPPHMGonZxaUnykS8O/VVyurKrQXyF1p0ZW00MO+UZsgwfp52XWmFIp6phTh5ImKRth4hedn5Yubfe6oLdadXC0I3LhaUfE0gsfGxTocQZclBzC/4be/bbqMivg9JYGjnpcgd8oHeJHjeE5NIjFndWD2jAQKpLporQ0sLsaLAtdgaLbOCQj5aO5fwSwz9DLgroCTDP7N8J2xTfND8lybTzN7/ZaCQrnxwXnvfXfCgrQreL5Gr195/W9JF0YxgUfGBQOh8ghpQbXD/VpzxGiefg96ZcUqxtRz0kZotf69bygXSubSEKirUVnwk6tV5s2lO/ZXht8p7C5kp+YYL796zEEq/wueusjjFHSmhbKgdso/6+jfi3A9WmD4kC+wHM/boLklk3EVMS1w+/kCfgb4BbIAXiwxVKeBSMT7En4Hox05danBeDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(86362001)(8676002)(53546011)(508600001)(316002)(7416002)(6666004)(6916009)(2616005)(6486002)(83380400001)(6512007)(966005)(31686004)(186003)(66476007)(5660300002)(36756003)(66946007)(2906002)(26005)(66556008)(54906003)(4326008)(6506007)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTk2Y2haT3o2VkdBUlFadUJMcnlWS0tLU3Zqb2RYd0p5Y20wZU1aYkRZS3pz?=
 =?utf-8?B?cHhoMnJyWlNoOXg2TVQzWTU5NzhaSUlIV2o5Tm5obHc4MzlrcFprSjBWYXpk?=
 =?utf-8?B?cldaZUgvZzc3NjlEUFkyS2t0UEJxcEhIeUtpWm1ZNkpWT1lHdG9NVlhOUUlP?=
 =?utf-8?B?SzFXYUpPLzl3NnRHTk5oSDhGV3RZek11MTB1bE9OZFlzbmpVQzNxWCtudHVP?=
 =?utf-8?B?aTB3Qjh0WC8vNXVjcWQwWENQNVV1dVl4aWN4MzBqbWNTejJ1bTVrZWNMK0Yr?=
 =?utf-8?B?VWRGK3RnVFJ4K215VHh2anZCRkUzaGMzNit1UFZqRkZKVEFjWWtSWlFwWFhE?=
 =?utf-8?B?TDdiaWpSVDNHV3paRFAzLzdSWVgwWlVwNnMwUCtFMVZLb2JFNXp1dHFBUWVu?=
 =?utf-8?B?aDNtNzFoQWd1TFBQL2Z5NXN0aDlLS2lmNXJhQnRobGpKcy9RR3V4NENlWVpa?=
 =?utf-8?B?VFhYWTVZZXVUMXhoemdHblVPQUNjQ2pDblhkSGMzN3grYTN0aWN5NVhKbEhy?=
 =?utf-8?B?SWg0VGZQaVhIVXA0NnMxbmNEVEZFZzVGUDAxd0VDdjJLQkc1aVczRkM1emNi?=
 =?utf-8?B?RVAvWCtEWllvTXRoZERINndDbmQ1NElTdzdhZkIvZ0xIRXN3a3lidWlLUjZa?=
 =?utf-8?B?UncrcU5tM0pidmE2aVZNQW9iNW9tbnZIUWlSRUJzRmROVEdSclBlY2lnMmts?=
 =?utf-8?B?MWhCWTVVdmlWLzBWSSsxRUFTY2EwK1JPaXNpWFp4NnlTc2pseXV1UFFUUFg1?=
 =?utf-8?B?c08rNU5jM3lnRE9UVDFhcUc5SXcrMFZSNjc2S21sMng5Mnl4NWcrSy9mS20r?=
 =?utf-8?B?dlJDTUF1MDlJSFZmM1E3M0x5ZTdnNDBaeVNGWlpKU2tabmw3TFA4WWtDZFNz?=
 =?utf-8?B?Rjd6YjZ6MnZXb1lGclkyYmRVNk9DbGpMKzJBSG1CQWoxbkN1bUR1cFR4aWg0?=
 =?utf-8?B?c1dJNjJvZWtMUkRneHgwaWo2RW5HQUIwZm9hWTBiK1hsZGoybWRTOUFJc0xj?=
 =?utf-8?B?ait0NVlSY3RuSU9mTUlYa1JYcEU0VUdaY1R4Q0NoTmRNeUxId1libE14bGx5?=
 =?utf-8?B?VnpuZnBvMkd0SzlrNXVvQmJ2YTN5QlBYUVh4cHlRaUdtVkdmS0Q1ODQvcTJF?=
 =?utf-8?B?ZUdZNlNacVg2TEdXcFB2dklMdkdTYkcrOGY1T25DWUVSeUR2NWxBRDFSdHhW?=
 =?utf-8?B?eXpvdDIzR1UrNVpmNG5vT29hQnpLT1Q2M0w2V1h6VzBEaFpJYmplQjZNcHlH?=
 =?utf-8?B?VTFwT1pJN1JmTGRmcG9SOTNGWFRCR1UyTi84b08zYnJiQld4djA1R2MvMXpN?=
 =?utf-8?B?TUhzaVFFZFZTL1lydVlPdEZYa3hIODJPamViU3g0S0NYRG1WVGhDbjFWQWdq?=
 =?utf-8?B?djVQVklMcjNCT0tNUDllUzhxQXhWRjN2c3JFQlJBcU5Ia3FSWTdpQm1HVVdZ?=
 =?utf-8?B?SlV0aEtFelhUWXB0bzNySTFKVnI0YzVyR1FyWlB1VzNHT2xKZmVQZWozcHRy?=
 =?utf-8?B?aW1iSEs3OFdONVorL0tXM1RhUlhNSlNEbjF5akpoYnlkTjc2MjE1UU0vWVV6?=
 =?utf-8?B?RWFVR25DZVVtWkF0bWJhNDBkVG5hbXVHSkd0dXRaN3RZc1gvV0x0TlBjWkVm?=
 =?utf-8?B?UE5leVoreE5nY2tvOFVwOGNMOHFJVWNGMDREUDFLWjRtUysxaDRyWWdxMmdF?=
 =?utf-8?B?cDd6YmFTM0ZudU1iTHFmN1gxSzYxc3lwOS9yZjFuc3hhV2tsdHdPWUtFaEg0?=
 =?utf-8?B?OE1OOCtXbjRSRHhWMGhTZzlvbURtdWVVV0YwZkR0ejBoYjBaZFQ1WlQzRm5r?=
 =?utf-8?B?ZU1ibk9aVUNEQUUrV2JEZDFXeTNJcVdiV2hrNzZFVGFIZG12WTlaQ1JOelhG?=
 =?utf-8?B?OGZYWlZicWw0YUdNd1ZOL2JXc2QyQUIrdkxxZVZwRHdIdnZNSlZyMWZtenpO?=
 =?utf-8?B?K3lOQVF0QStTOEtMOGN0OXQvZWd5Ump6VmhEeERnQnE5SDN3QitvYVp5YUJx?=
 =?utf-8?B?bm4rRmUySU5IWUJaaE04TUs1N1JSN245YUJCc0JmT3FsRjI1QzhLY21aUzVv?=
 =?utf-8?B?cTh5ajc0MWtQVklHdldRdEMzYU95Q2VQQ2ZRN25IZkdaS2VmL1BEY2xDQjM4?=
 =?utf-8?B?SXZ5UmcvbzFBbWx0WHMyNG1uUGRwamtLUHRDemFjTHljRDZPMW1lRTlxSEZJ?=
 =?utf-8?Q?yBls3QHoMxNYKlmO31fuX2Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ea1a60-2359-4805-add5-08d9c4964f9d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 15:26:51.1436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdDRUEd4jKx8Kt79PMbID0Eu+h8rv8r3SpP6h5AFJpZrPUAqtWGnRN6ZIwyArv/ZHMOzEXeY7v0Hka4oyvTRuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 25.11.2021 14:39, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v8
> 
> v8:
>     Mostly rework of v7. With many patch already applied.
>     Some detail changes that are spread through many patches:
>     - `make cloc` recipe should now work throughout the series, update of it is
>       done in 3 patches.
>     - new patch "build: fix enforce unique symbols for recent clang version"
>       to fix an issue with clang.
>     - introducing $(srctree) and $(objtree) earlier
>     - introducing $(srcdir) as shortcut for $(srctree)/$(src)
>     - introduce usage of -iquote instead of -I in some cases
>     More detail change log can be found in patches notes.
> 
>     Also this v8 present a work-in-progress of the ability to do out-of-tree
>     build without setting VPATH. This is presented as an alternative to force
>     use of out-of-tree build. As the last patch show, it allows to build the
>     xen-shim without the linkfarm and we don't need to make any other changes
>     to any thing that build xen (osstest, distribution packages, xen.git, ...,
>     and developers finger macros). The patches are only there as WIP / RFC as
>     they were some concern about the usefulness and extra changes needed.
>     We can decide whether those changes are good or if this is too much and we
>     should force out-of-tree build for the hypervisor.

I'm afraid I'm of two minds here. I don't think we want to force people to
do out-of-tree builds, but I also dislike the idea of mixing in-tree and
out-of-tree builds. Yet reading the above I understand that the shim build
would conflict with an in-tree build because certain files would be picked
(the shim build being an out-of-tree one) from the (dirtied) source tree,
rather than the shim's build tree. Perhaps the extra path prefixes that I
commented upon in an individual patch are then indeed the least bad route
to take.

There's one compromise which comes to mind, but which may also not be
liked: We could simply fail out-of-tree builds when the source tree is
dirty. Then people wanting the shim built would need to use out-of-tree
builds also for the "main" hypervisor, but people suppressing the shim
build anyway (or doing it separately, e.g. using a non-default .config)
could continue to do in-tree builds. The one puzzle piece I'm lacking so
far (perhaps simply because of having overlooked where it is) is how, for
a full-build-of-everything, one would control where the xen/ part of the
build would go _outside_ of the source (sub-)tree.

Jan


