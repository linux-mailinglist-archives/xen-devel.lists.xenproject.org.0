Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493235171EF
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 16:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318936.538943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXKs-0003vQ-QV; Mon, 02 May 2022 14:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318936.538943; Mon, 02 May 2022 14:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXKs-0003sF-NU; Mon, 02 May 2022 14:47:38 +0000
Received: by outflank-mailman (input) for mailman id 318936;
 Mon, 02 May 2022 14:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlXKq-0003s9-KX
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 14:47:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd8ef5b4-ca26-11ec-a405-831a346695d4;
 Mon, 02 May 2022 16:47:35 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8--9jfLtClPhWLf5G_6zyzWA-1; Mon, 02 May 2022 16:47:34 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS1PR04MB9430.eurprd04.prod.outlook.com (2603:10a6:20b:4da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 2 May
 2022 14:47:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 14:47:32 +0000
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
X-Inumbo-ID: cd8ef5b4-ca26-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651502854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yNSnwbDFNW80Qg18oRehe5rlgCqT1OFew7OLyEXIXBo=;
	b=bxT+o7fzOHm997lfyoAnTw+GZGadroqnhIglf9vzwzBS48sUgqjkBlVWNr9U5VRZTbrKoh
	yNqSFP+UoJUqNumAbwDY5JHy1sYREF8UEdSl4KIQakO2Pg6IOBDUglf75rK2Z/S/a2tZah
	VkQqViJLsb1guIUbRWffFvMG9YuxGko=
X-MC-Unique: -9jfLtClPhWLf5G_6zyzWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZkcp/OgSsPF00cva184R+AspJ6LpfiRUVZvxmP0h5alXdnWuupoEf75hfoKu7ZxZTSV/E8fEFdB7xQJ7ReSntpUqvGPQmYkc7fjbA3ZXcV7gVeyWzg9ZD0bOU9Q61cFmZjF7EhbPCuaccYBBCMCwXAJB9gRQXmdHsekCq1vN/v8Jl/ndTvtMWf1CP43l6IOZ8KqTZOyTQnf78E0fqZn+wBIsubl9QOu1Sl/u/y5KCebjfgtYqNqbsIiPzQERTvEUqnVO5oNnEwTZbZTQkDWL0kzDRSU5suWdlUXWqnvSz/vzMu9+q0bWwU98SXi8Ru8UyfVh1zRvY1WL7zE7KWT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNSnwbDFNW80Qg18oRehe5rlgCqT1OFew7OLyEXIXBo=;
 b=OEQTg9Re48D1aMk2YjG1Ig4d1SfBBQ3dUeKUNPxHhyxIHEpC8KnUnkLD8nzxQYc+HyrR7v7abVz0jISKW7dUNH9CrpxR5QKIERzECf3BhMAShPFLdq19cJVbPxjC8UqUcy7SUFxpjR5W6pjJdaeA8KbEhN5VYTtYyQIyoarT7iqfVeDznlNp+lsK4+r2fjH2wCeUFEgPgFrX9+K0zCHFnHJglDDhcgYFec5Gk3q69lPluFMEOpcKgIOZ1mUQ8LWtWTQOtKRRoW1ANS0jpNFadCqdqYIKW6PMyOl4UPkkOQRMd1Vb61xFKerPIoe3H07fXEk3cvgDu1aXw71KNW5f6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa1acccc-0a02-bfec-2778-f6db8bf1a8fa@suse.com>
Date: Mon, 2 May 2022 16:47:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RFC] EFI: strip xen.efi when putting it on the EFI
 partition
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <394c1b94-beaf-bdcb-c333-65dd9987be54@suse.com>
In-Reply-To: <394c1b94-beaf-bdcb-c333-65dd9987be54@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0081.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92f16bb8-fd99-42c0-772f-08da2c4ab009
X-MS-TrafficTypeDiagnostic: AS1PR04MB9430:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB94304F346DB5C9166F0DED5FB3C19@AS1PR04MB9430.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BTSbVUGD+G3m5ew+rQbMYuXeudArz2CGFL+gU4d6YVY3dFkNIJFc9OC5MvnLaTdtXU0kbAhoiC5xYAPrm5iCXDl4xLR7R2LRTripaV3FYK2TfsPf6Fh4VLE0mFExgbyuxmS47HTsPoloU0ARKz9H39RgdNGX+p9AdfCsOnVrEMlAbMAnt9A9Xx651fl91wTkbun4Xg4R8s9dGhc3tYz3/28FtzoQuNpqghAsNu9JHrgLWVGFV+7PI4jqO7Wjj4jtQZgdQAxuD9937DDMefJQbZCMaHkklfGt99YJfgCAGj2C7NpWcYrL7mRnn/0baTnQkHgXS1TDO12kdu8z75lr9MjYEAtlUpFPIPWMwywiEJ1bIS+0aY93tgUpn+m7167uusrTSHO3e0v0JKfb8H6mh3STpblemcwLOwSlqkuW/sBqcOKACM0q6xMhx21PXyVx2qwoAp44SmXLZg8grrj7VqnGCkjTncFtZH33GxwTXGE+aeLWjAfEcL8fff6hDE/PozgaVKDBcD/a3cfMstxoRSYdtZQAgiM9gAisWL1zPwsv+19KkEYpgvm0p6gWl3VzGfJV8wLsj35+2VzuhicYtwvyor1T/X4OR5Vj77DH34C3GlBftm9qqs1Ua6zohlImFZx+McT4xJ5cVf7ZEdilpIZGVoc6DUUs3DI5u5Zabp/Kc3xMeB4RIHY5FDmkuaBucB477XFcmqHKUoUyqcfEbcA8m9U1+ORSTJ/zDLs7tOc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(38100700002)(5660300002)(316002)(86362001)(6916009)(186003)(8676002)(54906003)(53546011)(26005)(4326008)(6506007)(6512007)(36756003)(66476007)(66946007)(66556008)(31686004)(8936002)(31696002)(508600001)(83380400001)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmVHS3J1dnBwWTYrYmZXWEQ3ZmhMTFZvR2l0SytuNXlFcCtZaWdCaEZLSktt?=
 =?utf-8?B?NHpHdnpVekMwYmdFSm1RSzlTcUFwT2dLYlFJZThGc29iZFB2dGp4blZXcXo1?=
 =?utf-8?B?L1UwOEZETXJXQ3dyajZrVmtVRUJTVjhpRkZid3l4NTlvNVc0MEUrR0FscGZy?=
 =?utf-8?B?b3J0KzgwV2FFNkFVT1RGWmVqZUtlSmhxQVJZVWliQ2VWWUpIY0xvT0VUdzlo?=
 =?utf-8?B?ekNOSm5SVFpOYzhBRXJ0a0h4WU9pRjk0MldIN2pKNjR4em85ZDNaWklBQWhp?=
 =?utf-8?B?K3RKK0RpYVU2dXpsVXNwMDBHcldjaXhxdjhiQ3B2ZGRrVEdLektiSitKemFj?=
 =?utf-8?B?UWxYNmJITUc5RGMzT1NTbE1aNWV5aG43UTdCN3RUenVTdDlwWlorcUIyWEF6?=
 =?utf-8?B?VGY0cFJMTWZNMnZRQTVzYm5iYmxjeGdpRU9iNDhBTGJOR1pOT0VRTGJUK2F0?=
 =?utf-8?B?c2xUNTFqQXQwSXVob21acnNLWjFSYXEvK0ZhSGRac1I1WDNFcUF5c3d5c0pD?=
 =?utf-8?B?S1VGVDQ4UE03Z2FqcWIwaTBHT0RVUjB6dlQvN3orOUxTcWdCb1ZDUmRNRGtI?=
 =?utf-8?B?K21VZkl6MERtOFh2YzVCYUxPSEU1eGxuajN2QUhVaEx0eWoxUXU1blVOeE0x?=
 =?utf-8?B?WkxvS3RoZEJLdm5KWjczTnl5QTUxa1ljeWtzc2F2dDQ5VmxEemFiOTIvUTBL?=
 =?utf-8?B?QllyZGd1UTBMMUh2d052T210cmcydGhjTlZpZkRkYzV1SGtJYmNucm03T3lw?=
 =?utf-8?B?dTRjWTRtTmhJUENvZEMrbHp5YzZFV2ZBZFY4TnJ5TGhtVTlmWXBBQXJQUE5h?=
 =?utf-8?B?V3J3UEVGQTNDempSdFU3L054R2tVc2YxR3pXYXNmcmR6MXZYMlBaWVlqaVBY?=
 =?utf-8?B?MzE2RzVVcDBuTVlBRGNhR0dBQ0RmSFA5Q05VVDNQUFBwREpKMm5IWWJTeVI0?=
 =?utf-8?B?eWxaRlpNMFYzK2RKM25tK25OR1M0UTNjWHlOV3J5a1JPR3lJcmI1Wk9Pb1do?=
 =?utf-8?B?andlMUtoVTZFU1loc09UZTZYbWxDdWh6RGFqOHJNY0ZMczhjVDhYZEJYN0FG?=
 =?utf-8?B?YVhlT0dkZU9PdlJKWGEydC9TbzdGNEVUeTBsODNleC9EaWtOL3lFdUZMbkFx?=
 =?utf-8?B?ZVpHTDlLWDQ0SnQzR0c3amtoSmFiZFZobkM4aUQ4YnhjMjg4cW52YjlqQVdo?=
 =?utf-8?B?VXlkL2FZNUVNQWJuWnN3SnRMZGtvdGdRU1hBczRoTzlnMDBGRXA4S1krZ1ZU?=
 =?utf-8?B?b0FHbmppM1AzZjVVc3E2azMvYTFNZXZWeE9ySVVIc1lRQWU0TW5VNGliREVY?=
 =?utf-8?B?UnVyTER3Z2RiOHJDQUNId3MydXNoWkk5d1d5ZkJicytRNzFNZEl2TEtETmdO?=
 =?utf-8?B?RS8rMTUxUVZIRVhIbVRwd1lKakRVNUZNd3FIc1Y1TzFVaU9XYlRlWHgvbnR6?=
 =?utf-8?B?enpwZ0hLd1lMeEliT1Z2dTVqdk0ydXF1UkNWNER1cDlhQ28rRFFyM2dKeFpF?=
 =?utf-8?B?akt1V2EwdnBkUW5iVmwyM0VxSkg0ZDIxUVp1T1JPc1MrOVl5VUFmQW05YmN6?=
 =?utf-8?B?THdRNTVGUkRJSWpRQURzNmxmY3pHR2lYR3ZqTmlablY1c1lzR2hHY0N3WlRZ?=
 =?utf-8?B?Zm1FWGpXeXRqaWdEL2l3NXp3SWFPUzA4L3ZRN3RkdnFZczRVSkhpaksyQkUx?=
 =?utf-8?B?QkZjNnFUMUVKSzErYWdBSWVMWlRiRkNNR1daS3QrT29KUVJnS0IwdWNlRVhv?=
 =?utf-8?B?bUlwMEsyUHlnRjRaUHdFc2c3Wm5ycFgzRGd3Z2RpWndYTWxQeTZPck1HZ05F?=
 =?utf-8?B?c2FoQ2QrK0QvbFMzUnplNXc0OXJPUitLbG1nU3c0SWNldDFiK0cwcDF4eUpU?=
 =?utf-8?B?VE9Bc21MdjE2VXlNUHNzQ1BMc1ZwVG5zUGc5RVlKbUJPTmRrY3lrQkxIczVC?=
 =?utf-8?B?ci91UzhSUzZpaVV6WDJtM25jdUNYMVVhdnQwcWFXTDJZZlF4MkRoY3FOeGE1?=
 =?utf-8?B?OGRUcXFYSGM1UkF0Sjc4SGRuQjZvbVI2eURvYlZrQmhEZUNydFJRMS9hSDQ4?=
 =?utf-8?B?bG0rYkFLbURpUTBnQzY2ZkQxL1RMaGRXaGRBR3ZPNENSeGhKbytsc1JwTU1G?=
 =?utf-8?B?SDJIMnMxbGZBMzIzWTBCZWhxWWluQ3RUYUpBMSs1MnpxTk1wMUkvMXRMUDl0?=
 =?utf-8?B?bzZRTnRhenUwdllDRWpxSjFNS1lRcy9udmh0UFdlMytEelNHN0dyVSs2QkhT?=
 =?utf-8?B?UnVjZ0U4UGh4cnNJcko0ZkI0MDFIZE41cUZpcXR2N1hVTllNVnlDeFl2Tkxv?=
 =?utf-8?B?cDRobHREU0dMbENqUTVFK3VJMkVRQU5vQnhiQnI5U1FGekN5RWU1Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f16bb8-fd99-42c0-772f-08da2c4ab009
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 14:47:32.3814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5GnkQkSfB5/kvNzVWPA7z7taJMg5FtrQZkZhjU//ycLz+VHz7xlnTuQJWNRFglSWWQ93r7Rdz6bqCEkD0BFFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9430

On 25.04.2022 12:46, Jan Beulich wrote:
> With debug info retained, xen.efi can be quite large. Unlike for xen.gz
> there's no intermediate step (mkelf32 there) involved which would strip
> debug info kind of as a side effect. While the installing of xen.efi on
> the EFI partition is an optional step (intended to be a courtesy to the
> developer), adjust it also for the purpose of documenting what distros
> would be expected to do during boot loader configuration (which is what
> would normally put xen.efi into the EFI partition).
> 
> Model the control over stripping after Linux'es module installation,
> except that the stripped executable is constructed in the build area
> instead of in the destination location. This is to conserve on space
> used there - EFI partitions tend to be only a few hundred Mb in size.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: GNU strip 2.38 appears to have issues when acting on a PE binary:
>      - the new file positions of the sections do not respect the file
>        alignment specified by the header (a resulting looks to work on
>        one EFI implementation where I did actually try it, but I don't
>        think we can rely on that),
>      - file name symbols are also stripped; while there is a separate
>        --keep-file-symbols option (which I would have thought to be on
>        by default anyway), its use makes no difference.

Update to these items: The first one turned out to be an issue with a
not-yet-upstream patch that I've been carrying for a long time. I've
fixed that up, and will submit that patch (perhaps together with
further ones) in due course. Apart from that the list of remarks now
is

- file name symbols are also stripped; while there is a separate
  --keep-file-symbols option (which I would have thought to be on by
  default anyway), its use so far makes no difference,
- the string table grows in size, when one would expect it to shrink,
- linker version is changed in and timestamp zapped from the header.

Locally I have draft patches for all of these issues, but this means
stripping won't work overly well until at least 2.39.

Jan


