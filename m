Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784832E3838
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 14:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59497.104433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktsF9-0001cY-V3; Mon, 28 Dec 2020 13:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59497.104433; Mon, 28 Dec 2020 13:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktsF9-0001c9-Rw; Mon, 28 Dec 2020 13:07:23 +0000
Received: by outflank-mailman (input) for mailman id 59497;
 Mon, 28 Dec 2020 13:07:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktsF8-0001c4-AT
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 13:07:22 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74cee0c8-56bc-4d8e-b42e-c6c88c9acb87;
 Mon, 28 Dec 2020 13:07:21 +0000 (UTC)
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
X-Inumbo-ID: 74cee0c8-56bc-4d8e-b42e-c6c88c9acb87
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609160840;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wPTD72Lwnlazv7mqVlA5zMrLkWp59Y2iQHAfnLC5VMc=;
  b=P6vg+5PjPbi9OH5Wq5HpyJjNx6v3b5NYfV2m+TooGSK+mB25xUYPWF1j
   h6sHk1WJrzYh/2+6ksVzDwafeuiNjeRf8eTB5N0ecPvzC87jpEdYaZ8Qq
   J+kOsZAi7KduntwP6FiDqALQb/hG44C/EdK0mOx6Ct1l7MJ68srEvLdBA
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3NPs+YpkVNhL1urHmlroO8ZQQAiz1TpQ6U7CtAz7L2g7/+DHTymkkpA7SVxhEGlFQHTy4HP+KQ
 SFPjlY0wusjfI7sgc/BnarE+SVJ/NkZtH0F/TXTkQKU59wgXT5fzan+30JzrIZjKlVdukPIkMI
 5nvc19I0oKWectd1NsnJcufNP4a0olrgA73g4ZWaqCQNyPmzZy06RR3sbzo2UBYQX9Gxrj2Uxu
 jYZ3P7w6sc8AslV7/OE5jj5Y2dzzgfoCU330Kk7VbF+Gg/TWbNsxdro/2YwCG8pll9mSSqcKfw
 ZsI=
X-SBRS: 5.2
X-MesageID: 34258314
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34258314"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIwfP9QttM+GRhEWIzdto7am7D5KMgIXHydcP2A++O4FmowctT0r7SGltZLBB5/LUTTSDbKTGwCNT5aRgfLB8noi4CrQcmSxM4nMAzHjaCegKiHSAXZ6djgauoszYhujLGTSYdrbHvj4Qeei5wwk//diJeumplr4OlN5WmcWSf7KW48EvFuAjvHxvSJi7zBMQGOow9MkTrFoplPMgy2CuTEJ50Z8JeSP2byHuitivIudQnwcniY2nJn/lXnbRDGAOMOu2KXsFZCK+ona5Diu7iRvzGl1yMGFM9erT8307eZ29b/UwIb6Hh5v1JHN+cjfBQz+O9TwKxCpDza2iyPUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLXeYncdNbc5vZCVmz9o6Pw3YQNdxrO4q985/hbVTjQ=;
 b=OMbbC8XHzKnPYmPe4dO3QTz4yRpIhd12B82JIglEiIonc9YiIWCmzl+6HArQWx8awJbEmou07DoxmtBRaqSWC9aMkq0pK2uAuQhQcyg3++rNkcrGQ8WwaWMnQEW95xAg+NGu3QKUXhEbINdK0HxzIp1oHkk638jRfOXF6hrUHXz12YquilYU0Qu7xIYevWPLnLRK5Zx2a84iMC8Amtz4xaivD0uQbM8R1AAONmzPreUDFA+9XVGjk4HejMe6NCsa0IEIMdIE82DSzizf0Gosd8ssKmjPq5jwLLPAz98U18GAQpQbE7SWmz79HTRUC8czaNohPGHW+rdabIikU5ssvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLXeYncdNbc5vZCVmz9o6Pw3YQNdxrO4q985/hbVTjQ=;
 b=Z1S3D1HieGbiipDFliQ50PopFj8CYHjqmOID6J4B4JlPXrhoMAXP0LwFnGAvY1RBTA8CAcPBZ9Qh+pMxtYYeSd3Bjt4+xcM51vDYxEYAxHFcaZkBhMyoqmTiLTslQVBWdUc+GpmrbrhjjYMThFd61A99TNVhGANOveVK08s4B+E=
Date: Mon, 28 Dec 2020 14:07:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/5] x86/build: restrict contents of asm-offsets.h when
 !HVM / !PV
Message-ID: <20201228130709.cbwdujdhk67rz5c2@Air-de-Roger>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d41ce371-262f-747a-9f6d-e5ab85a93aa5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d41ce371-262f-747a-9f6d-e5ab85a93aa5@suse.com>
X-ClientProxiedBy: LO2P265CA0284.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d0334f-844a-4640-b515-08d8ab317f19
X-MS-TrafficTypeDiagnostic: DM6PR03MB3945:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3945BC7590B5C9FAFF3F68458FD90@DM6PR03MB3945.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8D9iK6Y68Agq+j6PzMMHko4YoAQWWLuwlZbbxYcPQ67UHMk5Lahxx4YICyK6V/clf0hIXfwvZkc5ssOrYvCjYbX+EWMAYWDyCy3lWTCo5I7/r3yMnXrZ0yJcdYPdngO1fHjDdH164SvVBxedz91UfYgSKtoegI+WESrtskbnEFFfpB+w+EuaERT5rZVGfiJKeMNSwD4StUd7IBxC8+1aT7sQmbIBFNm+Zc3JmclIUZ42dN1+0W7BpWfjhX1NIb9MTPeT2XUUJoHd05/HIY6aHwbZWIhow7Xku7tS4ypZ0MIGw7pXevp9bIevW/6iY01xWWbMoEcKMYbH25jcCXupXtB672xq3NBwJxVTfWSyHtRLnu38bw3BzNNmkOsyK2Lb9D9i+FSzR+d1c6AOaUTZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(366004)(376002)(39850400004)(396003)(85182001)(8936002)(478600001)(4744005)(66476007)(66946007)(6666004)(2906002)(1076003)(54906003)(6486002)(33716001)(8676002)(16526019)(9686003)(6916009)(5660300002)(66556008)(86362001)(4326008)(6496006)(956004)(186003)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ui9XZzhKRk9zWjNoQWFJbWdvaFUzOXFJRHgyVndEYUVta0ZDZFdZSE1MTXMz?=
 =?utf-8?B?bnh0eTkvaDJTUm94cEdZUm9SdSs4dGNVRGZTbGdXSkowckV4ZGVSbW1CeHNm?=
 =?utf-8?B?QlVkYzBvM1BpaHNHR3BmR0gwMkg3amNFM094cGR0WnkrcGNOQmtEWUhUL2M3?=
 =?utf-8?B?b0t1TzV5Wlh5V0RMYlRscjhYeDNxeHdKcGVhRTh2NlZGZTFhNWRBNEd1cWh0?=
 =?utf-8?B?U2hkMWRPK2trZ3ZEM204M3Z3NlNWdFpMZjJjK2VaS1JLQUNoQkt5YkY1bWo3?=
 =?utf-8?B?aVRNdFpVZ3NicjVNb2NBVjZ6TkhSUFBlKzdjeWJOekdEa0hhQkxLVnpKQmxy?=
 =?utf-8?B?T1p4TndYREcreFBrS0pPUUI4VklPYm5oSlRJRnJWbjFpWFZYWXZ2OTB5K0RD?=
 =?utf-8?B?WmdXQVlsYXFjWXZnYkJEbkJsaVpqL0hvMDVucjQzUlVTcmdjbDZPblpKRENI?=
 =?utf-8?B?Q3prVVpaa0xQbXNpdlN0MTUvRlQxOWk0c1lJN1BoZldxRFFvQXc5M3FIeDFJ?=
 =?utf-8?B?SjVHTmJwMUxtelZaaElPMGRvd1R5S3JGbUJ5TlU1Ynh6NmtxUDRRWTBLc1JV?=
 =?utf-8?B?aDNheiswNGVGN210dGNtd2FObk1DK00vc3gzQkUzRjRJTUJSTy9GYnlGbnl4?=
 =?utf-8?B?VXpKTUFkNU5Xd212VmZEQ2h2YzhIbGlOL0NlWTdKbzlmT293VEtoUE96SlZo?=
 =?utf-8?B?aU9YVnBrRUNPWWI5cjNSR1ZWalNPdFVCZ0RMQk1kMXQreFp0UkpVSnNSVk1Y?=
 =?utf-8?B?TE1xVGZhWnI0S0FrcC94THJIY2kwOUZwT2RJWlAyRklDMjhhZ05jbUJ6eERC?=
 =?utf-8?B?VitGNS9ETkpKM0tmRkJzZG10aEs2NzRwNWdRN2ErVmt6S1l5TmFxR1kyUTc2?=
 =?utf-8?B?b0lqNzlPTEhvQ0ZsRFVzZTIwMkxnZCtlVTlHb28vUVUvQ2VEejNOSnYrTkVx?=
 =?utf-8?B?VjV3ckNDdzlLOG1OU0M5VldiaEpPRXQvdmgzSFI5ZHVEYkozbnZhYllXU2ow?=
 =?utf-8?B?WWRhS0xQampKWE8vQVc5UGM0a1FTaE9FVVhkajFPSVoyeDlUOU1FdjRxclMr?=
 =?utf-8?B?aElpVHFjSm5ydmJ1VnN1Wk5Ib0ltVzNmSktieHphOUN5OEdXa3ZueUhxbXUr?=
 =?utf-8?B?TEQvSmVnL2paWGE3ejBiL0crR3RzdEpzZTRRL3l0TnRzamUyekFOZk5uempD?=
 =?utf-8?B?WEJSZEQ2Y3BXVkQ1Nnp4N1dhN3poSk5QRDF5UEpEV1NQb3dDMUZHVGlTOGh4?=
 =?utf-8?B?d0FKS1F3RlNWMDBQdDFJOGtSYnFMQURmdmRiQitua0ZyaGVLaDRhd0p6bWkz?=
 =?utf-8?Q?j5qKBOV27eSKEK0uJL19BeWJCPEZ8fZvZ4?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 13:07:14.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d0334f-844a-4640-b515-08d8ab317f19
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTr+WvtTljaaX1ZFD8IApq73HJgDL/8OKrsClGtSJn3WKoM7/k8vMTkri8pWy+P8RtNUjvDTG0+BXwadBE3hGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3945
X-OriginatorOrg: citrix.com

On Wed, Nov 25, 2020 at 09:49:54AM +0100, Jan Beulich wrote:
> This file has a long dependencies list (through asm-offsets.[cs]) and a
> long list of dependents. IOW if any of the former changes, all of the
> latter will be rebuilt, even if there's no actual change to the
> generated file. Therefore avoid producing symbols we don't actually
> need, depending on configuration.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think that replies my question on the previous patch, hence you can
add:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

To both.

Thanks, Roger.

