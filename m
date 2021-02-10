Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C478316A1A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 16:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83646.156189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rMa-0000sf-JB; Wed, 10 Feb 2021 15:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83646.156189; Wed, 10 Feb 2021 15:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rMa-0000sG-G3; Wed, 10 Feb 2021 15:25:08 +0000
Received: by outflank-mailman (input) for mailman id 83646;
 Wed, 10 Feb 2021 15:25:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/zh=HM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9rMY-0000sB-N6
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 15:25:06 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2231718c-182f-452e-96a8-0e5f21157712;
 Wed, 10 Feb 2021 15:25:05 +0000 (UTC)
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
X-Inumbo-ID: 2231718c-182f-452e-96a8-0e5f21157712
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612970705;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vyIgeLSJb5a9rLDbPUxwfP6jZo4f6iPsP5l4BS2OFWw=;
  b=XavaoN81BV06VEBOTs+0hBQT/a2/TIjLbCMnD4a6ktNfJZToDzbA8m7M
   OTjXBsqwE8+6BRDer0xIvXjyiQLBhUItctyk403O3Qf4FgEyEB8destPO
   zlv2yocu0tLPo5iLCOhqj/RUdW5zGHnqvwOlkNJgtvTbnfLGt9UwGEQfN
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uhOn8mhcw0iueE0B+S3PwMfm3OQBkD8PBFRNGpOsbVdGqE3uQOMtG8xN1kLHS8NPl4urV36CFO
 DtqmoH2Pkpi5phorW7tAyuek240meIId2zLIlxOPq8xjpJt1gcrf3ooY7JiNM3yZOF2SHVXzPZ
 FjxgIvlYa1tBmYfCYt12dQC7gUHF9Aa425ZwE9iStI+irIncnWvXQwxF2P3MsEqpP9L+LLyrQO
 9TbLzltIo8oPyJmEmUgt+7y7oIUjhDAAUqENz83/AJvxbbx3aAFT16ryU2bhfJA91/ggai+Lmo
 SeQ=
X-SBRS: 5.2
X-MesageID: 36991317
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="36991317"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Da3/gl/EjEgfBO0l0dAFkEfVX0hD4jCFe8dGZlrFweunE4qxcc+7WTge6yIjplx9ai9rUK51L+2amm9ewgLFRDqc575SnrH1KSUej2fDhm8K+EsTV8TY/ervyD0s2YOjxMmIQCMh51WqulYlm9KMREfEZ/loW9RY1iEfANOHp6MWrf96lzY9EHrrBtxCBJ8fH1Ccy4ApddCSc2l8AS9tqsxmlLYJPbGiRspSfFyxDY7bDzE0QXWLO+LT0tyUjdGBYryerwna4puMAVN6nsNx1++0w60tXALKwvcT8B4x4UMlsNySNd8GH2RLZYdqHynvVG2ZB4aScjXaEMSTZ8VqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjsImBlz3+FL/q/Zd8u4pOch7FZ1qhKtrHNIEJ8Lqpc=;
 b=d9Fkj6wXYLXlNfaBCFVNRK3aCv8feOTQ9+fxhRyHp+y04GmSYnpCMPakXkoIfFNCyywG10EvXuXAt904j9K77djI4PA1dPM96bPuYTzDysxgMFzzFl2DAIKR0y6hLnZahYlMx+Amk/ikB3HZJr+QR/4yJcBJix73+ZSLOQrUzQ2P+52TKGYGfKWtf58bMeiJNN0PUhwTHysGt0bBDTiqecrKuK309qrLPcUD+CwP3IY1siTxWHLLVcW2T0btjD0pX1/9fnFGri5xTTj0mz9XloKHFjdQFoNYbvslqkQkgCyLK/511rgJ+rO24xAC3CbbEw+uWyOx5nctXmyEZduJ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjsImBlz3+FL/q/Zd8u4pOch7FZ1qhKtrHNIEJ8Lqpc=;
 b=qMN5SO+3TyjmVBVtXXdOskxdfaWbtHhls73tPF/C3CziM7HkSl//XlYCGbp9ADIxzkgdxxTl1Cc84tQ+gtrf3yWj/D0bBLchrdWfzviSurnpFdGNCfz7sitsXKab063/aziR51JxAULDiM7Oq4YgFutVBYy9z9KhP0sM6xgvBXY=
Date: Wed, 10 Feb 2021 16:24:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <hongyxia@amazon.co.uk>,
	<iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
Message-ID: <YCP6x9ApfJQuhALl@Air-de-Roger>
References: <20210209152816.15792-2-julien@xen.org>
 <YCOZbNly7YCSNtHY@Air-de-Roger>
 <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
 <YCPE0byWKlf/uOFT@Air-de-Roger>
 <65797b03-7bd8-92e9-b6c7-e8eccde9f8ba@suse.com>
 <e1c7c616-0941-b577-5842-a51374030798@xen.org>
 <71c4150a-0b81-cdc3-b752-814f58cb5ca4@suse.com>
 <df760d78-a439-db0a-4b88-813b002f0a64@xen.org>
 <YCPJXe1L1SCXoL7a@Air-de-Roger>
 <bb242b17-01f3-6312-b563-f82abc5d300a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb242b17-01f3-6312-b563-f82abc5d300a@suse.com>
X-ClientProxiedBy: PR3P189CA0114.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44893c94-dd53-4f55-4827-08d8cdd80848
X-MS-TrafficTypeDiagnostic: DM6PR03MB4473:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB44732AE4E8B25423F224CE728F8D9@DM6PR03MB4473.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QGUnBqrWbo+nAc8BEoi2vk6ntQyDrVkj8DIV850rAsQq+083Sy97Y7CcYfNO2q1cOKfP0ztmiq/sIH2AnXdglgO8YM/jFF3okMfMrrFuLTywgHeszh4VpsX1M3hyn1AgMeJHuoghLynM5JpywCgGGbjw3nMBuhWRht/LS0fajUuSQMZIWSAjFKDTq0nikgUvbEyt5qn4yRsT+vPF0cKZlnbJT+xim/+58l95QAgJ1rOAnL7I30/NVL+wezM3JL1aVNoI8eGggsebfswm8gk6vlOm4Vj++dIn3m2RR2Rbp3jeFEIfo6jmqBP81yqF0FM2tNtgg5GYJ+GuvvFg1EEwTHdsmMIfcz5RdPYwEk6kjECQvgalysftVZI0DQPwcYhY7MO8vIq0qxY+T6DH8cl7TkrhLPOc/spgxhFpE5Zz4h4bR2Y10yD9zZWBmyKLH2kC1F5kzAIBU43+aAMPfseauLhzjxD72JP8dQ4jah73rIijk8BloInv94MkudWlHNaL+C/VSsOa5fYmE3PeMuSCMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(136003)(39860400002)(366004)(376002)(478600001)(5660300002)(33716001)(85182001)(53546011)(9686003)(66556008)(66476007)(6496006)(54906003)(66946007)(2906002)(6666004)(6916009)(8936002)(86362001)(16526019)(186003)(316002)(8676002)(6486002)(83380400001)(4326008)(956004)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDVzS1hZUHlOWitUaXpObVdVWWZZTm85djYzWlIxMU0rZnBwVWNHRFppODFs?=
 =?utf-8?B?V2UxNGo4cCtJMWxyZTAwYzFTYVNYQWk1T0M4ODl2QkY2NUlFUmxWRmRsbHcw?=
 =?utf-8?B?TFIrZVJSN0J3STRJdHh2MGhYZjdyNzdBSFpNYlJFaENDNlNCSjM5M3dYeE9u?=
 =?utf-8?B?RmQ3aVRrcHMxQWwzSmdRSS9HMUNXaExoVDdkQStrREMrMEU2UDJySEw4V204?=
 =?utf-8?B?T05BSUJJTUZCalQzQk9MOVN6MExYdlhWL1VNaVdEb2s1ckJFUEc0U0NCTWs0?=
 =?utf-8?B?L0MrL3MxR0oxNzBSRlEwUm1GbjRyVjFydC85dFUzS0JhOFVuMUZKd2F1Undq?=
 =?utf-8?B?V3c5anBtNEhlZW1MdjQxODZDK0tpVXRZVlN5ZlB0aW5iWEFxVU9TcGQrZGkv?=
 =?utf-8?B?TWtNeVY1L21pSHpBSTNidjRoOUpPTUVPNTR3VHhPLzhGelh3Wmc5Y09ldjBY?=
 =?utf-8?B?aGRlZGlaV0JteXl2L3gyNHQvSUVuRW5WWm9zekhuMTFtZ0ZGUWlKVDlicVlQ?=
 =?utf-8?B?ODI2UDZCVjNLdTFEcGRuSEIwN2lUcEVTQkR4aUlPZVd1MDRFSDVmTG1sNFVE?=
 =?utf-8?B?TE1FOXcvTUViYkFGQkFaaGswVnVrVktvTmpsRVpUV3lyUGExMGRJWTlGNEly?=
 =?utf-8?B?ZFlCVSs3NmdkbGdDdWR2Sk9LaW05UmpxTnhRODdpenFqdkVNT2xMYkQzTkRn?=
 =?utf-8?B?M3FHdmRIbWgvRnBHSGR6djc0enhTZmViVWcwL3ZudGNIc21iYy9VMURreHVJ?=
 =?utf-8?B?cllKME1YRVFhZHhZcFF3aGo0Qi9vM0c5bTVpdGpvVVVBdDJuNzlLa3JJdjRj?=
 =?utf-8?B?dzhSNmZINlpodjNJdHJsT3IreXkzZlU1QUwwWlJvaVhGZDJsSXpkck1VMU5p?=
 =?utf-8?B?MmQxbS9ZTlh4RHN3UVNSRzh6bjN6VTBhU2MzdXl2Sjd3M3p2d1hhalUzL3BU?=
 =?utf-8?B?Q1NJSmp1Y0gxbUdQT2NKMzRheUVkZ2hTVVhTcE1NaWRNalJlVURHQ1RIZ0NS?=
 =?utf-8?B?OFBGcEE4Uk90ZXZGejZvYk9sMzV2dWgrMkp0dTZUOFNpYmhWT0ZJQVc0ZElP?=
 =?utf-8?B?UGR1VHFhdG9Dd2xWQlc1UnJyd1hENTlub2hpMW4xMWdYTEtmSmJKUUJHR0pv?=
 =?utf-8?B?ZnozQWV4L0RORjNGSklwMG5rL2VJdnYzQ0dzZStWcURoNlI3cTVoWmtjUzhl?=
 =?utf-8?B?ZGZLdmowb09lMWxJdHd5ZjFqeDQvRjhWUHJGd0t2eVBjRG00UmxrM2E0QVFy?=
 =?utf-8?B?Q0NLQ3dOdWpaOGhLVWYzekZaa3JRMTd0QWlZaHpCOE9BNDdUU3AxQ3hKQ0JM?=
 =?utf-8?B?cCtVWXMwbDUrQ2cwQkVkOS9kNXlSRmJ5a0JQemJuc2RwWCs0MjBid2hGWWh1?=
 =?utf-8?B?bW1FcHhPT2xFcVhNU1ZRa3g2cjRESitTNGVRVmdUdjBEQlBkOHArcERVRkxP?=
 =?utf-8?B?ampQM0pqcFd3LzkzMU9ad05FS1JseE5yNjFSTkNWUDN5WENERUYzMG05U1Fu?=
 =?utf-8?B?bkZENlZTY01BK1ZrWWhVSmsyeGhrdmYxdFkxNEZnYkR1ZThXdXVDbTFMRlFy?=
 =?utf-8?B?dlpXNFJ6M1NMTVdmVDN0T1piSHMzcU93VmNUMlJQV1huWWVFeFh6eWhJK1hF?=
 =?utf-8?B?UkxENi9ub1BIV3U3SHkrd09LMEN3Zm0zSDlEVHFsc3Y2Q3Q3OVhRREpYMU5z?=
 =?utf-8?B?aTZVcVlHaFhIejZmZ3pGN2pZaHlVWjg3WTRJc0dBc21qNUxzZGtDUWNCenJi?=
 =?utf-8?Q?TdIN6gJpNhVZUAMKKlXUsJwvNFDvCdQl7C3SOMz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44893c94-dd53-4f55-4827-08d8cdd80848
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 15:25:01.1337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5bB3iT2d99hldGoGRPQo0a7eKxf0foGORHymo8XpQsucrKRMai7sSm/Ul6Tkm6uTlPe6yRFbCCuwUITNtAmiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4473
X-OriginatorOrg: citrix.com

On Wed, Feb 10, 2021 at 02:12:38PM +0100, Jan Beulich wrote:
> On 10.02.2021 12:54, Roger Pau Monné wrote:
> > On Wed, Feb 10, 2021 at 11:48:40AM +0000, Julien Grall wrote:
> >> It feels wrong to me to setup a per-domain mapping when initializing the
> >> first vCPU.
> >>
> >> But, I was under the impression that there is plan to remove
> >> XEN_DOMCTL_max_vcpus. So it would only buy just a bit of time...
> > 
> > I was also under that impression. We could setup the lapic access page
> > at vlapic_init for the BSP (which is part of XEN_DOMCTL_max_vcpus
> > ATM).
> > 
> > But then I think there should be some kind of check to prevent
> > populating either the CPU or the IOMMU page tables at domain creation
> > hypercall, and so the logic to free CPU table tables on failure could
> > be removed.
> 
> I can spot paging_final_teardown() on an error path there, but I
> don't suppose that's what you mean? I guess I'm not looking in
> the right place (there are quite a few after all) ...

Well, I assume some freeing of the EPT page tables must happen on
error paths, or else we would be leaking them like IOMMU tables are
leaked currently?

Maybe I've not correctly understanding the issue here.

Roger.

