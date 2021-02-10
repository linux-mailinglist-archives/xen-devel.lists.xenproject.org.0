Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E813165BD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83579.155865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9o4Y-0004pF-O9; Wed, 10 Feb 2021 11:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83579.155865; Wed, 10 Feb 2021 11:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9o4Y-0004ou-Ju; Wed, 10 Feb 2021 11:54:18 +0000
Received: by outflank-mailman (input) for mailman id 83579;
 Wed, 10 Feb 2021 11:54:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/zh=HM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9o4X-0004op-6x
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 11:54:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81bdab73-d7e1-414b-8911-7baa03c6b00d;
 Wed, 10 Feb 2021 11:54:16 +0000 (UTC)
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
X-Inumbo-ID: 81bdab73-d7e1-414b-8911-7baa03c6b00d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612958055;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TY1YrNqigC3nuby2bo/MLZCaBbBqG+HDRQsggwYR6+c=;
  b=e3spqWfDL9YQLJ+fYinKcYH8SAnOACrdsVoSkN5gCwIHSmXCO2G8r+7q
   /bQ6aj5l1CSQ3jcIWn4MF59M6rOMsugW8ivorM240exH4gplDlW2MQY3B
   atuJhMOHqG5IsbAAtSgzKm6Rx9B6KgUazjWr7qKzDNvKtG27xivFgcJpj
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s3bHAMP/o4I+FNHgVDTCjEJvudCyhEqKRG4GSs84jgYCmhVnS71/QGavLn7uY00fB7prwf0jHA
 0Z/mxWCz7sxoi7gKn2p+h69mG95N8k8BuEA1rrpkGlZRcFhWe5oXUD6TYLhOyb8EadX7yjbwQa
 eDwlX5ub8TWaupb6Z4WfpWOGPXHY8vQZRgavngsULhAmHzY0FDuXEYkRfhH2y5AWgcI55pPM5g
 Wd7eyTPQ40zBpayvZpc6djNXCscUicspBiZtektkMsqouFb8xwt4yeZk9cPKejIxT+qm4LRwU9
 nK4=
X-SBRS: 5.2
X-MesageID: 37318094
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="37318094"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekKdIlzhKEvU5cagbs+zOMpbYG4cEX6WnIxaU9qfI4NGijFwO7jBP7PHzlUvxfXW/zhPXWgC8pPkfV1eIl/tu00WT/ZwZjksbPptKlts0jckSOvimqyw5st0c/tpr/JscD3w8HuUPjIoNosGRoDY1WsA6s2FEmjE5sVnc01y5eyJIocueZrFeJ1ty/SRpNsj8X+a6QtGgMTu3TSem6kN4aa7YhnBeV+n//3v16hjZj0mTkFKPwIX8AO+NPthE777OXz7DSBCILS3U2qx0a4W+761AHuQwkHdLvT17Km1dt9R7H3duvU16olFxJCXmbiDDhcbqDoemn1j9UV7WfW/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZAgjDsA+4s1BTE67/NgyCiYQcMfDswFDZhm5DmIzkI=;
 b=B+OivFkMrVwNzlxf/APPm6kQaJtp+jbgBlmYrxycjQR9ioOzsWdGpidqbA9ppO2tUYSuE8qVDEvTdZ4ETZjenwnU2P27agLDsRDCYKXV/lV3XHULLPU2d2IQDc7UbS9pW4BsB/zsXQ7OeuvzeKHxuhqOgYLd5ESDwSvjwa+OjRLGI29HdqrCIBRAK8WlLoDN64SCQBRJM185PL40WkQP4rbKF99/dVoTIB6NwdNy7rY2uhlGzTiDRvn9EQfb1MlZQGT+d3rHolQdoGXk6c9elaOa5TilFmXhT16MmRgmoDssFMJwjl3HJfIQL+GWNiKGHpZeJPeIgFcMzy/ZJckE7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZAgjDsA+4s1BTE67/NgyCiYQcMfDswFDZhm5DmIzkI=;
 b=F7Tn6UabO7znoiN4vtHYqNjqB9kG6ny+oxII0yLEVhahl++uSQcekzl8O7QdllNEzJJap45pi+p8wW3MqO1beqlnT9glETDZB2oDFHG0ppogek5bmyYnxmFX0QTMynkrf8ONf4cgRYrcb70F8LJqLddq0l3syKrbCH+ZQ8zsipA=
Date: Wed, 10 Feb 2021 12:54:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>,
	<hongyxia@amazon.co.uk>, <iwj@xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
Message-ID: <YCPJXe1L1SCXoL7a@Air-de-Roger>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org> <YCOZbNly7YCSNtHY@Air-de-Roger>
 <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
 <YCPE0byWKlf/uOFT@Air-de-Roger>
 <65797b03-7bd8-92e9-b6c7-e8eccde9f8ba@suse.com>
 <e1c7c616-0941-b577-5842-a51374030798@xen.org>
 <71c4150a-0b81-cdc3-b752-814f58cb5ca4@suse.com>
 <df760d78-a439-db0a-4b88-813b002f0a64@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df760d78-a439-db0a-4b88-813b002f0a64@xen.org>
X-ClientProxiedBy: MR2P264CA0033.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::21)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59c88579-264f-487f-6fd3-08d8cdba9435
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB560849131655E252C2342F358F8D9@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rV9FT+Hc40KEULQeIT7PsQU1adXoNQiFrFsZOpkApOq/aBqFAXAjyiNsYYlVq5y5ZluPmtK8N1QWsYUC+Pq6QElUthfyP4GXdgENw2B0dTR3JcWb2PTcxJVCUKrA0h4x/P2ZuOB1ERc5bFrpW7wpkwWgJRfy2HGrgZnV9yFSVJ/wD3a3UA18L5x1pJE5xDzhWEjnXyX50ieECZ1AFfl6oRLM4G/qC8hsZZ/JuVzAMDyAgrIwu0CFakAFZtVnAfPslTV0pdRYLOh4zscnF5nRyuisKPOJSnMpnx9Zjp5r8KONblGTaMxsG6kYHmrWl9OgTTf5LSufRC4Qot3BNWotsp+E0hF70FDg5hTsylTdfVjtviOD65ao0DLBQCRwmof5IJiWNANA3ZU7vwd3G6a4Z3ajguuz6/mHjaKQhbSkHmdB15VTOoI61kwhF5PlBtLR1s7g2luy4HDroN1oqGkgswKsFbGoZzozHfQrB6bbqRJV6rasZK2Q+Lf8pQaJb26OnBgwJ2o4PYsr/7VCRbJwOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39850400004)(136003)(366004)(396003)(346002)(8936002)(4326008)(5660300002)(66556008)(6496006)(86362001)(16526019)(9686003)(66946007)(66476007)(478600001)(8676002)(186003)(85182001)(2906002)(53546011)(33716001)(316002)(6916009)(26005)(6666004)(54906003)(6486002)(83380400001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YzhtUE1LaUlmMkJsNVgxN05CekVYbld0S1NOc05xKzh0V2pKRjROK3M3NGZS?=
 =?utf-8?B?OVpyZGthR0ZWb1ZmRVNTYzZGSkk0Z1BFQnB6QU1qVExFendVUEdIQk9vb0FB?=
 =?utf-8?B?a3FZY04rdTBmeDZDVjJHcS9DbHhJa2E0YnIxNUVkTzdpSytCa1VhM1FzRGlz?=
 =?utf-8?B?ei9RTGdveFllSTREUWF4a2h3bkl6RmRDNGhJUEgvMk5ERTVvVk51b2VKYW9W?=
 =?utf-8?B?N3dlYnN1d2tZZEhuY2RtOTI2U09WZmxnQkVQOTI5YlRHclFjVEczM05aZlZq?=
 =?utf-8?B?THUzTXVxWjM3cFpsdStYOEpteVJUeVNZNzcvQ0NQeGZVdjEyRmxSOEZWWThW?=
 =?utf-8?B?SW9xeVZ4NWlBT3VXQUQ1bll0cUNudy9HY0tDcGR2UzI5KzQ3VUplYUNZOUhY?=
 =?utf-8?B?UVZpRjl0cUdBL0lWZElsUVBpNDBqV01QNlh6b2t2bW1EbkkzQWxpK0dzUlI5?=
 =?utf-8?B?MXRBdDdmZmgvS2toMURuZzBnWUFSZ1A5NGljU2RreHI5clF0WVhBMXkrNnZY?=
 =?utf-8?B?UXY2OGxad1NQVEpLV1ErMTVManhNa0oxRVNJbUZFUXN1OHdtblYxbFUzc1Zu?=
 =?utf-8?B?SSsyM2pOa3hhUTlROHBXWHF4cUh1aWxrbTAvVkNWSFBhdlBGMEN6Uis0eHBl?=
 =?utf-8?B?RDI4ZUtlQjlUa001T3BRT0p6SnpwRUJvSCtKN3dMNWdBaithRFVoTWhROHFK?=
 =?utf-8?B?a2F4bndzTlV2aUN4dUtEaFFwbGJYZTVlbVdnRHNzaTBPRUQ1d3NwcnNYb1FD?=
 =?utf-8?B?cVB0UGVYYzQ4cVp6OTVHbGgxbHdENE1zeFVqRVV4MHYrL1VnV0pkSWM3SkV5?=
 =?utf-8?B?WXBDd2d6YXgyTEp3NzkzanVyOGs5WnVFRFc4SWVENHFSMWZEUlhjcThGdmkv?=
 =?utf-8?B?aHJwL2p5N0VwRU81T1czcEJUYTB6TTAvUkFMWGQ1aFRBYlhxbXJxUGRvZjh3?=
 =?utf-8?B?cW5Dc3duejRGM0cxUFprNkNkZ2JBdTl2YWFKbm5zd01vSjB6RzltZGM0VE1D?=
 =?utf-8?B?bkxLUnYrU0NQTndkWGxwOHllbjhGZTcxeldnZlZrY1VCZkFxbnBkdDlHQy80?=
 =?utf-8?B?STlTVUJrYmdLQ25UcEdUWTcrTmhwQ0FNbXRSVVA4ZWU4aHJsRWZqMW55c3RD?=
 =?utf-8?B?VFNXYUlVVXp5NUZtTm5rY2xBRDQrdDc1OXdqNEs0cGFCSmt0VnhPR0I0R05G?=
 =?utf-8?B?MWtyemZuczg4aWVFRHErb3JIc0NIQ0NGREJFSHBjN2ROQlFjU3I0SEozdXN2?=
 =?utf-8?B?eWxEeW5HRE5KZGp5NjhUeVdCM05JQjkxdjVCNEJUZHFubEhkR3hHbHV5U2Fl?=
 =?utf-8?B?dkliNGpYRTBaNXY4dUZWdVpVUW5kSHlKQXpJeCtPY1djZlgwK25EL0s4TGV6?=
 =?utf-8?B?Ti9Ub3FDVWFHTnIvM2lFYWF1bDBrODNyQ2NURVk4UUVGaHgwcGMzSll3YjNP?=
 =?utf-8?B?OWZpa3d5V09RRzk4RGlyTzdibXQvZ1I5V0MvQVJSSWh2TjJ0am5uM3FERm1v?=
 =?utf-8?B?OU1xNHR3L0pzSENtOGVKMmhPckQ2WWpGN0d1UVVXSkRMdjN5Y0VodHJGdGFk?=
 =?utf-8?B?WGxxTWxqbXBvalVXWGdnaUdyUis0VThhRXN5OWc0K2ZFc0prTDFhUlZvb3J5?=
 =?utf-8?B?MlVQeGpKMnkrS3JPa09mZG9vczdvWlU5RlI2THJOQ0ZiZmI0WmJuRGRnb1Mw?=
 =?utf-8?B?NEZUdFZVbVYycEUyeXliNjR0ekE2Z2dPK1F2dHVhbzBHaGJ3UDU2SUZrTmhW?=
 =?utf-8?B?NnAzYXo4THo3VzVCOGJ6cWtaM1ZVSTRBV3BNeHFhQmpGdkcwVTNXeVJTTmUx?=
 =?utf-8?B?clczejdxbER4dU1FVWJYUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c88579-264f-487f-6fd3-08d8cdba9435
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 11:54:10.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAbj0cWaHs6TiHNtZXOXDyXaGoW1LlM9hUu/BJdcYbrKbn3bcQAh9wyJhfhqgr4u7LD/UyVe/Kuf5/TivGJJgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

On Wed, Feb 10, 2021 at 11:48:40AM +0000, Julien Grall wrote:
> 
> 
> On 10/02/2021 11:45, Jan Beulich wrote:
> > On 10.02.2021 12:40, Julien Grall wrote:
> > > On 10/02/2021 11:38, Jan Beulich wrote:
> > > > On 10.02.2021 12:34, Roger Pau Monné wrote:
> > > > > On Wed, Feb 10, 2021 at 12:10:09PM +0100, Jan Beulich wrote:
> > > > > > On 10.02.2021 09:29, Roger Pau Monné wrote:
> > > > > > > I get the feeling this is just papering over an existing issue instead
> > > > > > > of actually fixing it: IOMMU page tables need to be properly freed
> > > > > > > during early failure.
> > > > > > 
> > > > > > I take a different perspective: IOMMU page tables shouldn't
> > > > > > get created (yet) at all in the course of
> > > > > > XEN_DOMCTL_createdomain - this op is supposed to produce an
> > > > > > empty container for a VM.
> > > > > 
> > > > > The same would apply for CPU page-tables then, yet they seem to be
> > > > > created and populating them (ie: adding the lapic access page) doesn't
> > > > > leak such entries, which points at an asymmetry. Either we setup both
> > > > > tables and handle freeing them properly, or we set none of them.
> > > > 
> > > > Where would CPU page tables get created from at this early stage?
> > > 
> > > When mapping the APIC page in the P2M. I don't think you can get away
> > > with removing it completely.
> > 
> > It doesn't need putting in the p2m this early. It would be quite
> > fine to defer this until e.g. the first vCPU gets created.
> 
> It feels wrong to me to setup a per-domain mapping when initializing the
> first vCPU.
> 
> But, I was under the impression that there is plan to remove
> XEN_DOMCTL_max_vcpus. So it would only buy just a bit of time...

I was also under that impression. We could setup the lapic access page
at vlapic_init for the BSP (which is part of XEN_DOMCTL_max_vcpus
ATM).

But then I think there should be some kind of check to prevent
populating either the CPU or the IOMMU page tables at domain creation
hypercall, and so the logic to free CPU table tables on failure could
be removed.

Roger.

