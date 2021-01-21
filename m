Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE412FEDFC
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:05:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72170.129709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bWx-0003uh-2P; Thu, 21 Jan 2021 15:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72170.129709; Thu, 21 Jan 2021 15:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bWw-0003u2-UK; Thu, 21 Jan 2021 15:05:50 +0000
Received: by outflank-mailman (input) for mailman id 72170;
 Thu, 21 Jan 2021 15:05:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMxC=GY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l2bWv-0003th-JT
 for xen-devel@lists.xen.org; Thu, 21 Jan 2021 15:05:49 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f177d81-6488-418e-843d-1a879c61518a;
 Thu, 21 Jan 2021 15:05:48 +0000 (UTC)
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
X-Inumbo-ID: 9f177d81-6488-418e-843d-1a879c61518a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611241548;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0Qh2J51IMs/Cbg8RMbMKGahzQZCMdujCqv0KqITLIXM=;
  b=aRdTFRjanRD1Ei0xVSfulkUBFN359ybonBUBtJF9JUrL8XjpOEZAuJ3G
   Msrm4z+cJ6z2quhbFdeQnYG4g/0K1dKZ5W8YBsPcgERDVb20N0YzAGTw/
   fabj7l1KXPcIY1hbDukdnNCwipSgmZ2xJD/V4+zooBbEL8iNlwtz22oSk
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sTM4M1uR482bRWCXQBJpr1r9t4D6KlsA8ZghTBQS/jcTpig5+zh3XZy/mWNz0H6uuPQNYtwstl
 pxHzTGpaqU0UPx1tPlo1DKr93P07ERMKAyjIVssAuoI0GsIW+/KwcWmg8BClztV0IXaUg12eOT
 rN1ZmUwkfrzWm1Oue0zRwAx+yEpBg9rMWSD2DU6KB04MMz4D0Fb9bMK6Q3+IvJMLdkupWf+6KL
 3laEiYh6WrrzshB7NRJh+bB8R1jT1aVje0wbxk0UzQO/4hiWPqi34cCMZphTIM3ZL0S7qFs4+0
 Zv4=
X-SBRS: 5.2
X-MesageID: 36869824
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,364,1602561600"; 
   d="scan'208";a="36869824"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DK3tJ5aTQyM7oOTI8dPwN5RPVBgM7kJhrdgkK5CE7Ix/t6nMr9zU1pGzMLz8bPW+1lGo38b+FJV2o+6Rw0XMFeC/KxALmAag6lZQaj27BnAX1t4aR2Se6OSJiLgZPcmRjoZhUzgZx+TiryZKgV78hhyE8+9xOXGnJBy/G93AgkaLRubbAvfk2Nhwi5pe3gJfScq13NwYD+gbj+imXzlgDqhBEoOOykKUw/Ozc5/cKsXsxUrTN+BiNZV8pMiB74yxtZSTFAl7AEfjKYpkq8Vh0uao1IYWfSvtte3WF2FFfx5PgjeCdfPyqvylXjVDahOqeSRKHFPNP5UXKvcQWshzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2/mY+/MuGMdcerTTA+8VkvRYoz08v/TxezwTkgAAmY=;
 b=N4E+HJtoyiXvJAKI4lR6ltlOxDCjZ3OwKLqtHvG40vyfHG6N+RwJHAsxJiSgfZLPGd4b/C6mXxpcwUh2ZM4uBQM6FpE0QkqCBF9gvZoeHgbnh9cTSd369ETHwZpTVUy8+Nmveob2ixirLz6VHxN5rTc+TZWGdiRdJyU6ybeve5wO91AufNLHJVol9BfqaxWnWJXa5pzv8qQsLjrXNj2q4QjBrXdEA22Vp6+sTTU9jyZjBOAp+ok9RQeMJNotPpoqbqcrgp8i9ugpM2L7DqSs/RGN+NBq9nqcJnAaeI78ms/bkhtDLedmXdRwHmVwu8wTYVjIZiP6mJvPeEv7Nnu/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2/mY+/MuGMdcerTTA+8VkvRYoz08v/TxezwTkgAAmY=;
 b=ijzO1l1Th8HcJIodk8MQ93m4U6izFxImSeGKBICg9j3owBtzLbZ6V1GlLaB2IaFJdQi1USKHy3kUel1p7VDv+nRXL1Gqn5esCJn0B9RzFgm50dCQzETJrbWerB+U5c2plW5vDGCee3Lyo8a57yHXPC2DNYAk3M8Buromux2KT+U=
Date: Thu, 21 Jan 2021 16:05:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xen.org>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: Xen Security Advisory 360 v1 - IRQ vector leak on x86
Message-ID: <20210121150538.rliqx26wj2bvteuu@Air-de-Roger>
References: <E1l2afg-0006PK-Gj@xenbits.xenproject.org>
 <20210121142012.GB1592@mail-itl>
 <20210121143440.xucstdfws4ymtete@Air-de-Roger>
 <2d073bc8-418e-2b8d-9ff7-76b932f829b1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d073bc8-418e-2b8d-9ff7-76b932f829b1@suse.com>
X-ClientProxiedBy: MR2P264CA0092.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08d4beb6-b015-46e0-7f9b-08d8be1e06b7
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5324600A516D48B960C42E698FA19@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2mFE/HRVtiXj0X1r8wlMyIr0/4dJ9RS6fJ2Z/KSIlx5GbYwBOOBn9H9xUoAMtH/kK0NQAgzgd4zMjbz7sYvO+45w9s3QrUiQOAwpgajkwaWsRh9dfuiWNcz2mpodtOAG4cfZ6T3HENXWnqlSg4DjEnGAnbukCoNlAN2laVPgtVV6xVo7C+Ss3IvKK9l+FdPeoQnMvioAw5X0YLp1Lhiy39yJGZkgUzscJ55ybU7vqQiRqiMs4yKxBmwxtlqcymaNxx21hMbzP7axQ1xyAqU7JAz8U9U+NzNaPXDII45U1VsHn2xiHg8wGgz20dVKND5RwhFIaRoLWBXfeY+CObYZLwLOE85nz2wUYsnmMx9w4/Bc65FNcuv3XbVcJaf1meHT8v4ONKKmAqRoJxJnKDumqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(83380400001)(6486002)(8676002)(4326008)(1076003)(8936002)(66476007)(86362001)(66946007)(478600001)(85182001)(33716001)(66574015)(2906002)(6496006)(6916009)(6666004)(66556008)(16526019)(316002)(53546011)(186003)(26005)(9686003)(5660300002)(956004)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnFYV1VyZzJ4WnRtRnlaTHRQNHNvK1lUOHU5d3ZQUkxTN3MycVkyUkVPMWYw?=
 =?utf-8?B?ZUpZb0ppeFRxS1hKbDVJNkR5ejJsOUp3TXdiZ3NUMHEzNGVDWFNzUXMvQUhX?=
 =?utf-8?B?RWxMYnpqK054MktvUFhJSGNpOXhpb1FUcnZFV1pORmJCZTVsaFRtVTMzMEJV?=
 =?utf-8?B?QzhBcEhRRmlhNzZJZFpxbHJNSHBlK3J0Qjh0RVhKeFJIaWxyWEdzUWd3QTQz?=
 =?utf-8?B?aDNSQjFPREduaWdKWnhYWnVlVWJ0WE5rSUQ1MlhPbXZNRzRMeHVhN2xtb0tI?=
 =?utf-8?B?MDZkOE51c0dGSmdwcWtWbHFlaUI1NEx1Nk5FLzFETmRsOWQwUTNXci9LK3pT?=
 =?utf-8?B?UXBERzhUK0N3QS9QR1pTOTFSMDJZeEViVGpGQ25PdzNYQmhnaDVVV3ptRFF3?=
 =?utf-8?B?T1NhenFEaUQ0RUZFYm9DZHBDTTA3bW53aW1oUkU5Q2RhVHR4K0VmS0puYmxU?=
 =?utf-8?B?U0RWNDFGWWNOVlRseXpBWEM0WGdtQUxTc0R6ZWZ0SW1XYTd0WEgyME84dTlx?=
 =?utf-8?B?UHQ5Ukg4RndEM3g4ZjVzTmpKWDRTb2VrQ1c2aUVHQU9zWEFwUmZia005ckNu?=
 =?utf-8?B?S2FGOVkveUlYNUdNZGV2d2NjdUZYSG5KRS9yUzNpTHF3TGpEYnBVVC90UzJ5?=
 =?utf-8?B?NTVpVGt0bWtwck95SVlIMzRKVklycGNTT1RocXZDMGZDQVFqQjNqRGYwd0Nw?=
 =?utf-8?B?dTJsWEpGcjVJZ2JsT2w4UThXcUEwQWpWR1RyRWNyd1VVc3VCR1V4YmYyUDE1?=
 =?utf-8?B?OGZ4STJkSUlrZWJVU1lhSktzaFI0UzZYakxBVGl5N0o4VUtWVk1VSHlUYW9s?=
 =?utf-8?B?bzJsbXlidm1Tbnk1RmpLbkxORXdka1E3bktCTkVpeVN0K1FaZkJqUU5CSFMv?=
 =?utf-8?B?bTByeHN1UTlaOHBxQkg5c0NaK055MjZ5QVh0Q3A4YkZad0VNTEpnMnZDRVNx?=
 =?utf-8?B?S1d5S0VRU25EbHpNTEpWVEttSTVzSVk0R2E3ei9iZmdIaXQ4SDZtbmJWRnpo?=
 =?utf-8?B?a1I2Rko2WVdvdTAvWXBFWm9MK3V4eEdnTGZHWWZ4RldHQUtnS0EyOTk0UDhG?=
 =?utf-8?B?M2NLb2N3cWtueGF3ZndxRDJodTYzY1lTY2d3bFlZVFFBUVNneDVScHR5cis3?=
 =?utf-8?B?N2tYU0QyZnU4WmFobXhFQTIveWIvTUhIcC9Ja0ZQckFoSnR3ZEZHRjdGOHV3?=
 =?utf-8?B?NE1TYjljUEFXbmNURWJYSWl2OENlbjBnYUJXQkIxeG9HY3IySmdmVUM5MTVj?=
 =?utf-8?B?c1lyTUF6TlZqN3ZHczlxYkFaaSt2M0xkQW9SU0c3M1NoKy9UWVRtVnpQdXFC?=
 =?utf-8?Q?w4nfeMPbk3XNZDvq39dbkp36BwVVv1TclS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d4beb6-b015-46e0-7f9b-08d8be1e06b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 15:05:44.6130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzANOmu4w4wFoZ+sSF3t2HyOskCgO6yNuR6xS1Q3doiafIYXhuUuQL3ulpsvx5VzI95IuxhY3NE9M+lUfbbbgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Thu, Jan 21, 2021 at 03:50:55PM +0100, Jan Beulich wrote:
> On 21.01.2021 15:34, Roger Pau Monné wrote:
> > On Thu, Jan 21, 2021 at 03:20:12PM +0100, Marek Marczykowski-Górecki wrote:
> >> On Thu, Jan 21, 2021 at 02:10:48PM +0000, Xen.org security team wrote:
> >>>                     Xen Security Advisory XSA-360
> >>>
> >>>                         IRQ vector leak on x86
> >>>
> >>> ISSUE DESCRIPTION
> >>> =================
> >>>
> >>> A x86 HVM guest with PCI pass through devices can force the allocation
> >>> of all IDT vectors on the system by rebooting itself with MSI or MSI-X
> >>> capabilities enabled and entries setup.
> >>
> >> (...)
> >>
> >>> MITIGATION
> >>> ==========
> >>>
> >>> Not running HVM guests with PCI pass through devices will avoid the
> >>> vulnerability.  Note that even non-malicious guests can trigger this
> >>> vulnerability as part of normal operation.
> >>
> >> Does the 'on_reboot="destroy"' mitigate the issue too? Or on_soft_reset?
> > 
> > Kind of. Note you will still leak the in use vectors when the guest is
> > destroyed, but that would prevent the guest from entering a reboot
> > loop and exhausting all vectors on the system unless the admin starts
> > it again.
> > 
> > In that case I think the premise of a guest 'rebooting itself' doesn't
> > apply anymore, since the guest won't be able to perform such
> > operation.
> 
> And how exactly would an admin tell a guest from rebooting for
> fair reasons from one rebooting for malicious reasons? To me,
> setting 'on_reboot="destroy"' would imply there's then some
> other mechanism to restart the guest (possibly with some delay),
> or else a reboot attempt by this guest would effectively be a
> DoS to its users.

Well, I would expect there are deployments or configurations that
simply don't expect (some) domains to reboot themselves. Ie: for
example you won't expect driver domains to restart themselves I think,
and hence you could safely use on_reboot="destroy" in that case to
mitigate a compromised driver domain from exploiting this
vulnerability.

Roger.

