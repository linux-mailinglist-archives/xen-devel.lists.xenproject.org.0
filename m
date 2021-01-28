Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7375730750C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:45:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76956.139145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55jm-0004gz-Aw; Thu, 28 Jan 2021 11:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76956.139145; Thu, 28 Jan 2021 11:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55jm-0004ga-6x; Thu, 28 Jan 2021 11:45:22 +0000
Received: by outflank-mailman (input) for mailman id 76956;
 Thu, 28 Jan 2021 11:45:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umji=G7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l55jk-0004gV-Cx
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:45:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1601800d-8652-4716-b784-82a19c9c1a16;
 Thu, 28 Jan 2021 11:45:19 +0000 (UTC)
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
X-Inumbo-ID: 1601800d-8652-4716-b784-82a19c9c1a16
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611834319;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BFgyaDf/neRc0hhIgSVJ9lSFNEkaCiSbvTt8DiCV8Tk=;
  b=JqCB3pzXKJ8iqgTK2lpOoKln6YHCjKJIrkAgiJ6HYXpv48Ueiafa7VFv
   Jl+9T9C/WgVbTJR2c3UXSbAbAZw1NK+BEIx51EatdsOGC8K+W7YZQBe9p
   R1fxiVPQ+TPVeXURcZN44jGaRQx3rXvFFQAetZBSVc08ciovapaOgtwTw
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +Rd0BZt6k4F5lJj4tSyuwLrSJIR0q8vUd+dAoHHRzl4DoHJPXp2TJSbSXSBI+lU4xEybRAT78U
 Wjm6SiQsezzdM6ZUT+HAkLGRR3O0zbBle4e1XThIyrlMtb+eGIIoZ8kyXpBCgRZIOYqocVvI3y
 BB0yEHjlHRagZqqHvKrhUk+HDHz1neV079B44FHTthtNCBUi7EU74vEouVrwi5aYlI4XrG0Ufr
 qptK6q7JuMSPy5S/jB1rLCuBxoJnPUl8OZ9TV5pN4/mxt/4cFn1iQMI8d4+Ksuew4V9697thVu
 fyc=
X-SBRS: 5.2
X-MesageID: 36013865
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36013865"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGOJ2TgcQzQeKrdjIxX6u2chjUpL95RwquGtYPnak6csJ6T/Z3h6pkXewobQaywKhoWSCxRd1nTH78ZKuTNP0H0xPQo0YqdhfsU958C35iL1ZhvrJJjJWgxBjB4N8liI3zXvZTCoalKMOZBZMDobI6fs7X85cgZwyij4mVpfbAwcnRVciy8ygSDNIhojrSl9urlyD/UyQI3D05I6BF+Jt8RHDK4kCf/yjlnvwGf8dAjM0BzeSSDYOvSL9xvLrmgVp00PKnT7CDcR7OzuIjq7MfxaY9N/AQm/7l7SOr3F3gFTUnA0lLQ4fVDRm9IouOw38yCE8AiI8cPEw12SIn4JEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFgyaDf/neRc0hhIgSVJ9lSFNEkaCiSbvTt8DiCV8Tk=;
 b=M7iqarCpxhrYt4nNpLqEfD8ooaKyTooqbr0JkrKxAPOeFbcpMwarBw6ag62VjpvjlNrxolN7i5r/ajpfyhLesKxWwb8YoFjPtDQLZZo3LhBGtlot7hLGEXCAj83/P1YALtXe4CDvves4lC6VXrazoeaTjpNFacS0GCtzlJKNBbjd6tZAicggxmzuh1TOnjvjhSGufE4qbM0NVv/4GPHnKdsLzHNAL7dkannGwCHPzHRMTp4nTL28XkuNbxn9+/EJEVEVVG8aTka3dcwme8A7XCxaik54lFmvUyxpmWzyutPh6JpusBsinoIWeEdO617Rdo5Cw31aglEusRwe0XLiTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFgyaDf/neRc0hhIgSVJ9lSFNEkaCiSbvTt8DiCV8Tk=;
 b=XwnBNL6R3PTw+LM6TMR8/qZQJGJzwZtXkV34P5Wh3VFAuxtE3sM+C6guHo4V3/qLrPet1543cGPJCFkhspvoZKogPTUgOFIesmtlwOMVjTSncjw4Pzs0TvP2ugNgXGSf0AqwoThi8uqOkX9eyLnZprPO2oztPN219N2qAo60wWw=
Date: Thu, 28 Jan 2021 12:45:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2] NetBSD hotplug: fix block unconfigure on destroy
Message-ID: <YBKjxWbrlW+RgT1u@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-3-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210126224800.1246-3-bouyer@netbsd.org>
X-ClientProxiedBy: MRXP264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0e0cb91-d4e5-4998-665c-08d8c3822dfe
X-MS-TrafficTypeDiagnostic: DM5PR03MB2714:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2714D4132C4339C07A89A3DE8FBA9@DM5PR03MB2714.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zXh60TQXFzP1G8gsAmAZ4/Ko1rKALdri8fqnAdVdkRPrOqZQweXi6dZCVEe+VCMBAhgu6vJqEls6GV9l/OhNOBgGv4LdRVUjr7vPKyEAbh170SmYUDjF0oF76RtVU0/1jtxDF08FhSD/w+6QVzxo+dxSWYXNYiCbDgjduHqBR5K996+FFIjRScWPNTA/eVHrd3gTwU1MMSAxbgXmaiGmpXLskJkvyfw5Af9eoW0bj+LJKcV5e2PzzDuMWcEkw8SRShfPGyxLy7FdSc/aReZ7GQts2Z2sFdG2+KR3nX5pkNWD2mZVaw7e5L3A2ZFmWY3M1j5kPmkvCdhF60REY8lcyDkw5G0K5Wgd8DrF5j2fjMlSMsTONpT2zn4RNoKQ/AHagecfndyF1D9fFYqdSu4HkQ+GRKSqJPWkARll0tglzvrfvvUbFgpIVN4udr539tAnAsav+pvsgLNmgTFxSTl3FCS/ZR6rVCKA9GVbs35S70XkRG+ZG6yaydlZ8Gm6Ax69g+W2RmH5asiM1l4otT0lCwijUSOp/YgVPLVm9iiFuE+nZ0nWo7QgSkFy+pj9uMPU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(66946007)(6666004)(66556008)(66476007)(4326008)(8936002)(9686003)(6496006)(6916009)(956004)(4744005)(26005)(5660300002)(186003)(16526019)(86362001)(6486002)(8676002)(316002)(2906002)(83380400001)(33716001)(478600001)(85182001)(54906003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WnVnWjFiR05IeHlKZFFjOEZiRERLUC9NSkFsT05NZzFGSXUrcXdUSVB5TW1a?=
 =?utf-8?B?d2pLUm54QkVXMVpRZUpvelkwbmJ4ZWhCdHdGdktIdGl4b1dJWnMvdGN6VmVI?=
 =?utf-8?B?SHprZTJsZlZhYjZXa0djL3VlcEVncGxIREhBRmprT3M0azF6bTh3empjMXZ0?=
 =?utf-8?B?RDBFTU5FWWZpOXlQcGhzV3V4NjAycGlsY2dscURZckswQXZKYVFlN3lvOFk3?=
 =?utf-8?B?MVJGWHhqVWo0Nk0vbU9vSy9CaGZPSmU5TWQvYUxET3NEQXIraUE2ZXd4MzBw?=
 =?utf-8?B?QUwvL3RTQWNsenF3YmpRR2hMQUtZeFU2Zno1a0N4dko4MUg4NzlwNmV0Nlg3?=
 =?utf-8?B?NTF6Q1pZZDBMSXZrRW14RlIvMFJuNWFRa2hwSG9NVGxlZEdwZDAyMDErYlFV?=
 =?utf-8?B?TkM4Wm1paTFybGl4dEJJc2xPM2kxYWhzdlhSbFc2a2tqQUswL3IyVDJTc090?=
 =?utf-8?B?UHpUN2s0b0FEdnJxdklaanNyM25nQkV5VU9FUGlDa0lvdlJYOXgraWJtQndK?=
 =?utf-8?B?c3krRzc3V1h0dUY2NnVrbU12dERKTkFrWTQ0V3BGMDczZjN0VURXYThqd1BO?=
 =?utf-8?B?R1Q5V3lrTG5HRlhNbEROZGI2WlNTaGxUbXpES0o3RzluaEFRaXh5UGtrbkE2?=
 =?utf-8?B?UWdYV1hHM01TVUZoOUVPcjkzR0VSQUp6bDdXZ01aTDErRDVsaFppd3Zia2dN?=
 =?utf-8?B?OGtmTGdFaW1GcXBnQTJMVkZiVmpjelg4L01wQ09DOGlEMi9zWFZxaW5tS1dU?=
 =?utf-8?B?MDA0aGVtZlQvQ3FoRkNXNXF1VkladWtiRExBQSszVWR2ZjZrSXRObk5wODFJ?=
 =?utf-8?B?YlJab0JKL3FPZjFzbzR0M2p5dUxrUVJ1RmtaUVlzcHJSU2xHN3ZMdVFwbWpP?=
 =?utf-8?B?ZVpYbXpMYXVvWGFraHY0NGc2b21wd1dwMW1rUEtyYVRmbEFDRWdpb1dkRkpp?=
 =?utf-8?B?dlZ6VDJhdDl0ZVgwTnJ5dTR4SlRpd045bHVKZlZ3VHFyZGgwV080V1VKTkI3?=
 =?utf-8?B?aC9uMytyWDVDRlYvcGFIaEhTMkNGdm5JemR3VUdmaHlOV2FnVkkwSHF5cnI0?=
 =?utf-8?B?cGJrdnBRUGRlSFA0NmNMMGhEMUN6dS93MUU0ejlKMVpoR3ZlRmlNTzd5MmYv?=
 =?utf-8?B?VThnMTd3RlBxQllDOFAzVHNIRnZFbFhPOGZ2TFdOeFVzampCUUZNMlhTWmFu?=
 =?utf-8?B?dWFyR2pMamFuRmo3NTRwZkZaTU41YkhmK2RzVk1KZXRNc1RydUFRZlZRQjd6?=
 =?utf-8?B?aTVaR0liMTUrZXdmUFlsUk1YYy9SYk1HbnVjemFzR3hHUmIyNTdObnBTRmJo?=
 =?utf-8?B?OUtTNnNRY2c0bkdyNUgwTWpkeHZVZXJKS1NCVzJzYUJwMWJjVGpHQlBBNU9L?=
 =?utf-8?B?TVd5ZC96TmhCVis1SVI0WFVEWUdFSHVoMTJ6eGhrQUJ2QWNnM2Z6ZUJGVmts?=
 =?utf-8?B?S3BqRHFDdGpiSWRxSjZIUkFWdUR1c0JieEc5TDJRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e0cb91-d4e5-4998-665c-08d8c3822dfe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 11:45:15.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkvA4aNzAbGEv6qv2JI3YEAJZU9JQSlyA37Bv/Y/UZ4xok+ZS1b/W5mdrMBnwPEcM0t1kjT5BtjKuXN75tr4sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2714
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 11:47:49PM +0100, Manuel Bouyer wrote:
> When a domain is destroyed, xparams may not be available any more when
> the block script is called to unconfigure the vnd.
> Check xparam only at configure time, and just unconfigure any vnd present
> in the xenstore.

Can you paste the output of `xl -vvv destroy ...` when this happens?
I'm puzzled as to why the nodes would be removed before hotplug script
execution. Could this somehow be done by NetBSD blkback?

Thanks, Roger.

