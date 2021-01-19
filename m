Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE22FBD6C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 18:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70979.127023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ugm-0006GR-N1; Tue, 19 Jan 2021 17:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70979.127023; Tue, 19 Jan 2021 17:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ugm-0006G2-Jw; Tue, 19 Jan 2021 17:21:08 +0000
Received: by outflank-mailman (input) for mailman id 70979;
 Tue, 19 Jan 2021 17:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1ugl-0006Fx-6N
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 17:21:07 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef96c3a9-6e89-4f7c-8bcd-369198bd4217;
 Tue, 19 Jan 2021 17:21:05 +0000 (UTC)
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
X-Inumbo-ID: ef96c3a9-6e89-4f7c-8bcd-369198bd4217
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611076865;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iNrg8mesoOCpHaB+9VLolSqe1bjV9b41N4QnlfHSjyM=;
  b=UZay2zTEAmt67Ok1oLpbx76yEumaENuEg2XHEm9sg/oUnUbqrbWKUTUe
   OnqFtsj3fLJJNtmR+oO2LbQ+ZgYJTRdbQH36n7nbA5YDn1Udrj+Jc2JMh
   OL332XQn+xLJGiAmjcwjibQBs/Gcv5I73wLwu241G3K5tf3AxpX1HiyYu
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ntHVmXQU5t9Ms60rPvyqqUfARCEgc/RO4aoTNg9U0Ak1I9IIhNEwUzuwZ+3hHJNFFfVo7/D/JM
 eTMlW7fS+Wyou2r6Hd+8MblnQqX+kHo8YTYTA5nuV37pF2l3FzflT5w6wKBtscRJ4YhgjhFO+7
 gXdGq2VL4ZlBK63oVxmzL4qpJOquzQ3q1B8TbRH2c5noQ1jie3x5brdYJsFJTmIf1bz8jEFHt+
 hlmOezrMf/8W0hL1RR8eq3MecH42j+FklsfJOFNHx9NWou7ZVoipgssuOvY8TSI9iLAd3Yrve6
 iCA=
X-SBRS: 5.2
X-MesageID: 36696190
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="36696190"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJa9GXsE5JXe3lVQlRMvUyElHgQnSFi90jJhTVdsIpl4wz+wBmJvPkNZRNUIoAaRFhUSPnMDhWD/OatJqAeCnCHmxKrLUJ4Fgntm5df/07+/I0rChVE8plR1vvtXIlQGg39ZKlpYXg2pCzHZaOZ6jvIuHwFG0O42s9Z/6mRJKy6Gb9Yl+oF+1W3uHstuLADDw7PKEhqvOtW/wau3zfPEcS7nqQwJyd4lu33D7TWYHxwTu32I/hf2nI13pU3+wMk52pN0FuSean2W5s2nD0p2u0SrRvPJ/TmqQOdH5pJnEid70fxxBJZ6GBBdCszE6bgljtsfl2Wi2dZDNVfkeJHE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqcBTkG054uJi2dMFL6FuFyCl0XVXMiXvtJsXBGQpzs=;
 b=g2QDQTeYqAqj9XTmGRd5dkBCSnQM/V409f+kr1aFxFCc2CZHGMT+jrcb/PTTNHRJoVImFzWK800zK86vCvXEkWeYwKTxrmYniFIK49xH5/ajZxZTn/1OTJFDQBml3ZxGB1e1NzIYt9HtynVLFTFBq/T2b5mKONVcpTrj0FVIcx5qaY2tMdXb9kbkAQHGs70F9Fjmh0nGNrhrAkBfHSQZhTAUiwNNEibmAz8Ndz+ISQ257UJTKtoL70vX3hY1/QwWPfuxZp4EBKUw4qqMYb5R8wx/RTYyGlMfXykJsNbO297Fe//U4BhtbiC1fEcXMc3ncYED7KWPcA4aPpARWdgRTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqcBTkG054uJi2dMFL6FuFyCl0XVXMiXvtJsXBGQpzs=;
 b=fuzQ2xwCUkEl7J6xPLWBaNNZJ/lEk67d6hgcLthtJBdlzr1JGm4YUEN0+7EhYMmIYc7G5vALlkS9oeY4l1so/FCumpXrj7dEhCFNskrvbgZnGM0Ht3dKPhzB0r4uyMbQWsi9y4pXmkXikcjWx2UaUrMlDHjTx1R8cJR+N/yNwHk=
Date: Tue, 19 Jan 2021 18:20:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, Norbert =?utf-8?B?S2FtacWEc2tp?=
	<norbert.kaminski@3mdeb.com>, Michal Zygowski <michal.zygowski@3mdeb.com>,
	Piotr Krol <piotr.krol@3mdeb.com>, Krystian Hebel <krystian.hebel@3mdeb.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Rich Persaud
	<persaur@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 2/3] x86/smpboot: Allow making an INIT IPI conditional
Message-ID: <20210119172056.fmrlwm2gqbhuafzb@Air-de-Roger>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-3-andrew.cooper3@citrix.com>
 <20210119145814.ctjgh5aekxaapztv@Air-de-Roger>
 <2b61194b-3c0e-685d-bdc0-7ad9a3e95db5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b61194b-3c0e-685d-bdc0-7ad9a3e95db5@citrix.com>
X-ClientProxiedBy: MR2P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aa7e066-1823-4556-de08-08d8bc9e97e7
X-MS-TrafficTypeDiagnostic: DM6PR03MB3737:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3737D5A75960E8E92DB9769F8FA30@DM6PR03MB3737.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0oW4opA/UY9SRH0mba2CK9q8hE5JPLIVpT9dJ156muF+SaprdxApXxfGYGI/bP7fHX4N7u6VGiVCw3Ii5SlXwyDEsRLj6sZUzKCIkV9QL58o8NjdEGgsTabpq963fk0hL1YvtaKp4thm+7NGMRZtvwbuuAFvlzmD3cmpQ3JuogYj5TEj5TI5jvJIG6cFciwIYkikxGzU5KnqAi3PUVv/73CEfEKkvlC0XB7A/Fugz8mtprpGzE0pt+4mbyt1YqBjbiViFe90D2hXhTVYyfMnCwAZbH0SWCuKt5u5wVosHavEzHsv2rd8EgpVFdwh/1JJ/rBihEP530VwrQnG2UXb8U7NuXgMbWmTodeg4lgJGWIIwEcozByHa1RM2ihB7m1MZmvtzOHVwpcPrOs1z2DDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(39850400004)(366004)(346002)(136003)(85182001)(66556008)(6666004)(478600001)(1076003)(2906002)(16526019)(5660300002)(6862004)(6636002)(8676002)(33716001)(66476007)(53546011)(8936002)(86362001)(186003)(6486002)(4326008)(54906003)(9686003)(7416002)(956004)(66946007)(6496006)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c3RabTBMWWw2N0RwRVQ3MzU3Q1loNE1tTnM0YkdCVS9NamVDM05hTXpvMmYz?=
 =?utf-8?B?bHV4NTRIbm5YaHNvS3FOOWFZZVl5VnpkYlRyWmI2aUVLSG1VcWFEczZjR0FL?=
 =?utf-8?B?RFdhbW9jUUJmNjM3b0NEQTJ5bmxZVzZPZUVJTHVvcjhGeXRBcG5zbjBMaXVv?=
 =?utf-8?B?Qkp1Tkp0U0JxdVF0TU9JeFF0MHlWTHlETVZpTXBHUk10dXJGTTYzdkd0S09P?=
 =?utf-8?B?c1kzWGhkQ1p1SWNrMUtmeVJPSk9ISERzaDlrM0JuTFNDRmVUZFlLWFpRTnhZ?=
 =?utf-8?B?YzdiVWhiWHR4K2RycUlFemVLQUhzMlZqZi8xaVdvTGJrSGE5MDd1Wmkra3Jm?=
 =?utf-8?B?ekdTU2FsTkFVSFR4Q211ZXFJcDBCbzNXMllIWnhWU3J3R04xbVV6eEVnL3Ft?=
 =?utf-8?B?RXhwK3lyRTlsMXU4VTNTQVo1Zk1DTVpYNDd4YnYrT3RQbUdKVHEvWTcveUFQ?=
 =?utf-8?B?WkpGYkt2bkFyN25maXgrR1VRQVZmblFNRW1oSmh6U2EwcGgzR0F0SzJlOWFw?=
 =?utf-8?B?am9YbkFBUk1IMlM1cVAyQURWMG82dnZ2bkVGOGt2REJsRENTR3RsWTFWcjZy?=
 =?utf-8?B?Zlc2L25kZEx2azdYUE5UM2hNbGIvMWM0RXMzKy9KQW1WMWliZEtwcXVaU20x?=
 =?utf-8?B?cWNhSnd3bk50TTJIUkoxc1UvYmxEd1NiTWV5WGcwYlBodkJoTlR5QWdmc1pM?=
 =?utf-8?B?cEFUMWo3Si9DVngxS0cyVWlSQlhDOHNJQkR3UEJzUWl6MlVxSm9GZkpXcklm?=
 =?utf-8?B?UzV3Z1ZUVEhURHRPV3hUVW1JR3Jud2h5V3pkNFVFb21Oa1dFK0xtMmxMbWxz?=
 =?utf-8?B?NmdLVDAwQkJvMVlueXhuUHczaXROYjArTGdxZTlOWkJFcWF1RlpsKzlNL1VR?=
 =?utf-8?B?NFdQQmthY1JpQmRTNmpsREs5blRDOXVMTWdhSk1NbFo4MmwyR1psazZPVzE5?=
 =?utf-8?B?ankwVmxMNFJEMkVQWUE0cXFUdjRCbHZsS09mbkZ6RDRxOU9WZzlSWnZCY3Rq?=
 =?utf-8?B?ay8xK0NLOTVBN3lmQUdkdEMzRVBWOTZLUkRRTEVaVitjVjZQR1ZxUk1hcFZn?=
 =?utf-8?B?K2ZjdEpFUWZhWmFlb2MwQS9TUG8yamloSU5WcFJBa25SSElDZnBqR2puUkRZ?=
 =?utf-8?B?UFg0N3REU3JjZWZZYTVnRGlSeXlWQ0p6ZldmaDYyaGszN3VLSTc3V3Y4OWg3?=
 =?utf-8?B?UnZVdzNOVW01UUdJRHplYTZIRWZXYmZ6a1U1bWhwM0hwVis3QVR6L0JiSFMy?=
 =?utf-8?B?TlBRcnFWd0MrRHBqM1JwUklicW1HTm1qMDgrbytQa3JadkRUbDBIRTVUeHJU?=
 =?utf-8?Q?qusEvhMZapeFpLdc5msLBm4d5fHtIr/WAl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa7e066-1823-4556-de08-08d8bc9e97e7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 17:21:01.4943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDuMt2NOgr87fNTfztW/m83mTf6+0jK3ESRe5wyZKmXrIXUX/wIYRkKMjElPYF+BRrQ8Nbkj4xtgIH28D3nj0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3737
X-OriginatorOrg: citrix.com

On Tue, Jan 19, 2021 at 03:05:38PM +0000, Andrew Cooper wrote:
> On 19/01/2021 14:58, Roger Pau Monné wrote:
> > On Fri, Jan 15, 2021 at 11:10:45PM +0000, Andrew Cooper wrote:
> >> A subsequent change is going to introduce SKINIT support, wherein the APs will
> >> be already be in the wait-for-SIPI state, and an INIT must not be sent.
> >>
> >> Introduce a send_INIT boolean, so we can control sending an INIT IPI
> >> separately from sending SIPIs.
> >>
> >> No functional change.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > I'm not opposed to introduce this, but maybe it would be better to
> > move it to a separate helper? send_init(unsigned int apicid); or some
> > such?
> >
> > Would reduce one level of indentation.
> 
> I've got a lot of cleanup planned for 4.16, but splitting this up
> INIT-SIPI-SIPI is specifically not one of them.
> 
> This will get more complicated with Intel TXT Intel, and I also want to
> integrate it more nicely with the virtualised AP boot logic.  I suspect
> we'll end up with a function pointer per platform&configuration, but
> that's too much work at this point in 4.15.

Ack, I'm fine with this, albeit I would also be fine with dropping the
variable and just open-coding the ap_boot_method check (but I guess
there will be further use of this variable in newer patches):

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

