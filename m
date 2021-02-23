Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188B132276D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 10:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88644.166786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETcz-00033j-Ow; Tue, 23 Feb 2021 09:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88644.166786; Tue, 23 Feb 2021 09:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETcz-00033K-LM; Tue, 23 Feb 2021 09:05:09 +0000
Received: by outflank-mailman (input) for mailman id 88644;
 Tue, 23 Feb 2021 09:05:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lETcy-00033D-AM
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 09:05:08 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 981a266b-80c1-4f16-9973-5262a013fcef;
 Tue, 23 Feb 2021 09:05:06 +0000 (UTC)
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
X-Inumbo-ID: 981a266b-80c1-4f16-9973-5262a013fcef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614071106;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cU1FUb/Uw0Edow3JzmDgNyE+SR+cQtbnmvgWCEyYwFg=;
  b=hklGtv8k7qWckC8C6QCwpHVyFjYF2qn6TuhyS8/21DS5xzjilR+l3jen
   0WXupkU4FIzxu2EYIDrE+KFIB77kdoBPJb91rSs3UFBmuANNNuSNsViAt
   Iwma+yi85CdsweRQQI29fha71UYyFnnYYCjxK/wQo53MCXEM2ZOwh+KYj
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: M/I3PTqTXbnsMlA8ezvsCFtjpmQH85JW5dnmNQgkH6rTlMCB3qNQF3IcNp6QNqyQRERTAQieM9
 h0+s9ik0kTbyk+OumtIsgQv/alufkHp4UL974mxwpPHnPrr7wEgt8tJ69ONZmCjcyd8z2nTZdV
 0Or5PM3pvluROWX0jeaMWsy+kXT2ZEyD0rbhKdvubGt51U1HJhN0xJ4SImGtSPlAfcd0IDFuVI
 haP3ohV2KzL9YwotInHdTdea6y0wkQcQelxkMaiTwr0rCw1+rnm8HzoSlqrflX+kmWtslrYhxs
 42g=
X-SBRS: 5.2
X-MesageID: 37999006
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,199,1610427600"; 
   d="scan'208";a="37999006"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZ78wjoxlwjq4LVSgD3JDXqLM6Vh9+Ix3GF1Ozue7iYjZqUmLHAR1aO8vRLvG17cT32Vj2F0mCcVKpvKyDv3r5aNEEx+tnIdW5XgnAPLo77rWCE4BFgS2TL0J+52VydapOZsE5NeUYnk7H4vVYuxE+wAoDmgH8ZFfQ8hW3ko0HCH8gq/q9J5EjyaESTZQIAIgL2i9CNPhNzCOnAejxiarHBlnX4/UcZjIl+QUnb9qfblD5Z9EPWt3PwT4hjwtNYAzQ9FvLWyXuLbWMkP9I21pG2sTcqp8c4riSkAr+g9PFmDrv4JmCIWS1Ctt7uHrBJalJ8cRZw5dJM4PtvhO/DEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b08gw1GSwvJDwx5bQPJTl/PIeuA89t3a/v8ZhfhOjow=;
 b=jWx8IFLC+szq8Cmn6a5OEy/koO0G1+hrFr4aPHC5WNlINKcoVwQ0irKyUxNdNy9nKCnphAi0BGLlvRuSYNTX7GYIb2UsU60s/UIlkkZPPpEiYCSrk4gKmNJBjsqDE63JmVWgao2ivxLjWQamkMzmGQp/sxNZeaISonWrx0JdTChwk10vk6sUDE0JxXjUPX1Jbi/1F72AROiV/W7hBp1Y6mpo2rhJ3nMOSucLLvQHhHp3k5lvbJnXCuaK1gd3/v78lXgkMu1bvkQldkli97RBh+b2IMDtiorN1Gi0mP8DzY2kSPGmjscLY0Q529PlgSrIgF7nhyGYAU6eRJ6toh4aOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b08gw1GSwvJDwx5bQPJTl/PIeuA89t3a/v8ZhfhOjow=;
 b=w99kfavP0oZYDjIWdhCgOE9dnKU93yjQVW40J4Vv+NerzBLWFlmtV0dOxEpLiIYZMBTdv7jR823BYty+wT0xFRaEN/tY0m7grp3KLntXqSZZOuwKmwWz2uYP0kWJXDhrCWfgyHgv+dOyYiS8R99RLHQ/01dd7p0C6UTaXYLn+IA=
Date: Tue, 23 Feb 2021 10:04:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Daniel Kiper
	<daniel.kiper@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/5] xen/x86: add some addresses to the Multiboot2
 header
Message-ID: <YDTFOD4jdE90fZ0/@Air-de-Roger>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <35ad940a3da56fc39c9f24e15c9f09ef74ad3448.1611273359.git.bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35ad940a3da56fc39c9f24e15c9f09ef74ad3448.1611273359.git.bobbyeshleman@gmail.com>
X-ClientProxiedBy: MR2P264CA0124.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75906212-4390-46cf-b1af-08d8d7da1b05
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29236BDA5BF4ACA463B243CA8F809@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mXxDyhBdyf/v6xsWjs9THhGyGDCvq+kA5BUe3XOVUeRWaicwI0UwrTRiozUwKp+bnupPoT4ciMtmFnpD+evXPtNthfAP8HOhMoSSCT0hEAAQhunTgDU7wwAkFZOorxofKLlht0qjQ6XGZuizfGd3f9nQsw5Y3YNCpwtySjakqh4O4Pee4JiDQ6NCPxkXu/sW3op/wo72oo81T283eKz35tmAh+IF+teMuzgnDY12veIYTOTu2Md1JAIdYb8XZOWkDcVyIcRBZD16xYHHz4ZznDk1CzKtBUWpz2JHrsDiGocQiHiIK0vFUV4lBDyN2m9sSAHAL2JGGb77HhvgJ4UBidHCDCNxBnRKtYmZlOX2M3CSkU0Tphkmg5QG0Nir0BMZXHjk4nYzeQCK95rU0IMCVDbkI7LlxZBnbCdbNJID5TGKBhDqrp5kEowVl0z37XC/Vp4ZIb50XP67BiswgYRdbYVYmbWGFYLdAwAb7wLwy5sjMlk48r/jFuLPURv0ATl9cBGgmprgB/9Laybgd4Gp1xJ4jciiS+1LE0dYMTKEa/UtNxHLuwCuCa4H0A79rBjvCe3JS0W5j1N2Vxr5ZS+k0VG1oarxe4xAusjZxTZziSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(136003)(376002)(39860400002)(346002)(16526019)(4326008)(186003)(26005)(9686003)(86362001)(66946007)(6666004)(66476007)(33716001)(6916009)(316002)(6496006)(54906003)(6486002)(8676002)(66556008)(2906002)(478600001)(8936002)(5660300002)(85182001)(956004)(83380400001)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnVCai9KSVFyMFhqWVljTWF0ZXBpSzI3L0t3eFNCQ2lXVVhybFBTbmZ1UkEz?=
 =?utf-8?B?Uyt3aGo1NUl1QUdFSWZiSm9ZdFpuTHlVRElyNmlRMWM4WGlEakhRaUxyRFhw?=
 =?utf-8?B?OStKMUdLWWdOTzZFY3dPUUlna01Cb1VZZDFUNFpQbmhGWktaT3FmWnhwZTNh?=
 =?utf-8?B?SWZlRUxIS1pOMmxQRXc4dkdpVzZwWko1Z1RVK3NVZzhaeHUycEpLUVFwdmxB?=
 =?utf-8?B?NDBrSzVKblN1TUJKdFUxK1lqenRPelF0QUVRUmhnZ2srT3NHSnBEVW5DRVB1?=
 =?utf-8?B?SVBpMm5GQncwOURkeU9Ca2pvT0taTFNSVXc1bGMxU3RTTzRwd1RraHJTZmdn?=
 =?utf-8?B?QjJPcU5xVHE3RXdGMmN1b3B2emdVbTE1dURoSEgydkxWaTAyY1lXYW9aa1Rl?=
 =?utf-8?B?WTl3QlAwTXhkMEt4bUwyT3pqSzRZTCtZYitGRjVaTm41YUg0UVU0S0tEQkU5?=
 =?utf-8?B?UGNDZk4vWVVBcjJGd2MycVoveDJhSmZSOUJCdFAvV29hQWUrV1dacHhtaFNr?=
 =?utf-8?B?V3NpMGllQllKTDMxUmpILzdZK0QveXp1OXNHWnUxZTZlcm9DKzlLYVo1SE9U?=
 =?utf-8?B?UUkxcEFyY3EzOW1QcWxMa1VYM0RaR2Y1aXJNdElsVW5vVGZEUnFCTXpCK2hV?=
 =?utf-8?B?L3cwU053Y2RpV1QzblhpdThKRFdTbUNGMFN5WjVnVHBTRjNkdUh5b0FiK3JJ?=
 =?utf-8?B?Wjlzdkd3eXkvMUJ2OXRvSjhNOFBKN0JiNkJLbHRMU2J4NzdNMW9jZC9UR0Zl?=
 =?utf-8?B?WFJla1h6d010ZWZ1KzdxTmRCVnhIYk1vVlFNdXJRZy9ybStpV21oc2dYK1ZO?=
 =?utf-8?B?TThmSWFyRDM5OWhmNVFxSlQ1bUc4SFAvdzJXMXluaTRnM1BsWE1jV2w5VDNQ?=
 =?utf-8?B?dm1NZk0veSt2VWRzUzNEWnEvWFEzQlFJN3NUc1c5cUZhelBNUDIzeU1CRXFz?=
 =?utf-8?B?MmdWSFhMMDZsRkVUODBCbEdXakdHOFFtNGdPbzJFU1FIOGwwY3RHaXlmdjBh?=
 =?utf-8?B?d1RiejgrOWdkK3RUeml6UjFENDNESVppNXVVSDVKVWFWNGo0a2c2Y1VJTTc2?=
 =?utf-8?B?Z3RTVENad2lCajNjOU5LcFZDSWRXdHhyS3lNUkEwbWlkQ0lTdTNsVWx6NmlN?=
 =?utf-8?B?QzVpSkhZUzZwZU5iUitmd0EycTcwM3UybStTazYvT0NJZGY3QXluQnlja1NX?=
 =?utf-8?B?cFg1NVZUaC81NWhKcldlQ054M0pxS2t4TkgyMDR2VWZyRHhaMVVGTVNIbnFh?=
 =?utf-8?B?SkZ6T0dOelNaN3J2VWVqSEpZeTdnS3FVL0picitJK21ETm8zWHdHVUpqVEVM?=
 =?utf-8?B?M3BpZXNjck11MitVMUtSd2VYS24vbVJLMUpwR0UwNkc4OU4rZUFoQ1dBQklT?=
 =?utf-8?B?SktqYldmeEFoV2RjbTRiL0dVMTJsSSt1S3FDVXV1anBJQlQzSFQ1bTBWRXFU?=
 =?utf-8?B?ajh0ekVDaXhjWWcrb1N2K0NTWDFTVmp2OVRFc1o3eVBHNGJoUkw4UTR4NEVB?=
 =?utf-8?B?RG5KVGx3Y09FSURIYU1CRThjYnl5a21nZzRTYjRublVuTXRrMnhqNFBhWjFm?=
 =?utf-8?B?dFdySytHNDR5bGFCK0M0OUoxVllPaXlxV29PekVhV2wxazIvWEtYT2NUQU9W?=
 =?utf-8?B?V0piZ0Y3aDhjanBLMEdFVFFCMVd4U3NYSWNaVXlzNlZVazQyaWlwZ3IzYUx4?=
 =?utf-8?B?cWljRHpDNjI1MHNMY0dUdi81YVpoWCtkYlhJSGZmeXlGUjZyZVVnelNqU3Q1?=
 =?utf-8?B?YnZheC91cExGZ1pKaFFHQk9rUlk0eEV0d0NKY1AwZE9pSjJ6UFZXMUpGY0lX?=
 =?utf-8?B?OVZ1S3FZdnZUTzJldk1LUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75906212-4390-46cf-b1af-08d8d7da1b05
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 09:05:03.1684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1vYa+uDhufouumOFutXRRr2LTwjaDLfZaVidrSR2Uqgrg7snv6dtjlQAUVufrga49X4YJctx1sv9GY66XIjMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

On Thu, Jan 21, 2021 at 04:51:43PM -0800, Bobby Eshleman wrote:
> From: Daniel Kiper <daniel.kiper@oracle.com>
> 
> In comparison to ELF the PE format is not supported by the Multiboot2
> protocol. So, if we wish to load xen.mb.efi using this protocol we have
> to add MULTIBOOT2_HEADER_TAG_ADDRESS and MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS
> tags into Multiboot2 header.
> 
> Additionally, put MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS and
> MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS_EFI64 tags close to each
> other to make the header more readable.
> 
> The Multiboot2 protocol spec can be found at
>   https://www.gnu.org/software/grub/manual/multiboot2/
> 
> Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
> ---
>  xen/arch/x86/boot/head.S | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 189d91a872..f2edd182a5 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -94,6 +94,13 @@ multiboot2_header:
>          /* Align modules at page boundry. */
>          mb2ht_init MB2_HT(MODULE_ALIGN), MB2_HT(REQUIRED)
>  
> +        /* The address tag. */
> +        mb2ht_init MB2_HT(ADDRESS), MB2_HT(REQUIRED), \
> +                   sym_offs(multiboot2_header), /* header_addr */ \
> +                   sym_offs(start),             /* load_addr */ \
> +                   sym_offs(__bss_start),       /* load_end_addr */ \
> +                   sym_offs(__2M_rwdata_end)    /* bss_end_addr */

Shouldn't this only be present when a PE binary is built?

You seem to unconditionally add this to the header, even when the
resulting binary will be in ELF format?

According to the spec: "This information does not need to be provided
if the kernel image is in ELF format", and hence Xen shouldn't require
the loader to understand this tag unless it's strictly required, as
the presence of the tag forces the bootloader to use the presented
information in order to load the kernel, regardless of the underlying
binary format.

Thanks, Roger.

