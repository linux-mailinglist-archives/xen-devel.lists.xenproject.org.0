Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB1668DE71
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 18:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491355.760437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPRNQ-00076i-8m; Tue, 07 Feb 2023 17:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491355.760437; Tue, 07 Feb 2023 17:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPRNQ-000748-5e; Tue, 07 Feb 2023 17:03:28 +0000
Received: by outflank-mailman (input) for mailman id 491355;
 Tue, 07 Feb 2023 17:03:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPRNP-000740-7M
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 17:03:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55f92e64-a709-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 18:03:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8050.eurprd04.prod.outlook.com (2603:10a6:20b:246::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 17:03:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 17:03:15 +0000
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
X-Inumbo-ID: 55f92e64-a709-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhEiHP+d7cu30HwJ76/FVeECl5dIxSKq/OA8OuutYzpN95hMRXj+6wl8uwpQdtMz/2LpSMTJlapxmWVz13Lvqz+qHMB2wCiSPCXIg2y0sDQ3SOfyS/gpgpc8GnHEUVlhhbwSqMuDC7uOvqclv24wM41e+9mspQuylqHl89X0oSic4scfEYG7SwaCdu72KJc5wcG9W9zyLajsNE1XU6KQqDlgav3o12bU89cqdzs7/cuGORsjFrYyPAm/njetZUmxBXSv0RO5Iy0heLmUQmb6pH1suVKpCozP/Ke7JAqifIsK5auQxNQyM4k/0XZMnpj05MLFEdNGETyz+24U80CKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZQne71/nFBvKBvkD5NCdgH85tSHAsKxkKvctiFAPqY=;
 b=gsQKb+WtVlaVupIAqCVSgd6Qw52BUia/W8hE2CSm3hAa8e5+cXW/XQgi635vO0sX3Tm0J7xqQWs2gmb+VIHnLRGH3/km4qruamhck8Lh0D75UtSpHvxBY0AiwW6FmxOLfB+skAg5i8P04XFcgFqKhQVApo3jVRS3f8hz1D/b6MxZq9/ee2c387ihJ9LvzxxyVP6lUZipAuVrU5SwT+S3XIa0+qyPqGHo1VZeO7rqmxZqE4KyUhGBxzUYYmL/CmtcXt4Z9rV6Ry8U/z3J5+FMA6lrKFds2vd1pbk/mzmx2gEsZn+hqKRnVabw2RGYE8IXprOmYzi2591ii5T6p0LNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZQne71/nFBvKBvkD5NCdgH85tSHAsKxkKvctiFAPqY=;
 b=fblDdqQeb2180id3aO//hwb/83EIHXuQ7/rASXjDNXwjhlP3KgXw4n4Skux4BGckx/EzIVbUOIXPsK4QiZ6FJnFCbGJToyHJX0OYJfECDPgl8vxDr3RK1z7eMevLKlzNpX2lDCvPp1cPKfgl9o1s5CMUl+qE3r3frJgqxl2UBILxpxM+oxAyrnZe4SQuV2ABvflAyD5gviquY3tqb1EMeFqOWtHxdM9RuRpTUQ+FmLG0H0YbClbP+4i8s7R9oNfLvqFwwR3aUj9dV6LdCvy4YIsCVSot5nFNw+3gF1oPoNeZkU3oW9YV22imGsNXzWPd7uaqL7sR+b1dovpK4jw7lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a11b962e-7422-a197-4ff4-fcac9963364d@suse.com>
Date: Tue, 7 Feb 2023 18:03:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH] tools: Have flex and bison mandatory
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20230207160948.3169-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230207160948.3169-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8050:EE_
X-MS-Office365-Filtering-Correlation-Id: 0054f43b-97e4-4b4f-a76c-08db092d33a5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NMutmlJ2nAbfxWYOFtp3fHZ60ZaXyV2SLj4jby7nqsZhNoJbFwRJDjC7Kv1mUXxSHz7KvAiBa5qBQfXowsfFH54km3ZI83XPfyZvmPtBqqwSQRKXcJ6fdgrli4000jf/ZjKR75syyQkYW07K1K1+dKfStt97mF+34PCl3od4ONpEZn/svkQzVR5zCxsoVR1edyOCWuSEsJDdccpWIH0nIuCp5quM8ZqGcyu9b3KCKKe4yguQIKHVgNBZLhqkAHK/VvekAgLUASwXw5xh7+WLLTMzU/FLW9BTebmDF9upU73NypcaBPv6Z9Z4Z/gHKG7bUvaJ1Uxlqj7IShDMBNFqgK4vWu1qpOibEAyx3R93fY1SIzU7a50Htm4TxJt8Kj0PtxEdYwj2Kzm+MplL1QPgC8UpXzzvUhR3is/QkUILvv3qY1XdXlWWFfvPotj/d/sz19K2oOVlFq2BmMRjlr1aeQytPWhOHl2G+N5MbPf0WANBsull+FvQ4MG9t8sE2SrseflJsfYIbXx9Cf0lhOHrdRMu4ncVNkKveYGSK1hb1QzDQ3WWhbGmIHT2XY4Ic3sVulXinp1j8Z+ONBlkV1F5u62Pm+0Nb4KFhtRvGOiN9Sj7UJFBZrlhaiD2WAj1jJBGDwgoj+/NrLn8BL6hUMSzOhAk1HMcR2NGmcd+kmWSZ2OxC4O9KtqBgJvtMi/1cXCaUF23Z5i77OsQ8WrhKQdxCbFxi/Yra7Z0aMJ6xIl471Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199018)(5660300002)(478600001)(31686004)(2906002)(54906003)(316002)(66946007)(6916009)(4326008)(8676002)(66476007)(66556008)(6486002)(6666004)(6506007)(6512007)(26005)(2616005)(186003)(53546011)(8936002)(41300700001)(86362001)(38100700002)(31696002)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXhvMVhyTEE0M3JDeWxWdlFTemZmS2NOdzVlOFdIMlZ6K081WTNGZThva3dX?=
 =?utf-8?B?UDdBaEZLSS8xZjJpUUFaZW95LzFEdWYxM1BJNk9Fc0ZLUHU3cE5uclRlUU9z?=
 =?utf-8?B?cktrWTBrZWJKZzYyemx3eUtxbTNHL2hlSEpaWldTZm9LN0czOHpSbWdZZUJJ?=
 =?utf-8?B?THQvWXhhQmw4NDFOM3dMY0NsdFJTaktFRGRjMXYwZGYvUW5XRGcrMkd5dzQr?=
 =?utf-8?B?c2dYMHNIZlUrWGxxTmcvTFUwYS9IWTQvYTNXcEUxU0VZTWlvVTl1WE8wV29N?=
 =?utf-8?B?enYwT2l6Q0FVenVMZWJ0K0F6QVhBZDAwcXpMRDRJamNYUFRLcGtMSjU5TWVu?=
 =?utf-8?B?RHFqdzBycElqMG5MSFRwWGN5MktTK2RsRXpURmp5RzRZMDMwOHZ3UmtGV1Rr?=
 =?utf-8?B?VnJ3MmdrbE1YTzNDRC9uRVVpZFh6dHUzT2tSNEtWWWgzNGlEMkdsb2RiZUpq?=
 =?utf-8?B?R2svMGlkb2lWRVZlanRIbkE5dGxqR2dSQVhwNWVHdXFrNldvT3Axay9SaWNC?=
 =?utf-8?B?RDdJZVJLeVhxSmpYRDFKaFNpcGZqcjd1MCt6YTNZVG1DMUtaMnEvQVNxSDl5?=
 =?utf-8?B?c3YwUGJWUTBIY3VscWhrS2tLclhPeGdkNWloSXJlZEJEMXlOOGhtNFlFQXZL?=
 =?utf-8?B?RG4vaEtTVUxmdFJVREQ0VkNZK21uTStxNHNEeGxKL1JlRFY3cXZNeFc5YnNp?=
 =?utf-8?B?cEdLT2FUQzVGR0xYSDdhOTNQNU5MbEZYRHh4Sm12dUFZUDVBNXdzWXloaUxV?=
 =?utf-8?B?ZkZKR0w4aDJUdXp2cUUxSnAyK3dLM3BOb1RwUHAvWXh6TXkveCtPNDcwQWNk?=
 =?utf-8?B?Vm9udy9idEJZL1NPSTdhVUVmUlVFb2hjeW95b2RwZTF6bE9iWUY5WVVCaGda?=
 =?utf-8?B?UWpLYmo5bjdnRUtJb25iWUtRL2VkWS9VUGZYWmpaSlQ2QmdhdzFTWnpvMzla?=
 =?utf-8?B?N3RncEJxS3JvODJtOTVjdloxeWNXZFpFSmh2SDI3eUVIVkxXZy9hVituTGhU?=
 =?utf-8?B?WHN2cGlacmN2ckVEeTlvOER6UlR0VEtvWm4rZFNlUzJkTnNpelpjSVAxN0pP?=
 =?utf-8?B?VTBzSW15eFBjN0szdW1NdE0vcmdzS2xINGRRdGdSWStFcUV0UjFLQlZETzd2?=
 =?utf-8?B?aVg0Y1NlVnBjcGpnb1FpSTdvKzFrN2x1VC9jWjVHMHJ0ZmRKdzRvQ2EvU1B6?=
 =?utf-8?B?Nm1oWnZXUVZPUXJ4YXVFY2J0QVlvR0tuamdKOTFqS3BqUGl3UDc2cjJrUit1?=
 =?utf-8?B?UFdVVzFBQldMSWhubng3YkJFMFBpdlpnckQ1cnZ1OEZXNFZITHNla3dZdjNR?=
 =?utf-8?B?TVVnMHJFeUxpQllwVmgvc04ySWNNWTZaSktwemNNdm9oOW5jckRYeXJVeHNu?=
 =?utf-8?B?ZlJUSzZHUU9nQTFJNTdkTjB2U2lnTWhxbEZhU2htWkxTOHNSNXdqNjQvMWlm?=
 =?utf-8?B?dXV6aXF1d29zelkxOWRkeXFMejNsT1EvWXJQU3ViVmlqSnZiQStvOWcrQ0VT?=
 =?utf-8?B?NHVtaWszUlYvTkRjMW5zOTdXRkhXbFN4YnNmVjF0NkFBLytTSG5nZWk3ejlw?=
 =?utf-8?B?SlpFUTF2dXpHdW96L3dseEpSckIwZGlXZnMvL0dsMGxUOUJvSlZIa3UrWHdE?=
 =?utf-8?B?N05lWStKVjNhWmVobFJPRGVNOEYzbXhzeVdYaHFTWVBFSjQvUzZCOW5ZdjBS?=
 =?utf-8?B?NjJYeDUrYm54TGNudnlxQTJHLzhMdG12VjB3QlpwNE1VWmpJSWd0aktjdWll?=
 =?utf-8?B?dTVlb043ZVlyQWxLSkxJa055MHFFcThHK2RmbVJqU2dkdWc2Z3psazlzOHRO?=
 =?utf-8?B?Z1YvRFdBVFFpVWJBcjZkeHMyRllydXRkTkRDaEVCYXJ6K3pZK3NJcnQrZm9L?=
 =?utf-8?B?STVaQXZoV05IeUtFc09MN1czazB5eko5WExVaGViajd3ZkFJWHIzTHJlelUv?=
 =?utf-8?B?K0RydDZxaTBKRUJxdExmSVBYaTlPOEliWnZBSEsxNXhPZWxJWnB3UnkzYWFm?=
 =?utf-8?B?L2h0SURoV0NhVk5nNzlCM3VKNmI0bzYydDdzb3lDZHRQaStQYytDdG1pTFZG?=
 =?utf-8?B?MGRZTkZ1emEvVDN5ZGQrS3JaSWtYRi95Qjh3M0JzNHIvQTBPcVg0bWRQQzkw?=
 =?utf-8?Q?y1TrzTjZGLZ6OmJYPUpL7Xuov?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0054f43b-97e4-4b4f-a76c-08db092d33a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 17:03:14.9448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OJ3NCsroYMEFp6DuDx8lgfeZwzyyNjcQyZR2pj5DSwGKZ6yu7ULffNYuwvw5ruPqYMPqOpCDTGhAbOndL73rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8050

On 07.02.2023 17:09, Anthony PERARD wrote:
> Both are already mandatory to build the hypervisor.

I'm not sure this is sufficient as a justification. From all we can
tell even pretty old tool versions are okay for kconfig's purposes.
However, pretty recently I've learned that some linker script language
construct used for GNU ld runs into a bug in certain (old) versions of
flex. Use of that construct will then cause an (almost?) infinite loop
in ld. Therefore the question is whether libxlu's uses are immune to
such issues (along the lines of kconfig apparently being).

That said - I'm happy about the change in principle; if so desired we
could simply see if anyone ever runs into an issue, and revert if need
be. Nevertheless I'm not convinced it'll address the problem Andrew
had noticed in CI (and where the consideration to remove the generated
files originated). It is likely to mask the issue in CI (simply
because, aiui, there are no incremental builds done there), but that
won't prevent people running into it on other occasions.

> This will help avoid cases where the *.y or *.l files are been updated
> but flex and bison aren't available.

This is odd: How will this "help"? Right now the build ought to fail
(it doesn't, there's merely a warning, which might be easily missed).
With your change configure will fail when the tools aren't there.

> This also remove the way the missing binaries are been handled, with
> double-column-rules, which might be an issue sometime.

These double-colon rules should never have been introduced. Double
colons have a different meaning ("terminal rule") for pattern rules.
In fact they were my initial suspects when looking into that odd build
failure in CI.

> Adding ".SECONDARY:" to avoid "libxlu_cfg_y.c" been deleted by make
> when building the library, and regenerating the file on the first
> incremental build.

While probably okay here, I'd still like to ask: Are you sure you
don't want to specify the files we care about, rather than applying it
to everything (by leaving blank the right side of the colon)?

Jan

