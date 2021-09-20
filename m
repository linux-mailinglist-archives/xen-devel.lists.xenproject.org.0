Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1CE411006
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 09:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190273.340106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSDhN-0004bW-Hi; Mon, 20 Sep 2021 07:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190273.340106; Mon, 20 Sep 2021 07:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSDhN-0004Z3-EW; Mon, 20 Sep 2021 07:26:45 +0000
Received: by outflank-mailman (input) for mailman id 190273;
 Mon, 20 Sep 2021 07:26:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxQs=OK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSDhM-0004Yx-Mr
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 07:26:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a98369e-19e4-11ec-b860-12813bfff9fa;
 Mon, 20 Sep 2021 07:26:43 +0000 (UTC)
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
X-Inumbo-ID: 1a98369e-19e4-11ec-b860-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632122803;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CWnSXaAMaEaSR9p3TCiV9WJmxGN1l/ggPdqewB+1sGg=;
  b=JCDMAoHQCa2PDbQ2MhcM3YI5yqCmiag5W1czqF3EKrv8a3+VKzxOtrp4
   jUL2UUjsbSV0TWDpb2KMKRviKb6WfiklrPXDZeP6C5Q6Dt9Ccr54CuRiS
   a6kKjpEup2wsXtgQqctB2pLiWqDk//weA4/8IKE8H45PHpu4o+FW7JZay
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GXjahnF3T9WBtzeSCrQx+Diqc2y3GNYGyU1AZyeAawL8urkUqqaIiB45Us0Y9VmRaXJY6vDXOX
 MCXOSGtK5tcqSsbQvZ6QJCu+EKnvnQ4jI6PoOP8n2Ua3PYvEv/jFKQseE20xvw/6TLglOM5qpv
 VMBmEBSH03knXMqTgIHphXZC0DLkHDMOzwSoR8YMdGYEUhhfsn4B02vZsQPelMIhLeowLHJl+D
 oegD/x0+hcAn9u6qNyGWcc5c9RTOseHKc875cud1K18Vtdsq2tSU7OEDtTjo1XKItF0I8/KL/T
 ais=
X-SBRS: 5.1
X-MesageID: 53510795
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YzHc+atrfsdB2zN5H/bES/ezcOfnVLZeMUV32f8akzHdYApBsoF/q
 tZmKTzVPvuLamemL9Fzb9u2phkFscDVzt9iHAJppS5nQn5E+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524DhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplpLqWQDh2AY32ktsAUSFhFCZhD59Y5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25sTRK6BN
 pdxhTxHMT7gY0VKJX4uNJcZkOmUtFTnThEfgQfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3sBthFqf12kCEio8XFGwoeS6okOmUtcZI
 EsRkgIipLY/3FamRd78W1u/unHslhwBX9tdFcUq5QfLzbDbiy6YGWosXjNHcMYhtsI9WXotz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLoos+kxbORdZLC7Oug5v+HjSY6
 y+OhDgzgfMUl8Fj6kmg1QmZ2XT2/MGPF1NroFWMNo640u9nTJ+DQYWXtmf71/x/MYShd16Go
 0o2hdfLuYjiEqqxeDyxrPQlRe/yvqbeYWyE2zaDDLF6qG/8oCfLkZR4pWgkfRY3aJ5slSrBP
 ReL0T698qO/K5dDgUVfWIu3F81i5qzpD92Nuhv8P4cWP8QZmONq+khTia+sM4LFyxNEfUIXY
 87znSOQ4ZEyU/8P8dZOb71BuYLHPwhnrY8peXwe8/hA+eHEDEN5tJ9faAfeBgzHxPrc/W05D
 Oqzx+PVkk4CAYUSkwH88JIJLEBiEJTILcmt8KRqmhq4ClM+QgkJUqaJqZt4ItANt/kFx4/go
 yDmMmcFmQWXuJEyAVjTApyVQOi0BsgXQLNSFXFEAGtELFB5MN7zs/9AJ8VoFVTlncQ6pcNJo
 zA+U5zoKtxESyjd+iRbap/4rYd4cw+six7INC2gCAXTtbY5L+Bk0o+8IGMDKAFm4vKLiPYD
IronPort-HdrOrdr: A9a23:CDEmp6ECMhyCzZ1OpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.85,307,1624334400"; 
   d="scan'208";a="53510795"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5EyWTuEqIVtN/xtO3eknKXSVUQcTQQk0yku0qp2Bzl57HbYhSrL1yqV+lFddeBeUYVhDSit576YAjHPDH4/vktmTf8Di++/UXeXX0nq700SaZA94wSKVYmRGx1nK59pRmzFaFe+4hc0qz8pkT1wAhWQ9fsN0qeHERApNDL0ZSWyh0IPEadDHf8IEhLHMBFAXdgDzJbllIZNv6/GTVDc6SKQrm70zghUq0KI9A63ldPxgeso6d97C02ZPVCbTa7AgxP9+raaa7Zop/+cFXUBXM4RWDHJPz0o240EZ4eHzLekPZnlzVOKhAtW3wU4hSnm7byjBOb+SJjkd/a1xyu1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=h++yva7142k2qdDypKToq7jAJmeMCxs7Et6brqngGSo=;
 b=e/I9Xhy5Yxyk2GDs+I4HGR291YQv3mCCCDkgnNBBr0UPBlLH32DikGtSRKXgiVRVZbB7W6IipnGkBi48Xy8bW67aKUAbT3go+Pp+pb2+6hZoCx+/b2tEviNSkMmsOhB0B43Z0L++9/6jR65A5ryz2PRNv2Qex4ElREIJCq5lcGQvHoL0LxwR20l1zxQfFj4y2DPAr3fPyX5iQb5eC6gx6JKAvsu2gEQOm9oKttokPsECxCMU5+rAjMRWF92GopO5Jz0+GXgc4rX+P/Ukzm+FL1ZbUlOAgU6T9zHIVz9452vJYI3SieE59a47AqgTeizCZfvrmcjAoafihpMOk2CSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h++yva7142k2qdDypKToq7jAJmeMCxs7Et6brqngGSo=;
 b=rV/gNHT/VQjo9k8iB+qSQ1Fz9h+zi58e5cMUzdLw/JFi3AWdQv8iGQdfu4YOQXxLWRjbUnj44enfumxQXety9o5Lo6CMpdcLT/BOhyrfgfqvaI+Z9cOml/mrSLJEMmbQqsPqNg3YFWcfRFvAVK89khpIMlxdf1EGCq7xrGZDFww=
Date: Mon, 20 Sep 2021 09:26:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/6] gnttab: add per-domain controls
Message-ID: <YUg3pc9A5C4GTTeR@MacBook-Air-de-Roger.local>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <0D7E40CC-EA8F-4CE6-B4C7-A69C403BD4DF@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0D7E40CC-EA8F-4CE6-B4C7-A69C403BD4DF@citrix.com>
X-ClientProxiedBy: LO2P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b71939ff-3c38-4923-8557-08d97c07f9b3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2924:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2924CEA8E373E80A17DD1ED98FA09@DM5PR03MB2924.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHPB4YIbWe+5zWOsuODf+WHNEScLvgf7+4S1osmte4MZ17lQKF6Q1bJ+mNyXd/7if608qMgHM9Vz6BmN8EwGPmF6W1sBd61sLleZHUptx6eFLPthvcw1Wey8iEiETzn7uPyaJSejXZGiYcs8Zqus8qAP+7tgC1Wvd8aJqRN8WCXI5VokSc+B93U6bmSEX9Og0S1u+oY5NYQ0PjrBpUnHoTVz0wlchwpc27cRkyn05E08qh8ziWW0vPaO6volqUQe2Vr/8sutlXi7u9GV+UzVnaTALXG0CXWxaZhqGM14DZQM3tJoLYws0fgJxf5ERGW9NwvwuGcXuIxcSduky4yXBQZnHSIu3yK5jb8xc96EDMsWieTmX7quUibX4bwlgYds6ogqWxIa8dcT6fgKql9fChrFSIpgDSL432bVDayR6hYU0K6RURcO6ytyJcMdEiolxbwZjYHY1ye1h33RXqE742vzxO4El64FOPrZrM0bbNA1GQEFf8CGAw/YFB2VaXJa+LBpeszEUseMu64PrOkVegcNP38QPzRk0BmoM/cxYiSuaYXIcvgN4DaXDKfP8UORI1V+1aDgprKQJboP9ayhlEReuTyLwi/9Sgqjfx7MFWOmkC7yCtO0CFP4ynbwQZ/BkP64YmKFTMsreC8Ee8fhSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(83380400001)(85182001)(53546011)(54906003)(508600001)(66946007)(9686003)(86362001)(8936002)(6862004)(66476007)(66556008)(6486002)(6636002)(2906002)(956004)(186003)(5660300002)(38100700002)(6496006)(8676002)(26005)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm45VkpKVUh6N2dnZXNPUmo1VWhiNXgwZnJHVldaN0JCRnkvaVlZM1p5Y2Ns?=
 =?utf-8?B?bW93MW9KWGRaUmZJS1Z3SHVCSm8yU2IvWW42QWdrS2E3VW9FcDhUVHVxRU93?=
 =?utf-8?B?Qnk0dFQxbGlEOFpLRS9QYWtTZDVNNUZaTjlQMU5JR1EwYnB1Zk9JZEwxZEZB?=
 =?utf-8?B?MDVvUTQrZFd0aEV3T1hySnd2aHVabmV0MFRWa05mZndUSWhqZGFHKzdyYW4y?=
 =?utf-8?B?b3RFWms3WlQrMXMxMG1vMUZOYStYNy90LzJJelllSEZSdnZQRCtnZG14VVd2?=
 =?utf-8?B?aS8wOWkxNzlXam1xQndSNjJiQWo2L1ZGaVZCMjZaQVQ4bGdJNDQvaDBoMXFl?=
 =?utf-8?B?WDRMVmFZcFFsZlJBNnVQQVpiK3ZyZEJ6alJaVmxHeG9IY2ppVHZiK1UxYVFG?=
 =?utf-8?B?MXRFV2ZxTUJUVGNraWlMckwvbW9kYUMyZzEyeVlYUzVyVjh1OWxWYTFreHNa?=
 =?utf-8?B?UFRHVEtzQWJMUCtnaThSWEVtcjFHMnZDMEhPdzdRTm52VmVWWml4ZUZsZk5o?=
 =?utf-8?B?T0dFc28yY21icm40VlJmVmZlR01LSVhYVHhuZm5zUnhHR0dHQVNNWWJzb1px?=
 =?utf-8?B?M2V5SC9xWC94Q21CODNJT0ljOUdteXIvY0FFa284M0tXMnJMS1oxdEx6SmtW?=
 =?utf-8?B?eWc0bzAxaVpEeFlaUmUxVDFnVzdqTjdlekQ4MnZNVzNPdjlrU3lxc1FxWVVZ?=
 =?utf-8?B?Y2FVTFIzKzV0NGY2S0wxcVJSSXlrTDcyS3RjMStwYmpoR0V5WjNsQXZYbytU?=
 =?utf-8?B?RnRvWFJYVThIdmYzUU84eVpsZmVyYUpKOUpkeWxOa0taTmptcSt5eWdKWkF3?=
 =?utf-8?B?NmNKcWVUZVkwV1NGU0orcTdEdWJTMDFyMHJibU1KUXdka2V4S1RraUIwdERs?=
 =?utf-8?B?MjFTL3lNTk1wTm5WTmFwRW9HS0c5M2ZHT05kcDNTcU1ZcnB2UUJHZVFuRTFp?=
 =?utf-8?B?SGF2VTZhRVRENFNqc3REK09rSmF6US9WU2JPMlBmOVJyYmRsbTU0dEZoMmgw?=
 =?utf-8?B?N1VwOXZEelZ0QU9KcDJaYVo4UFFZazFCSGdNd3BySWt5ejBJUnpwVkUrcEtx?=
 =?utf-8?B?V2hMWjFFSHMrRjZJL3R1UFpCL2k2T2s4RUtlbC9lNTNkT3ZsUWNNcFIrcDg0?=
 =?utf-8?B?eDN2OUF3ZmpjcXRqS3V2c1pjQXROSDBhUVdxNWUyT0NmZVZuaUNsVFZCcmtT?=
 =?utf-8?B?cTBpcW1JVUkzQzdvTVV1YWxDbzdmWkY3V0hySjVtK2NZc3NZbUxRbDROWXQw?=
 =?utf-8?B?TmNReGpzVklrY3ozNjFzQzc0YWU5K2F4bC8wNTEwU21lTmg3UXFKTlRqVVhj?=
 =?utf-8?B?UUxLKzZrY0h6MUMwUklsWUF5UUFjT1FhdXBBVithbnlWbDAzbisvWkQ0Q284?=
 =?utf-8?B?dkN0T0NOQ3FRdHBzYTV4eExSRFJmT0NJN2ZlOGtiTUROM2RMdEE5K2RNLytI?=
 =?utf-8?B?UXJHYWJrOVJRejZERUFTR3d3UUZLN2trMHUrZS9YaHR3RHl6ZituWVJlMUx2?=
 =?utf-8?B?QmxYTkhqUk1tczk0aWxDQ2d3NnJMLzdtWW0vSFE2UFgvbHdMNjhUYzIwQ21I?=
 =?utf-8?B?SHU1eGJ1TmxTaUE4OEk1VEhIMGJ5SU43emdleEhzdDhtYjYybjVHUzZsRm9x?=
 =?utf-8?B?Ukl6eGluRUJrQWE1UmhqR2tWOC9Rb1JGZFNrTEtRcnZYMDBNaXhzYzhWUWwv?=
 =?utf-8?B?Tm01aEU5YjE2QjdmRzNLWXdUZ2dlb0ZydTFGM1FIWDBxajdZb20zam5oU3Ro?=
 =?utf-8?Q?DMmx0JgGkldU9p1X9OBN5O3FnudA3HVsbdTM59i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b71939ff-3c38-4923-8557-08d97c07f9b3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 07:26:34.7564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFkWFQ/IlJyS4YuPtJdgiHZig200IB9sWE9o5EFIXBEMG5VWMfm59WV2Z5TaFEBNI43gYazvrvQqRQunVWCY/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2924
X-OriginatorOrg: citrix.com

On Fri, Sep 17, 2021 at 06:06:42PM +0200, Christian Lindig wrote:
> 
> 
> > On 17 Sep 2021, at 16:46, Roger Pau Monne <roger.pau@citrix.com> wrote:
> > 
> > Hello,
> > 
> > The first two patches of this series allows setting the preisoutly host
> > wide command line `gnttab` option on a per domain basis. That means
> > selecting the max allowed grant table version and whether transitive
> > grants are allowed.
> > 
> > The last 4 patches attempt to implement support for creating guests
> > without grant table support at all. This requires some changes to
> > xenstore in order to map shared ring using foreign memory instead of
> > grant table.
> > 
> > Note that patch 5 will break the save format for xenstore records, and
> > should not be applied.
> 
> Has this relevance for the format used by oxenstored?

I'm no expert on oxenstored, but I think it has always mapped the
shared ring as foreign memory, and hence no changes are needed there.
AFAICT it also stores the mfn on the save format, so I think this is
all fine.

Should have mentioned it on the cover letter.

Thanks, Roger.

