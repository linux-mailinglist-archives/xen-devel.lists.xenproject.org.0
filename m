Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C0339CFA
	for <lists+xen-devel@lfdr.de>; Sat, 13 Mar 2021 09:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97470.185183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKznM-00040K-Tn; Sat, 13 Mar 2021 08:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97470.185183; Sat, 13 Mar 2021 08:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKznM-0003zz-QO; Sat, 13 Mar 2021 08:38:48 +0000
Received: by outflank-mailman (input) for mailman id 97470;
 Sat, 13 Mar 2021 08:38:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJcc=IL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKznK-0003zu-TW
 for xen-devel@lists.xenproject.org; Sat, 13 Mar 2021 08:38:47 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8af9ec36-a04c-4965-aa4c-41e61a04f093;
 Sat, 13 Mar 2021 08:38:44 +0000 (UTC)
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
X-Inumbo-ID: 8af9ec36-a04c-4965-aa4c-41e61a04f093
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615624724;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=At6zORnsaDZVTnHRQQPeCyeV9TYUP3rdLONoe2WSYVQ=;
  b=UxpFDhmHEkTQo6qNFW5010GwSVQhOUYtxvsJUQdeCzLRNkv8RNO/8QXp
   Gn6VbO8tL+XGbvtbKTJ0BPelesBYe5oq7VkRcou5zO3VksU7TlYeXawAr
   ZXlnR+JTr7tFlHETVKrzIBlhS1PG/5NDtKCfNeWNWRNbVnj9oqCHYs+9b
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7L5Qxwlrr1k5vG7vLmNHHQlKz+KMSYJZyEGO1sl/rqyXenr/8w3pgADdmOBlBaYJP1QavJ4xYY
 g2Wb4/wplJpnh6rJWrJcHr/vfrhJxkTHf9bPgP2XHAmL8dm5AXhA9+cxuAQ91ThaLo8c6KUdMx
 cMnjpuPeX9efn8sAdGOmlsUD2Ap3JsZPoNwSwPa7f3VB70bhwT+0fHM9Ark7jgLWEBG9S/B1b4
 brhi5hT+xqn8B8MJDgdq4JbbC51gwRinSwFfvLdgQm+O8ikwxxsnn5lVRPWst/7WrreUiHfW8v
 Cws=
X-SBRS: 5.2
X-MesageID: 39386728
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:44l+RatsCcAHRj6MrqGXLkq37skDidV00zAX/kB9WHVpW+afkN
 2jm+le6A/shF8qNE0ItPKhHO27QX3a/YNo+oV5B9yfdSTvpWfAFu5fxKT4xTmIIUPD38pQz7
 1pfaQ7KPCYNykYse/f4A21V+kt28OG9qfAv4bj5kxgRw1rdK1shj0RYmz3LmRNWAJECZAlfa
 DshPZvmjzIQxQqR/X+Kn4ZX/XS4/3n/aiWBSIuNlocxk2jrR7A0s+eLySl
X-IronPort-AV: E=Sophos;i="5.81,245,1610427600"; 
   d="scan'208";a="39386728"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6XlINfyCLi87pbG2uMtyAL491iZymEHnd3TGp+912k8BeZ3QfK2crYiextgXaaLHjDJS4JfmK0dfUAmlAcTAkuIExhFrhsRyEzWlECcxfknbXaNZanu0LjBn4Rt7aZjTreOgjecN0NARcocgzgZvZErpihCCLM5of+5VA9gC35YZehTA4h9Btu0/NOvwTei2a2IpuVPBeELnyhe3xUoubIVAU/XP3Kij67r09NYujGJ/uG8tIqcRoUm1R7XdaNbVG/zo8+Zjye92ftiUfiABSIjoYJ+Px0zmnfICkO97k7jmePRicF/p8Unp03JqKXk/UkPXqscBz+IVQ9eJgZE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dFlE965mmiTezsqVvDlA64nAs1eIQ7UUCYtINJGmHw=;
 b=ACLCiI20GRcM/oXrHYd+TNHMERBaaMxEOPv9nED513+4k3rOfPWMwDB9IWjOYvGK2yjd//xjgRHABLF4ynFrUfbrzn1S3TREFf7RjJBiM5h3aM+yZxxyjthdVyts3aKzPeSjp/nf9RvEcfNJdIvqYzFLOIYtLVn9hDfjhKdO8b/P1iFlHI3nI12hvHvqmHa8KJMSNdpm/FR+V6WsgOcvyPGlzfLyRb9tszgcaAQC7ULDmKJSmt6tmPwZuLlEJ/IAs51VE87oywtsBUpjWdSMfSdIzjGYpFEZ8ec9HmMhyYElojZOtmkXRRXhehvOT5drCXciGcgPnDPVZ8+yx2jsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dFlE965mmiTezsqVvDlA64nAs1eIQ7UUCYtINJGmHw=;
 b=GHeWJwORFPV19ERlbqpM7Fwpe3Y0QWPJoRuQt+4SlTmR1t6uWGkqsK3X6Ku0UsXqCGc3cPwab9337oerF2K1sgNZYLRvKU8Wo2dJ+j5WjmXQvKWPXwQa0wpzgu+V0hRsYb1jy8GTktVYyZhlp8q/Dq9gsctL8+TTyTuTHr93Z1g=
Date: Sat, 13 Mar 2021 09:38:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	<piotr.krol@3mdeb.com>, Olivier Lambert <olivier.lambert@vates.fr>
Subject: Re: Working Group for Secure Boot
Message-ID: <YEx6AZRm6ja3f9qO@Air-de-Roger>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
X-ClientProxiedBy: MR2P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb35430c-bef6-49e8-e3f6-08d8e5fb62a7
X-MS-TrafficTypeDiagnostic: DM6PR03MB3484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3484AAEB39617A8DA0CD87C58F6E9@DM6PR03MB3484.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8GM0159708LEifPP6B9V5I+T1LGXpixGDqYdirPijkPd2aPd2jperE6hqoQOMMH/tAYqnpM96HDZMJS5eghWwEnd/JspDSLORbsZgVRaG7S5yzRV/Y0LHMt9RCaozkplRe5iwpJY69BF2WE0Rsm2emM81cvOqrT3GkKdEl52lk6aSf1yPn4kMSgDwqu1FPdOcNH5dYP9pgDYlxYdnhnXaroFqz67CaaDtHRP0G0PAPGaQt1vjOJB2Jb9jr6Dh4p0XvX5ltTQpnCUiVkXYL1uYy9NPYtbhaLy26jdWVUF5hbBlq9lw1mwRdOWh1FtCe0Omiq+bE/dgxrT0w/6kwPetICIifNoBNtzoG73f02WuR3LrUFlYTZKvYClfPGPxB2RlSuCtsoNGFUrHdNyP5/fvfw1uJb7tErNf8qbTyfJ0SzR4xWCBTqb+x8Oyk2ATTkSBpD4mbv0A4ON77n026WT2x/MvPCqh+iZJ/kiV0ppieKtY+H/p0OZIW9czydmyzFvTCleCfBh/4hjeLPuaQVHPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(376002)(39860400002)(366004)(136003)(6666004)(4326008)(8936002)(4744005)(26005)(478600001)(54906003)(16526019)(8676002)(9686003)(186003)(66946007)(83380400001)(33716001)(2906002)(6496006)(6486002)(66476007)(5660300002)(66556008)(956004)(6916009)(316002)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a3RJaGJmb3NYMzNyNGtPZHBTUHZlTCsvSWthVGYwNnJBUnlUUmZ3MDIxNERT?=
 =?utf-8?B?VHlabXFsWGJlS054bnJTTWVQd0VUUHlIdmxwWmJKQ1gxL1c5Qkpwd3dyWGhM?=
 =?utf-8?B?aC9qNGlJMnlqYXlVbndqNUxmOEVDZDFZekxxd3JMUGdrdWFLalZZTXJSQ2xr?=
 =?utf-8?B?MTN5b1libHBQeFRUdU9xRzdLbG1KNkJwR1VHUmNmUVVUTjhtYU9xNzVpd2Jy?=
 =?utf-8?B?YmhqMGlrKzZuRW5ScHh3VzA0YXJ4NFBEcGlKL01makdsNkJSUGRiUGsxelZl?=
 =?utf-8?B?ZTVmdURLcDc4eWhaWFpzeVc0MUxRRWp6eTVEb2krcE1ZZlBlTlNGVnU5TC9D?=
 =?utf-8?B?QjZvUDVxTHVEcTRsY3pwUnN1NzBrTzQ5dTdLclI5S1BUMU1oRGIwaENSUE9w?=
 =?utf-8?B?VHlqaHJXLzZuZkpUTzVnY2o3UEJGV3dSNEo4VGZpcXRid2QzS3RYcDdVYlNj?=
 =?utf-8?B?UWVTYlhXSzlpSk13OXJPaFVJbDZvZVl6UXNOWkltYjJWUlFvcW1QUndHTVg2?=
 =?utf-8?B?UEFkdnhxL3c1aGwwSEd6TzdoejRMUjZJa1VmV21vUWdHUCtPUWVDSWV4QUhF?=
 =?utf-8?B?bVNzYnNwN1pVaEVJNkk5TFpibTU1VzlDTkNEK0RITUlJZXRnVmgwK0hJTlJv?=
 =?utf-8?B?UkJrby90Y0V6NDNkcks3elhIU2tLYWhWeEluZ2t0NERDeWhsdFBGU1QwN0M4?=
 =?utf-8?B?ekptNk5tNGxqMUFHVVNMNi9FMDFWYllkL2ZSbnZ3NWJYUTd0V3Z0a2dIYjBB?=
 =?utf-8?B?N05QQjREU3VUNVg0ejkzTE5qREtxK0Erc2R6RWtZZzRsYWxUSG9PWHhMZ1VF?=
 =?utf-8?B?UCtnT0Z3WitqbTU3d1l6N3A2SkpuOVNpNW9lbitXMGRRWnNLYmQ1Vk4vb3M1?=
 =?utf-8?B?ZEZJVEI5ME8xbkdkaWdJWlU2SEZKdzJDNjc2VDREaXhEZGtJWERzc2sxajRV?=
 =?utf-8?B?WWl3Z3pPTWozd2hzalF3SGU3V1FxUXgydlY0S053M0s3dldWWDlQZi94THM3?=
 =?utf-8?B?SXZDWFIyVjNOT0dPN09nbHh0RWdId1JvczJZQUV3TGMxK3lkb1JRSzlMLzl0?=
 =?utf-8?B?OGFYYnNXd1hFWHE5SGxMdk1KNitlNGJXenp5UTdXRFRHK1VUVUIrOXRjdC9r?=
 =?utf-8?B?OWk2NzdmTG4zYkM0bVhMS0w5QTJab3REZTNvdGF3UmVZVlgxaWVXLzlyM3NH?=
 =?utf-8?B?b0taUmJFT29JYm14YmpMSzg1NTNxTDlyOU1XRWV0K1NQWFRuSGFOSlVBRlR1?=
 =?utf-8?B?cUwvRWcycmR0R2hIbnUybkZEbFVqRVUzZXdBOUxDc2ZTMEJkNVBmSlF6YWlV?=
 =?utf-8?B?UU1yeUl2VnRFY3ZkaC9ZUVhibmwrektLY0I3MG1FQ2x0dDVSU0ttUitlczZj?=
 =?utf-8?B?d1l3VnpOVFV5Qy9tam41aU9SNVNDdTB0a2thajhCeUNkYXphS2tobzllSU5j?=
 =?utf-8?B?Y2J0ejVRM0JCbEIvMzdqT3RBZ2FscEtCNGNIdndnYTBMTmF3REZoRnk4QzJG?=
 =?utf-8?B?dDlXM3U1UlJaMlBGR1F6djBaL2hmWmtsYXdpUmxDS3Q1Vkl4U1h4S3FQcXBj?=
 =?utf-8?B?Ym90eDBwUEFnRUpDblJpK0ZjbnQzUHV6V2ZKZ1k5WitMTDBmZCtOdTFZMzc2?=
 =?utf-8?B?U1lmd1BJT1ZoQkYvTkx4Si9jeURDRWZ4a3FaZE04SHA4ZENUR0NiVm9lVTN2?=
 =?utf-8?B?ektPSEF6cVZldmxzR3JOTE12SVR0WUJSMHB0YlhpbzY0QU0veVQyelBTNmJr?=
 =?utf-8?Q?PnX8wvo8qGEhHxuYl9TnpBhV3ZYIKwbC8jRokpI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb35430c-bef6-49e8-e3f6-08d8e5fb62a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 08:38:32.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNjSqh8/hRdjVBx20DBz2H6KOzdRBH9EBnQ0vIZyIFVQAc92/lKRUCQxmypmEbBSA0b8kWFr/09y2tua19ntug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3484
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 10:34:02AM -0800, Bob Eshleman wrote:
> Hey all,
> 
> We would like to start a working group for secure boot support in Xen
> to coordinate the various interested parties and set out a plan for
> the feature and its implications for the whole Xen system.
> 
> The end goal is a full implementation that restricts the interfaces
> dom0 has to affect Xen, akin to Linux's lockdown LSM.  This implicates
> important parts of the ABI (e.g., /dev/xen/privcmd/) and so will
> require input from the greater community.
> 
> I'm not familiar with how working groups function in the Xen project,
> so this email also opens the floor for suggestions as to how this might
> be managed.
> 
> We'd love to hear from anyone interested in such a group and how the
> community as a whole feels about such an effort.

Please add me, if nothing else I need to at least to figure out if
this could also be used for secure boot on FreeBSD.

Thanks, Roger.

