Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0AF2E69CE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 18:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59535.104509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwY8-0000gg-LH; Mon, 28 Dec 2020 17:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59535.104509; Mon, 28 Dec 2020 17:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwY8-0000gG-HF; Mon, 28 Dec 2020 17:43:16 +0000
Received: by outflank-mailman (input) for mailman id 59535;
 Mon, 28 Dec 2020 17:43:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktwY6-0000gB-EZ
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 17:43:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7176eed-6de4-41e8-90b1-15dece3f670f;
 Mon, 28 Dec 2020 17:43:13 +0000 (UTC)
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
X-Inumbo-ID: e7176eed-6de4-41e8-90b1-15dece3f670f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609177393;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+ImJknkk1GoWK6QHrgdvOKkf5/RNnsNUMixAtUhQPxE=;
  b=FCqC84Vblsmqq+XbZaQbKpY3pSxwrb+ufqBBu5FBSjoLddlmfXzKGAIk
   0Czd6cGbJKayXI0+KP55bDMxkcdv3kj8l04uO7wB+r4vf+eVW9cRu/3ZQ
   TBjw2wiqq+eNjyt8C4K1Ymh7Jmbb1CA1+1D4DUDxOU3R9QUIf1OhIg3ba
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Pq+LK4usiSH/rLe3Q30nypa0tyHGmIdOYXH6qWCxlJ4XnNAyR81ZKT70Vv0wOK1OYJVXxcWz3v
 iYQeSxU2kPjZ8AZ6vWHnUBOOqvHswBoMM0Kx3sa/ZzR9u5ayLnGiJ9CGQOB1L5Fq0vTepZwKLI
 RgP86G6PvVywCjRY15fyIXvtuvrYteWoV7f96kHsSy4wFhJD9gsrm6svO4joX/K1F7c6DvpiPg
 xTwvrMeJayQa9rH24nZaia+ttGmUi2Q+3I+FLDJE0q/UZcNtJlEfRnL0MaUbSZqc3uf/QdA78v
 LNI=
X-SBRS: 5.2
X-MesageID: 34040013
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34040013"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7uxKkjGJc1nIg84dBBa1Din7JaChr5d3X1wM7UfCVUrmvGyTxjUON4tGrPGPBawraagRLU+WPuP5ZsThRdlEuj6FOwIN7LWubdK1MJDPAJughcW24JUMT4xeyw92OY7K2p++e3i1/LGyPjnvGrPWe22zn9DyTl2sYfNiEEqoX5+J+P7ESMCXNF/0vj0hlgmZXBcZeCI9bM43czt8ppoiALSpa70/NRUIQHUGM+3iPXzSt8yyCcFPDPrrVYJYA3W5Y9FOH/STBaAxRBJZCWPD1QSMllpLjq1wauNHp31Rb3zAE4CZkEoKha2Yvm6qE1hfgGpV1PDe1Jtvbqnx6WtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DkWZnDB5Vb49IecYhR41T3/sayS+eDaI6ygtN9QVTY=;
 b=Pj8HV3nq0gW4Ovq4zWbwwD6vNZY/Jy91XLsqFJz1o22BxsiEdhSXvdWqnwT6zNAP9v38bomgBXZUX3drppyGTZiXYBA5cLDgQFRxrm5HKu1chKmwUa22HtynWdlvpBn6C0WdeS2aYivnAqY8RPQaxeRIN0d6ovLujLdfWE9qMyEPii48/GPtjQSasD0p1ueB/KSedf9aXfn+O4bQjBOFdQHjp6tFes7uVHpyChX8t2BBrQXrYWppHK/ERoffTjRQfVWzZJUNVMe0bLtKJhekn0+FdE4QpPJK2x8x7S2f0NbrYeJGxXEZcdzm7Pa3X+LH7jsoegeZt1CcWUV9Bv3v5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DkWZnDB5Vb49IecYhR41T3/sayS+eDaI6ygtN9QVTY=;
 b=UEWw/4Sla9MT2xhO0o4dPmXU9UapDyX7twE4rZ3oVUDA0By8STtgwUczh0viYqLJO1NM5o4ntahM7QV91wYh0y++PrOywJhwLUX/TnNVREPGuplV5Fgmz8TbTCahqfSpbQohwVDqVUnUmtnpXcSFW6HvSv0ljt2iyIiROEmRlq8=
Date: Mon, 28 Dec 2020 18:43:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/5] vPCI/MSI-X: fold clearing of entry->updated
Message-ID: <20201228174304.x5uzdvtw7djqp5po@Air-de-Roger>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
 <c27c1c50-2d98-1796-f0e5-8fbae9f50045@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c27c1c50-2d98-1796-f0e5-8fbae9f50045@suse.com>
X-ClientProxiedBy: MR2P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d48d81c5-7efe-43d0-1cb2-08d8ab580ab8
X-MS-TrafficTypeDiagnostic: DM5PR03MB3066:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB30666E215D3D67F91B2B55798FD90@DM5PR03MB3066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4283wO0pF7hiTZImlWheeAgF0VUhrWbMoFhdqs1CoqGLjN81++O2spHFjj8yowbE/fJEJzqpaQui3AbK0kAeDJ99UJnWqnR9wf9HP9tQ1WiRou/2lsDrBD8CE977ZrwOHv/KqmtNAkJyT42+L3BhyatU1C5oj7rabnaLcVszAp+jkZfmgLORpJc/aZ/4tpZ3ppHqWK4T2Q1bb9WXjuyChzV77gs2JpUHNQtrhfu6kU2Rwebun6C+ojCPDoReSTiZEhDop8jCSzWFZ+1O4KrkRD8awAvD0DhCN9rz0weAjBVCcn1xEjYsD3CNVYIfluuNOeMHFJuCvsglN7wva7nuDWunYWtJ5SNwIcVTFYwHMs01TzQ8gJMVHalUDw1LXwxibGKMZsw2O/NaZ9W/mDApIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(86362001)(16526019)(956004)(26005)(6496006)(4326008)(66946007)(85182001)(66476007)(1076003)(6666004)(478600001)(2906002)(6916009)(6486002)(66556008)(5660300002)(33716001)(316002)(15650500001)(186003)(9686003)(8936002)(54906003)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a20vOHhBOWdPUjJQbzNGTEJIMERHcmd3WjNsMXhCOGZZV0ZPbEY5TFNXRGhQ?=
 =?utf-8?B?OEpGT2xPanloRHljNmtXK3czTXRURU5PSXR2dmd4d0lUL01IdHkyejRCMVVT?=
 =?utf-8?B?bFYvRVdkUG1hWnBUY0F5SXRjdmVhbXpRc1grWVVYc0FhdU5aQTlmVElINWlr?=
 =?utf-8?B?ZnRxbnRVZjBZeVZYRVZUa2tMVnhGcHd2K0wvZENwL2tkeHFVcVUxaERTcWxN?=
 =?utf-8?B?cHlVOHBybjUyc3RTemZYeEZsMWtUdjBIWXByRkNkYXN6NnVhNnR1UWpLc2xY?=
 =?utf-8?B?WEYxWUo5eU5Hb0pxYTF3RWNwNEpIOUl1YVpXR01ZcDZVRGNkMEo5UVNNb2Yr?=
 =?utf-8?B?V0s3ZlU0dFhhU1pzNzV1R0pGUWNTb3RHUXNaK1pQZU03dytGa1lCYVZBODlC?=
 =?utf-8?B?QUZtSE1VSkh5ZEMzUzhUc2pSN1ZJOVJmcG5nTGdQSHhZcEYrVDRRa24rSncw?=
 =?utf-8?B?YlNpaitvdEhxRUFCMG5sdU9QTEhYWC96UG45VC9ZVEgzM2lXNi85L1dtaTc5?=
 =?utf-8?B?TnhpM0t3MXBNMFFZSHBvb1dGV21FaU9XcWdPbjQ3c3NoSXVJSG5yMGxiWFJr?=
 =?utf-8?B?c2dsWmFSekpXcks5ZHdmekNXWVZnWWNQNTV3SXJ1WXdiN24rYW8ydDVpRzRB?=
 =?utf-8?B?VWtNSkU3aGpqY2U5cjE4Z0FFSCs3WXo1YTVwWWlDNldKckhWMldNNWR2aW1Q?=
 =?utf-8?B?QlhDOUFlK0JMSFI4YStsUHVBRldOZHlaMmVCZ050ZXB3MDBKb2cwU1hsTzl3?=
 =?utf-8?B?MU9VTXJDYkNva2hXczcrTGtSQ3drUmFIaVBjWkE0cDhxMm4xSkdsdGd4RDY1?=
 =?utf-8?B?RmFnRG9WRk8vay9YSFF2WXk0TElEcWJJVnhmUGNYRHV0V1NQZTl4aVpXclht?=
 =?utf-8?B?bXArTi9GdXpFdTVFV0RNRjFZMG1PTURYRFhiN1JQUGFURU5lMTBEZTBQdEMz?=
 =?utf-8?B?STlKMDVmdmlLRG1YcWxGaloveGF3ODdvUldUOTYvTnlSTXM2akZTSG56S0Nl?=
 =?utf-8?B?WDF0QmR6b3haOFRXMkpnZ2JBUUZFbmVRa296R3dSQkJ5SWpMeDl1cVdVUDVp?=
 =?utf-8?B?WVJtOVVEQjU3RTEzc2hBbHdtWU1OSU5wNW56SUxTUVBpK2doeVhPRE9EdzJk?=
 =?utf-8?B?bWlmeFlzUkRNV0F3OW5oaGJoRnJmcjg1UXU1ZFpXeXFCdWRCOFdoOFVyWFg2?=
 =?utf-8?B?a3BZOXk4anhHRlQvZ0tRSzVuQlB6blhLUUlnc2dBQVBwVWhmVXNOdVN6ZXA3?=
 =?utf-8?B?cHhvS0tLWkNuTUExYzU2Sy9uRm9ndnpJWlVTSTVpbm1Cc0xuMDNEaDIyRFFR?=
 =?utf-8?Q?vJsivvCRaSQlj+A/IEhTKI8hiTHLYOx3N+?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 17:43:09.7314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: d48d81c5-7efe-43d0-1cb2-08d8ab580ab8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/pbWuVXBNyzdClhzMsLTCidG/IUk3jTfcIilNc3QcMq6gY9koVCKu/D1Oq/z02vs382T6GLlZdjqZDfTvJ86Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3066
X-OriginatorOrg: citrix.com

On Mon, Dec 07, 2020 at 11:37:51AM +0100, Jan Beulich wrote:
> Both call sites clear the flag after a successfull call to
> update_entry(). This can be simplified by moving the clearing into the
> function, onto its success path.

The point of returning a value was to set the updated field, as there
was no failure log message printed by the callers.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> As a result it becomes clear that the return value of the function is of
> no interest to either of the callers. I'm not sure whether ditching it
> is the right thing to do, or whether this rather hints at some problem.

I think you should make the function void as part of this change,
there's a log message printed by update_entry in the failure case
which IMO should be enough.

There's not much else callers can do AFAICT.

> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -64,6 +64,8 @@ static int update_entry(struct vpci_msix
>          return rc;
>      }
>  
> +    entry->updated = false;
> +
>      return 0;
>  }
>  
> @@ -92,13 +94,8 @@ static void control_write(const struct p
>      if ( new_enabled && !new_masked && (!msix->enabled || msix->masked) )
>      {
>          for ( i = 0; i < msix->max_entries; i++ )
> -        {
> -            if ( msix->entries[i].masked || !msix->entries[i].updated ||
> -                 update_entry(&msix->entries[i], pdev, i) )
> -                continue;
> -
> -            msix->entries[i].updated = false;
> -        }
> +            if ( !msix->entries[i].masked && msix->entries[i].updated )
> +                update_entry(&msix->entries[i], pdev, i);
>      }
>      else if ( !new_enabled && msix->enabled )
>      {
> @@ -365,10 +362,7 @@ static int msix_write(struct vcpu *v, un
>               * data fields Xen needs to disable and enable the entry in order
>               * to pick up the changes.
>               */
> -            if ( update_entry(entry, pdev, vmsix_entry_nr(msix, entry)) )
> -                break;
> -
> -            entry->updated = false;
> +            update_entry(entry, pdev, vmsix_entry_nr(msix, entry));
>          }

You can also drop this braces now if you feel like.

Thanks, Roger.

