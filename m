Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B284E2F5E92
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 11:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66920.119063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzzll-0001cU-Ct; Thu, 14 Jan 2021 10:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66920.119063; Thu, 14 Jan 2021 10:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzzll-0001c5-9G; Thu, 14 Jan 2021 10:22:21 +0000
Received: by outflank-mailman (input) for mailman id 66920;
 Thu, 14 Jan 2021 10:22:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Rz=GR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzzlj-0001by-SM
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 10:22:20 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c50ec59d-b503-4814-9d08-e24752f33c9d;
 Thu, 14 Jan 2021 10:22:18 +0000 (UTC)
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
X-Inumbo-ID: c50ec59d-b503-4814-9d08-e24752f33c9d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610619738;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=06CbJGMTRMqKqUpligIWZ3oowsJB5W0LS4jXNiTbYXg=;
  b=GD2hbU3vjuxdzuQkaa50NlNHtNmlR3Q9mX8L3dFnUBPqeVEDbcN6lEde
   WLHGgPDiB/uBS1h98cISyj34VxfspnC25fYJN1eRipYgIN1TMSF3s/SQC
   WTzK7IIdB3UZ+SwU9GSKzzbEozDuKVIM/CHeCsq/imd/sECSYaO9+TKN+
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kHh90WqaSx3+lKqDeVJOFytB7ZuJQu539IOY3oPSTfWajQkr+8uYapfH69oNaqGbLehTJT5sB/
 c0uXpte+V+en5GgKkex2HO6eYlxYADnoA+EjsVXUDXjzZHGhxr7eOZOghkbc32ZOA1UI5atGAt
 /SRfjphgiDezB6hed8YG7KZ0q/F5UHjnE9cWIFjnPEQDFgdyCmbeBpI5DSSrzrP+oNxUng8Ges
 cJFkNDIkPIE5YNgUU8iHUgifw9YBEK03lsJsjh0sGANOenRCp+oKCwXBKHaP6Vt1cM92ZRFQcp
 DyI=
X-SBRS: 5.2
X-MesageID: 35289985
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35289985"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFVVxo4VlWKbuJW/1iUtewkUwuY48mo4rEOjdmbhhmPHIfQFiJeGGeWujpeGcfOYlUy4R0414W0VR56C3Kcmr93/q9FChFQHuQ/giz+YRlQy43MIOVI6n98H3HRcXNvnjnndD6rLCYzTKaxMYUdF/8D6k5fHz+V5CjpxETGIVSYyzcb3GDJrlgSw8TX1RfmuWKefJb49RFm0QG/zQ/NrMEsYd5YdCMIFzVj3StBcnI0sNU7Q6kTbYZFKUe9DfC62Fqul81HglwXJrLzQiuqYueyOPfFcI5h5a58cmMqcAFOw1P9SrrPGJDQOs4xfJbrMhx3b1Tk8RI60ppHz/Xfg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ObzGQVtymqLTNcnSkK1HB39ahW3a/ZBCPHsrl2e9ZQ=;
 b=UMJ5cGwJjQ2AR1tvK67oNdta0jsuRTS0u4P/KZ4FFEjmg10ZApVV2yO39FyX4iB27XYIcG8zTAcPcZu/b2h8a1OO7Yj6mcwjyRzWdso30RJAc22DrUkq4Jti3438vv3pZ0hArTsRyfJKpsC8WswlTo44BBUITL2MN7fdWNtzJzDUfV+Jtn2kAPHCDsC4Zvk+38JJOZ/zFOg0yDFblPXUhr5nq54PZzfj329rUY60Ornm3n4SnHrmW7HsDRq4MPGVsWj2VIvPwa4YxVJ5GIX/4EbFXSTQSjLZEmR26c5CMCyBjiYcyaVRO6xiC2jTNpQwr38gtH+5MiE/nCQgi1NZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ObzGQVtymqLTNcnSkK1HB39ahW3a/ZBCPHsrl2e9ZQ=;
 b=TXtM6TPuLDNVo2rybiVwr7TZFyZT/8mnLKGO1q1FvEB+R0FOHdYmpj5ly5lwU68SWe2T20VjvNXjUWXRZg8kos7U18UujHnA8qWGNSyPOsYm33GQtTvdimkf11WCTvXbk8yqnPP1YtUT2Zn3yp5AmHmNloYbE3zBOOf+Vh8FxXM=
Date: Thu, 14 Jan 2021 11:22:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: "Tian, Kevin" <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
Message-ID: <20210114102205.ferwl6y7idooqy3y@Air-de-Roger>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
 <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger>
 <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
 <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com>
X-ClientProxiedBy: PR0P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::25) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e057869-677a-43b8-2071-08d8b87640cd
X-MS-TrafficTypeDiagnostic: SA2PR03MB5770:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5770177066D85CDD856DDC508FA80@SA2PR03MB5770.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ohcr0/CDC03rfgIL36ZgeZ2nQmQvYQt99V210UVBcc5Dq4fRuAKG4u+kTRAz+fbHNW265ezm2yGNeiisrANQVmHStjhNzecSpGAoXFWklREmXReDtGUe5/pFvbqXocdSZEzPXjbwoR5fKu6cfAYehbxY1BX0XXxPsgFNiD7vnoznoeTxOS4i2W6GKrP0VTqrw93K83Hf+oOOdP0wBR5vY3BMtxBtnVGZnjA/Jwh+bvr8M+RX3siQEC4egtFJ8QhibgT4gGui9qVGX8qYAikfZEBA5sHKYLETz8+dASLUWoXJdps2tsPtedOEYgJFiuy/QeFiDiiWWXs6+9Iu5sV3oYC+mPnTBoDLYwtd2+Rm25dTdUtGmugMcQEX36uKU5B8siysQqJ0EiyHbl4qmL1h0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(33716001)(54906003)(4326008)(316002)(186003)(2906002)(26005)(6916009)(66946007)(8676002)(16526019)(8936002)(85182001)(86362001)(53546011)(83380400001)(66556008)(6496006)(66476007)(6486002)(1076003)(9686003)(5660300002)(478600001)(956004)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFQ0WDRiZ1VEd3JNcU9oTU5ReFkxanJCNSt3dTEvUjNvdUNvMmdVRmtlcEhn?=
 =?utf-8?B?enlNMHpmTjl2cDNrR3VpMDk2K2RNcXU3RjQwNDArZXN3bjNxVDlpUSswdFFM?=
 =?utf-8?B?U3kvMUQ1V0dndzVrVUNSM09NRmNMR1JvK1J6WWpDNERxeEg2YkpuNW9tUHBx?=
 =?utf-8?B?WFBGUkt6Y1lhZnFlR0J4RnF0RmVSTTVIa2ZNcXNFcnFqVmdnR0hHRTRXZ2Vn?=
 =?utf-8?B?OFZoOEIvN0Fxa04rSzBJampqbFJCZi83UkQ2alplS2xxRkhvVEx2M3VGdkNK?=
 =?utf-8?B?L2lxbk5BdFB6bTFlYTJ5UG14MU0vRUN4TnM0cEpHYWVkdndtVFBRMDB6cDM5?=
 =?utf-8?B?SGdMUGY4QWttMW8wayt6enkyTFNjbW5lUkl6MWpaUjJieXpyQVRiZlBnaEZX?=
 =?utf-8?B?UlVWTjk3eGFGcWxqVXVjRHA3R0tseWZySFJOeGZCcHB4MkFNRDF4ellBOWRL?=
 =?utf-8?B?SEVOdEZCZnAyRjhwR0tpTElOZkg0V2M5MUFGYjdGdUhKelphRGE5d1cyd0xq?=
 =?utf-8?B?dFdqTDd0bkZydklmQks1UE1KQUtpeU9aWThHSWR3NXJkTWFhbEhBbk9WbWxq?=
 =?utf-8?B?d2V5SzVRbnJzZnBFeUUzNTJ6Nm94NVI3bkUrakJFTXBUbEtSaXNXZzM5QW1t?=
 =?utf-8?B?bysxUUovd2hmM2wxc0xFdURYNVRiSGwxOHRyTGVEMTZXdkRRZVhIL3pHRFJ4?=
 =?utf-8?B?enVVTW9UN2l5UGVDcHd4VW4rT01oL1l2b2M4QndqTjlPWWE0NXNnajk1R2NM?=
 =?utf-8?B?TytJSXVVVlE3S25DNnY1aUJZLzhNSEVXUkZNV0JpLzFzZFh5aGNheUczb1FL?=
 =?utf-8?B?anFPVVc4b3A2S1pWaUxheXgxUGs2R0tyeElWdzdlczlITm9jZHp5RlRXa3Bt?=
 =?utf-8?B?d1VHQW5OanQyaFU0eGNiVmFTWTVHT2V1akpwZ0krTmN4WmlqUlljcm1PaE5O?=
 =?utf-8?B?d3JlTkFzNDM4ZytRNWQxU0xEaDl6OG5RODhUVzZUaTZlZEtSM0ZBOTB6ekox?=
 =?utf-8?B?bTlhQWJOS2U2K1NjS1h3NWFHZWd0djVUeXJ6VVdOcTBlTUJRUjVqY1VyWFEr?=
 =?utf-8?B?V1dHUDhuQ1JuV1VEY0hucHZXbDM0Sm41OCtCQmVMU0hqYlRpOWFUQ2MrL2VH?=
 =?utf-8?B?WmVTaDNnRmYyQ2JqN1FmRnZBenlVYkVkUnZ3Smptb1R6MW9SdHVCWVdEOWlt?=
 =?utf-8?B?eUdidS9kNk5HSWVWNCtsc2NUa0dsR1lFZUpSNTZyYmI4VW9oVzRMNjR1WFRs?=
 =?utf-8?B?WFU0elB3aEdGY3JXQ016TFpFVXBqd2tsdG9YR05oN1Y4MlEvMkNCN1pVYXpy?=
 =?utf-8?Q?Uwp5zNYhEZkq2LtjTYgmVIuRKT7yIB26mz?=
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 10:22:10.4626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e057869-677a-43b8-2071-08d8b87640cd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+WcuTdyKb12gMBGTmawnOvjP1L7P8MYtH0CZSq6Li+7uwtYqj/z7xFC7v5I2BTatgOtZLws+OZPC1ROn8tpew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5770
X-OriginatorOrg: citrix.com

On Wed, Jan 13, 2021 at 04:31:33PM -0500, Jason Andryuk wrote:
> On Wed, Jan 13, 2021 at 1:34 PM Jason Andryuk <jandryuk@gmail.com> wrote:
> >
> > On Wed, Jan 13, 2021 at 1:06 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 10:48:52AM -0500, Jason Andryuk wrote:
> 
> <snip>
> 
> > > > I have some laptops running OpenXT where the USB controller and NIC
> > > > share an interrupt, and I assign them to different domains.  Qubes
> > > > would hit this as well.
> > >
> > > Is there any chance you could try the patch and see if you can hit the
> > > issue it was trying to fix?
> >
> > Would testing a backport to 4.12 be useful?  There were some file
> > renames, but it looks to apply.  The only difference is the 4.12
> > hvm_pirq_eoi hunk still has `(ent && ent->fields.mask) || `.  Maybe
> > backport commit eb298f32fac5ac "x86/dpci: EOI interrupt regardless of
> > its masking status" as well?

Yes, backporting that one should be harmless.

> Ok, I added these two patches to OpenXT with Xen 4.12.

Thanks!

> > Testing staging would take a little longer to make a machine available.
> >
> > I guess I'd also need to disable MSI for the two devices to ensure
> > they are both using the GSI?
> 
> lspci in dom0 shows the USB xhci controller, iwlwifi, and e1000e
> devices all with IRQ 16 and all with MSI disabled ("MSI: Enabled-").
> The two linux HVMs run with (PV) linux stubdoms, and the HVM kernels
> were started with pci=nosmi.  Networking through the iwlwifi device
> works for that VM while a mouse attached to the xhci controller is
> also working in the second VM.  Is there something else I should test?

Not really, I think that test should be good enough, the issue is that
we don't know which OS was seeing the issues noted by Kevin.

To make sure you trigger the right scenario, could you start the
iwlwifi HVM guest first, and then stress test the network device
(using iperf for example) while you bring up the second VM that uses
the xhci device?

Thanks, Roger.

