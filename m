Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1180C2F4C1D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66502.118144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzg2W-0001Su-Ih; Wed, 13 Jan 2021 13:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66502.118144; Wed, 13 Jan 2021 13:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzg2W-0001SV-Ff; Wed, 13 Jan 2021 13:18:20 +0000
Received: by outflank-mailman (input) for mailman id 66502;
 Wed, 13 Jan 2021 13:18:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nR66=GQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzg2U-0001SP-T6
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:18:18 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d09e5f3-28ca-4a7e-b413-fba4a6d2cc12;
 Wed, 13 Jan 2021 13:18:17 +0000 (UTC)
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
X-Inumbo-ID: 1d09e5f3-28ca-4a7e-b413-fba4a6d2cc12
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610543897;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OyGFCizgsQ4aq4V8NYgz7FltBEr9KkLGcfSuSPJv2fg=;
  b=FMJN3GLghimgtQ0VDVURhf7soXDYWsLCvKznRE4J8ZnG8vErHphmH13+
   /gzJKymkIRqptgTh2/tkLZAsD9zI2FFTkLsicCU7uW03uHg3g4G2Bp4sj
   ZtNQnM8gngNlKdtNjMpGMafsrGX3qY73VBfHqbv8HhTACpElMff0OapBo
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: X5SY6I9NwhBe8gtNq7XAyFF9Qm2X/DOTzZzJvHHTZRkTbrMebEBACsHt6ffJAdbFwduC4bgScP
 OjA09w12O3M8Mnp9aLjKJ0xzobRrPqkKsmAGBt/op/zRYgRCzW6U1LOxIgIoLpFojc4LLop/2+
 fglwZZqPyiVgMh/t3kW1MxvlP0Cl7sbAFdKN2CWq2QHozMqlMpWErElIkwbDL0U+IVOeag8elY
 lkP/qHsxmMTFGD/1guUKv9rKaiJP/QryepNv197Lj77IQA37uMe2o+1NwzxyZ9V/lDhSEA/jjw
 pa0=
X-SBRS: 5.2
X-MesageID: 34999550
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="34999550"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHKf6j3tDkp/iryfO6XTpnNRxnySDI2Mc1wVtQBTR2yOd5KFE9vuHvsQ/eWT6mfcxo1fKg4+HqfJyCNo8wH9UCAPLCBX1v8A8nR8yrVMhs74jyAjfjwE++q2R/2me5wpu0C/Ta2ox+k/zRvRngd9dfJTqNnsZf/TzHeQoxkKIPWa+69/iq1wjQ81dwKQzpUQi6g1Vz72OXDJp4rRyLIbNgozO1kNyOOYEzfAbZaPtB9vXi3oZqBlN/pWfqMwzx9lyuX9o9T18nGJuqf2FB4mdk+O4P78nWL7xJlT7EtfR4ww19uWghri3blsTJZLFZb1Y+qka/gUgfxpNFd0x7WNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyGFCizgsQ4aq4V8NYgz7FltBEr9KkLGcfSuSPJv2fg=;
 b=jDbU8OS67nr/PZkoxHa0jq4RVZySW+D0rkXIu3K0hRiNi/wu3gb59TufSTGUMrUcYKSTzrRDIEWWg2T1nBMsdnQJh+L0yDzUexcAzHZ8e2oUNvCu9cY/H0eHj4s4003bfymK1j7tpzl6c0/gP4YyDtUmUQ04wNYddZtL3gemdbQXdTbotX9p+fC7caDIGvTsV2y01jtjtotQYS6JlaKpr5aM6/ktUwlp3qTb1h8Qy1ipVeMtHxVIciTVckMyuCe54oLvAShuwVsBAMHKsedSH01IZg5wwvqEJXwnXrIlRzyPloPkplVoXauOxug8eiN1zdMiNMkR283mhJRM2A7tmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyGFCizgsQ4aq4V8NYgz7FltBEr9KkLGcfSuSPJv2fg=;
 b=pEUbP2mOsUi5R5tmgld24AhzQwXsY85bh5pdEWNkY4TlMIHKOb8q2FOSFfCbzwT8ssrh3+5mTIgfMUH8DQfGK6WJnHot0xY4STgsmLJqL6dnpa+GlqfJLLkjuXkS4vThth6SDKGPHijmPoGQm3Cc4bzODCaexWg77pGtDvD62iA=
Date: Wed, 13 Jan 2021 14:18:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, <amc96@cam.ac.uk>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: Inconsistent console behavior during HVM direct boot
Message-ID: <20210113131809.nawfnyhrncojhfpo@Air-de-Roger>
References: <CABfawhkNt+rvUZXtcc9BT4Rtf+kt-dR-LPfSt+Aj1o7ACWnfHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABfawhkNt+rvUZXtcc9BT4Rtf+kt-dR-LPfSt+Aj1o7ACWnfHg@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0187.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::26)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db4076b3-07c9-4d46-d458-08d8b7c5aeda
X-MS-TrafficTypeDiagnostic: DM6PR03MB5337:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5337F22FFC5559603FA7729F8FA90@DM6PR03MB5337.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n0HxxfpNg+iK0hPSnQcHCvpLaS9TQgtyNrsq1bBhz43aW1H2OioYp0vA+6TR+A/IXTYQp5XGv5ynr4RXF4xJngHcZRV0Cd0EqzWXsy2D1FDrBOls39E3IDBLDJ6anyKMTIw4PBsB8jgSJPzaP+K5tgTF2gGscg7bvg0jAI/nM7O9HGYeNp3kUbSn2BkXYhwkEzlUQ8il+H+0KXZMQ9XN7lqMpFDsoQH9DcAw4PqjC4BYp/acrV7ayuP0nWVUTmVbhQJ4vyUcz921hrk65cTlJKZm5/zUMjWEUMiQyIPRhGdK68Hz+hKoQmoYDBjzWcMHOtS3FqeCGDV23QNp/YJkTyK0wuJWSTIjvFB8QgysrvUjOHQGB9OrY5CJY80lYp5CxogLJ6sxy7eZFyqYRPr6cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(26005)(8676002)(186003)(54906003)(6916009)(6486002)(1076003)(33716001)(3716004)(66476007)(107886003)(316002)(16526019)(83380400001)(9686003)(5660300002)(6496006)(85182001)(2906002)(4326008)(6666004)(86362001)(66946007)(956004)(478600001)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VDhQN2pwVXlWOGlzTjlZZUtQbFN0VUZscnVLL2owTU91NktZL3YyZFh4Tk45?=
 =?utf-8?B?Tk84cnQ4SXRnZ0psbzU0ZCttNngreHBxMGkxMXk2T3FJMVpqTTJwc21DLzc0?=
 =?utf-8?B?VjJ4dG5CVHRCYkgzOHpMYXVVblJDU2U5NTliL3VjSVJDb1dqR1NMSE5hdmlJ?=
 =?utf-8?B?emo4S3BkM2dRQit0ME1DM1doa2ROUFBxQXNjR255OVA5a2g3MnlEMjk0QmQ3?=
 =?utf-8?B?cHpGUjB4N0EybjBFeHp6SDIycUgwREdmNkQxbFFvUFd6UUVPWnFvTWw1b0Fu?=
 =?utf-8?B?VWdTUW1iRDNwMzFlV3RhUkMyK2xtMFJMMi9EZ0d1bDFML0kvSnJtOXg5NmtU?=
 =?utf-8?B?bzhRME9VWEt2N2o2V2h5WDloWU5VOUpndkc1VTZHSW5YcDBKWS9oOExheTFv?=
 =?utf-8?B?SURrTUJuYXgycGt0Tk1EUW1Fc05icHdWRmZBOE5DQ0tWd3phYndzMnNJN3Aw?=
 =?utf-8?B?bktnOTNlUndzQ2NGK1JsU0lTMFA1RW10L2RONWYvTWlCWmtWQTZGVjAwbExw?=
 =?utf-8?B?dW1NT0pzbVRBbDgvTWtnTERKZ2J0MkxyTUJ4Y04zNkRJU2lFeEJYa2cvc1hj?=
 =?utf-8?B?RlBPRkZjcXpCSnJDV1VYZk1pV0luc3RncTVkQ0xiMjBmUXF5S3ludlV5K0N3?=
 =?utf-8?B?MHV4N3JKeUhLdGxTWFBvS0FGdldWQzh5cXFwNDBFVHNHTVNPZUt1QVloV2VL?=
 =?utf-8?B?d3lKVE15TlVTSis3am9Gbk4xaExLUUFkRzNqSGRsUnZuRFNxTkwwRlRWTGVi?=
 =?utf-8?B?aERpRzFYUUhvVThuVEljV2xGbHkxNGR4R2ZqM2F1eTVlSjducjQ0c3AwNlhz?=
 =?utf-8?B?Q0h2Z2VDNzVDMWpkSUVWd245VjJNL3hJelZWRm91RFNZUVBFR09KTXNEMGgr?=
 =?utf-8?B?bnBwNW1SNk0yM1pjTlN0ZTRIWm9wUjhyQzBYRy9JOVd3NTM1NkxMaWpodWdl?=
 =?utf-8?B?cFIvWnBLemNpbi9xRVhhZVhsZityQlhnamUrMnhJclhGREZCNVhDZXNGQTEv?=
 =?utf-8?B?NTJnZmtnd3BlcDVDTmpyVGZGaDZOT3lMaUdwL3V6VWN5MDNTdm9GeDNYZ3FG?=
 =?utf-8?B?bmhUdDhSKzRmdWxnMzdDZ3ZNb1JRcWYvQnNITHZIQml0eVdiWW83UTdOYUJq?=
 =?utf-8?B?UmorMmV3NDdoaGtkbE5YZ011Q1VqTkZMMFdncGdRMnNtVEY4SG15bnJLYmln?=
 =?utf-8?B?aUZaSnNuNGZiWmRyMloydDMyUE1LOXYrdzN1dDZ2b09WSnVMNEZ2SkdRZUhh?=
 =?utf-8?B?R2dDN3ZaVG9McXpsSXF4Vm0wclJ2bG9xZkxYRjJVdjBxaUMyU1czbE9QUHJh?=
 =?utf-8?Q?TEkEpiegDe26zwmDzdmoaU2HxBtrlMk8y1?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 13:18:14.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: db4076b3-07c9-4d46-d458-08d8b7c5aeda
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpObbonIb3xmJ/dBE2IST1BmRlllF0PwpoCNJLWYOvBNaJ3tKCo+6BdIbCnz1qY+1hSNz6V+opULGRvPNG1wjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5337
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 09:54:18PM -0500, Tamas K Lengyel wrote:
> While direct booting a Linux kernel into an HVM VM no console output
> is received if serial="pty" is set in the VM config but the kernel
> command line specifies "console=hvc0". If "console=ttyS0" is specified
> then the console output is received as expected. Conversely, if the
> serial line is commented out in the VM config but hvc0 is set on the
> kernel command line then it also works. It's unclear whether this
> behavior is expected or not, after some discussion it sounds like all
> kernels ought to understand hvc0 irrespective of the serial="pty" line
> being set or not. Reporting this in case someone has more insight
> and/or inclination digging into this.

So I think this is (as confusing as it might seem) the intended
behavior.

Using serial='pty' exposes an emulated serial device to the guest and
'xl console' will fetch the output from that device by default. So on
the Linux kernel command line you need to use console=ttyS0 in order
to point Linux to use the emulated serial device.

however if serial='pty' is not used, there will be no emulated serial
device exposed to the guest, only the PV console, and that's what 'xl
console' will attach to in that case. You then need to point the Linux
kernel to use the PV serial console, by adding the console=hvc0
command line.

I'm unsure how to clarify this, maybe some additions could be made to
the xl.cfg man page to note that using serial='pty' will add an
emulated serial device to the guest, and that by default 'xl console'
will fetch the output from that device instead of the paravirtualized
console?

Roger.

