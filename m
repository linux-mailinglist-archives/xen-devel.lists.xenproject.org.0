Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496FF37523D
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 12:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123412.232746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lebA4-00024b-Gi; Thu, 06 May 2021 10:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123412.232746; Thu, 06 May 2021 10:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lebA4-00021z-Da; Thu, 06 May 2021 10:23:16 +0000
Received: by outflank-mailman (input) for mailman id 123412;
 Thu, 06 May 2021 10:23:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HEOH=KB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lebA3-00021t-Bq
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 10:23:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b47145d-937e-4ad0-954c-96aad88669b2;
 Thu, 06 May 2021 10:23:14 +0000 (UTC)
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
X-Inumbo-ID: 7b47145d-937e-4ad0-954c-96aad88669b2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620296594;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=goP9xVIK56Mz2ZpJxi9hKqiayxFFOFAu8LDQX33BaCI=;
  b=Fft93TY2WpyrAcc79REj7qVDRryA2uX9i/ajNYe5TyHKRfnQpkR98+YC
   njFVUTJjh0L+0vv9LRwPbhP44JKL2QubgUWMSXC51juiINRHdE6+4pWJz
   4nVGVBr+pS1Bp4IKvIWwUKiyYdBwvoEmtuHhSR0uy8tuEVYe8c3YdW5kZ
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VhcAWxrdNIb6W70kTGWbftLSM4EbW5szUNIzdAKr5Cay48ZtHk/hiPZDOseh6ZrOsLtGqttsyv
 PZ4NpiYuV/C5aas8eEFJDgnRZao8bSqmbTCS79sa6OwX5+Apiyh+k4MLmX5npKxueSxDR7FG0a
 7Sv9D7Cn4IuK99ahhyMkIeokkJl/5DDDnPeIpI/wnnVNR0dbGoVZHFy3brpkxU3RHZOr8U9Bqu
 OtrK5XJA4cM839TofHstciohayfXxHeUkeKJ934n8tKGq3ginuxLcVW5LFoeHlKIdu97ofSopz
 1mk=
X-SBRS: 5.1
X-MesageID: 44718656
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YTAtzqBki+RBoNTlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.82,277,1613451600"; 
   d="scan'208";a="44718656"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PykVm8fUOc5EQC4hppjmTZ2sjd7VPszm3doGXRsCktivccxxt6/3nViNVa1PSgOjAceyswyZAFYvVDJCYu1EjZ0MTmVxlqVEw52Y/Y0bcxmabNI3VTdlVkFljna8dDup4QwsyqnccAVs5oegJkjkyRG8+ss8zDuHNbHnS1hbebl4+hpru0Lk8if9U6KRT3mrveis+v/TvPYW/vhmGvjWALJRN2dmqc7OApMiFZgfvD0Yl6JgEcUHVJb6GFpPaJ4U6MouhDz9SxLjrd+gc+3sHuHQbhmg+1xyVvd7Qntw0UCR8k8fVeWBKUoLbS5zYxbe9U8sX+++nkTJARJ8bu4YWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZfjdiCL9zYhnCF7SZwghC1t18RKGyGWZ8vorFpFRZ0=;
 b=GUg1WpeXoBR9cwMicQmaNRyJa02IjvZeOV6oxLy1ys2iNsLYiMFDjRelBOru9u9Bduh7wQeTXk/PEaUua1pgI2lPQxR1UISAhpQDReB9tQsmbmyPYco8vgKp+lxrk0d0XiP0L9sNwPH1sbnzGteAVulvzC2/u6VTM6xjOI2tUguu0lbmnseUD9VqBW0Fgk941j/+QT4n99fj7dQPLCJX9VYFF+YDuoWIojPirki7B1hDQfTb+/zfICRp153Rw+XS5syRjG0BiGjrQccVDn9tdmlDyJqUuu6yl2X3fcz4cB5FnQlpWGEBkTSPATgZTa5eEFWMzQlC/wFOOvqWHNGYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZfjdiCL9zYhnCF7SZwghC1t18RKGyGWZ8vorFpFRZ0=;
 b=k+FJiL3/4H37NWpxIh7iYpfDV4ixrGoCBPg0xMxWzOCXDlKuoYWz7MG78SzAlKcTmiSK5e0Jie/6xhhrh46SMmpahbTu1jIyNtdI4MBf9+BVo5PN1BdB9LpwFkR1MdZWZL1YWB/Qyi4gehzNx53hx4+dMHC5fZ+d0XWHJ676zzo=
Date: Thu, 6 May 2021 12:23:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 08/13] libs/guest: make a cpu policy compatible with
 older Xen versions
Message-ID: <YJPDigyn0TFxDLT/@Air-de-Roger>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-9-roger.pau@citrix.com>
 <51ee228a-2d53-2dd4-55cf-233d81ba4958@suse.com>
 <YJFpdA8qmYca9bUO@Air-de-Roger>
 <6a3bc5cd-10a2-1d13-0033-c22d16da25b7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a3bc5cd-10a2-1d13-0033-c22d16da25b7@suse.com>
X-ClientProxiedBy: AM9P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8fcd5b5-5d15-4b07-a988-08d91078f2e5
X-MS-TrafficTypeDiagnostic: DM5PR03MB3372:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB337213BAEDADBE841296B4488F589@DM5PR03MB3372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sh2mOLv19dgAdR9qsuVC6jMiK1/LDug4S2hgCU7ySPKN9HLTyb51Sz8CAVy4jRCn617hU78/fNYB0Y7wjX3fFaA6dLF7yRV3Kfd/v/Xd2RkSFf3Z4TRfxrTbqTu2PEIFBrsq9EVkO/vfgwwo7foi2SmZHCnDM25OeCe7QbA184cubpPIIG9zsHmdlwXRKQp7ImXvLBOBR1/o0Xw8wk9s+6+UB037YgOtsdYVv/gA+SxmgWvZGph1ktFVlKoMcsQUAhAW0maRwVpRNQr6ohxaqeDFssdk7UYwhoCKv0RLtsZiAyXzBI3JFj+KVeRqiO6/EZ0XzfkF/D2YlfvxuRxeGcIcW75aAFyitjEU52hBl+Q9xaPvwyLXYhrHpw9PJwc3Ml0UecIWYNAswxrKijNs6Oaz+ITfY+/qkSaTh/pHPUEJK9SnooX+Bc0ngx6J/SxhImx1WLgGCtVQOqv0nr4n9iVB9KYoGqdTMj2x9a7y4IRBBB+iKZmZtzOfoua0zDqThLspU7fWLPmtBhGJ/zoa+o9dOnNCuvE+42ZUEtGhE2TLJOPfG1rugDy2hdEo8+6tTxjm2gdEqO7YKb0UvTTMFgCnh7PNbsnJBBzyIcReeow=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(6496006)(2906002)(6916009)(66946007)(8936002)(86362001)(66556008)(186003)(83380400001)(26005)(478600001)(316002)(16526019)(8676002)(85182001)(956004)(9686003)(6666004)(4326008)(6486002)(53546011)(66476007)(54906003)(38100700002)(5660300002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MGRxTVZQa2txS2hkNDViZ2svSktPalZ3aDViTGdJV1N4ZkZXZ1JYb2hLUVUr?=
 =?utf-8?B?OHhCaFZGOVcyUVJ4WldrK1RZQi85L2FETDNZc1locko5RHRnZHN2YjZVTmpZ?=
 =?utf-8?B?QlF6dkJTY015VS9TcS9kOGo2SktTdTBCSzF1MEkraEdNZm9kaDhDTlVKbGJY?=
 =?utf-8?B?MUYrRFNsOG9vNm5XYkpJOUxUZ3VjbXltTnM4NFdwWHFPZzgrNkhheGZnVyt6?=
 =?utf-8?B?MFpLVytsUmh3aEsxYm5Gb0p0dHVrVlA0Tlk2dkFCOHMwZ0ZVS2ttL2l2aXdV?=
 =?utf-8?B?dm9uNS9kcnp5dGNkQVVlK0tTcHZGVXB3QVNtSG1idFhYYXBibEs1UEpaWG9Q?=
 =?utf-8?B?V0pJTkMxT3ZLWWx5Y014VjlCazJHTWZ3TmJHQjQ2dHJ0NlhFNEZ6TlU1UUNl?=
 =?utf-8?B?LzB0MWpGUHU5eXVaSnpxdVVTV0tUZ2tHSFBkejUxV21pNTk1azYvcldLOEhw?=
 =?utf-8?B?UWwzcE1yUnVKWUdLd3A1TmppVEp5NzN2RnZWUTZpNnZrc0JmSzlka3FMaGg1?=
 =?utf-8?B?d2txN29wc1VzQkU0eS9wT1RPYTU2THQxQnRYS1pjTUVtUUlGdmtCemxWc0M1?=
 =?utf-8?B?eEVxaUVCdDhkaGV0TS9kendKeFVYVHZsK1QvTVE2WjJxMXh5Mkhnamcreldm?=
 =?utf-8?B?QjZiZS9SMm8vZnVnVytxdlQ3a005YVQzRUM0QmRaT0YzWlNVb0EvOUFNZmZm?=
 =?utf-8?B?T0lWRlpJd0VQaVkrUUVzeFJtZFV1MjZRaTRweit1eXJVNDkwZUp4R3g2eVpu?=
 =?utf-8?B?YlBrZ2NMLzZMd0YzL1NWcUJDcVoyejY4RDRGNXhTQmtGU3hkcFlhQkxSNi9Z?=
 =?utf-8?B?RnhTTFowMlJWWG4yWW1TRTZRcysrdmJzVFJ6anhNVkt3YStsUjdwQlVyMlRa?=
 =?utf-8?B?RG5IN0dyMXBuZ1k1MEtubkhGMnRISG1sMWV3S0JxVk1kWHF1V3NoYUxLeEFM?=
 =?utf-8?B?WUxucGhGYTJML2dta1FjRmk1RG95bzd4ZXBuRFEyK284SXorOVNZMDIrRHlm?=
 =?utf-8?B?VTFSL3JWaXExZjdXaWFSVnNxd2F5MUZaUzZTc1BqRjh5TC81QnNDUVUwQVg1?=
 =?utf-8?B?QnR3WEFFQmhaZlFKcDVzUmcwcjZpUW9nYTRSVzFCS3BDMXd4WWNjR1NSRXdh?=
 =?utf-8?B?Y0tpN2ErbEVnbk8ySWN6MWlKMmpBbGY1elg3MVQ5K2VtcXlFdW9lc2pvWHN3?=
 =?utf-8?B?ZWZHSDJKay9Ha1JRWktFVi9MdU8rUEt4Uld4bWNYRjBGNGY5VE1ZRjRzdzh4?=
 =?utf-8?B?UUJoU2FPUWI5b3g5aEJ1cmovTVdQQ3dhR0lxSWdFZ3hpTU1LNnlDVHN2dVJ5?=
 =?utf-8?B?V1IvbW44N2FjRkNPdVZETjhra1dPMndFZGZRZDMxRFFXMDVPdE1EelVKV1Zv?=
 =?utf-8?B?bEp4MkVqZ1RhS0hBeWlHVSs3dkxVTXp2Y29ZWlBqUTRCNUUxNWVuMEJIbmNa?=
 =?utf-8?B?WDNQWmZTbHRaVk9rbVZXOVlZem9zaGlYSlpSVlFBckJrbHZydHU2Z2haMnMv?=
 =?utf-8?B?WmhmQmxFdHh1YmhQZFk3WjhxZTBBSXNONjg0STdDaHVhdy8yNUVRSHpKMXNl?=
 =?utf-8?B?TzlaU2VpVjNCMlFvTFZmUmJsTjRZWERFc0hHWjk0OG5od2ttdXk3dmcxRXov?=
 =?utf-8?B?VlV3RWRMVGZTQW5JRWIxNitvRUliVGkyaHBIZ0FnQTUzVkJrakYxd3V6REx3?=
 =?utf-8?B?RThISlJ6ZkcwT2RqRXI5eEtCWU9CcGdqbGhMQzZVc0lWcENBaWR1YWF4RWFn?=
 =?utf-8?Q?tbbo0A7hBM75FcR/vFyea3NGZq4fTtZ54jQrSiI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fcd5b5-5d15-4b07-a988-08d91078f2e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 10:23:10.9491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aE61hPrdCi4wuneAk+T+I+0d69oCe71n6f+lEv8BwNP7zHKVntLVHwj43uBZN8QNNDMkWt1qhzdEt47XoCoz8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3372
X-OriginatorOrg: citrix.com

On Wed, May 05, 2021 at 09:42:09AM +0200, Jan Beulich wrote:
> On 04.05.2021 17:34, Roger Pau Monné wrote:
> > On Mon, May 03, 2021 at 01:09:41PM +0200, Jan Beulich wrote:
> >> On 30.04.2021 17:52, Roger Pau Monne wrote:
> >>> @@ -1086,3 +1075,42 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
> >>>  
> >>>      return rc;
> >>>  }
> >>> +
> >>> +int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
> >>> +                                  bool hvm)
> >>
> >> I'm concerned of the naming, and in particular the two very different
> >> meanings of "compatible" for xc_cpu_policy_calc_compatible() and this
> >> new one. I'm afraid I don't have a good suggestion though, short of
> >> making the name even longer and inserting "backwards".
> > 
> > Would xc_cpu_policy_make_compat_412 be acceptable?
> > 
> > That's the more concise one I can think of.
> 
> Hmm, maybe (perhaps with an underscore inserted between 4 and 12). Yet
> (sorry) a comment in the function says "since Xen 4.13", which includes
> changes that have happened later. Therefore it's not really clear to me
> whether the function really _only_ deals with the 4.12 / 4.13 boundary.

It should deal with any changes in the default cpuid policy that
happened after (and not including) Xen 4.12. So resulting policy is
compatible with the behaviour that Xen 4.12 had. Any changes made in
Xen 4.13 and further versions should be accounted for here.

Thanks, Roger.

