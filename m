Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953122AEF9D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 12:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24649.51998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcoJ8-0006Qa-HN; Wed, 11 Nov 2020 11:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24649.51998; Wed, 11 Nov 2020 11:28:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcoJ8-0006QB-DZ; Wed, 11 Nov 2020 11:28:58 +0000
Received: by outflank-mailman (input) for mailman id 24649;
 Wed, 11 Nov 2020 11:28:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcoJ7-0006Q6-3Y
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:28:57 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ec4a146-47f9-41de-a98e-3d311d852838;
 Wed, 11 Nov 2020 11:28:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcoJ7-0006Q6-3Y
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:28:57 +0000
X-Inumbo-ID: 0ec4a146-47f9-41de-a98e-3d311d852838
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0ec4a146-47f9-41de-a98e-3d311d852838;
	Wed, 11 Nov 2020 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605094136;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gDYiAWA+L6Lto9L4umyrZ7aJVJyp4NQe/dnX4E3RDFY=;
  b=ZJKbGz4HCVkIYJX0CpzbtPhCZ+h/XIrYeYFannyAOL3JmZok1QdFgP8r
   h649087PBitIJJVICEdvmgCzS0jKeGJZR56IxVQPqmld/4agq+5zl5wzw
   uDRnjVeBc63J7uXMKTU0jA4Fb3GtUeY3Kwe0ubPN1EsSvtaTpwiqNO8s5
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hkgMNrnbn96rItb/nLHEjudiwP1BGSZnB+zJBugojKSo6FQhXg6xZIfwuGJB8MI3a0qg0M5/Wc
 7SuDmK8pc0SAhk6Xfq143K8K/8GPKYqJAVfHLezSNZ3oHaD9QfNlDUuio4SElULEWJNIqFWP55
 SFIOIr7pAcjmQNpHGCGR0WSt9KCuYaNgDZQTQaN6KAwDL23VFcZ6WVT53VV+a0f9aMNkuOK8qN
 0doKF21wEgdP81lhqEpmznujmVOC/CuVj2F8eQjkUbAzph+Jxwqy3wXaJcB153/n5tYFyM1JJp
 /2A=
X-SBRS: None
X-MesageID: 30940680
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="30940680"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzfbTeqAu9ianjGOjaI9qsKJknYi5A+8IZ+zu0SxYem4upDtna4+XZpaDcS0gsawpjuII5wA38NFnYGzoLcM8ByESnbgZIV+Ay4lCdfzZyULWr6p3Vqj5BI8fhHvEqer8x+4VkeEYMxa8iY5SAYM6UE0xrPo9NuxReYBJbUsbsX70Oferqgq7Q/Vc/t49ZrRk4cSgg6KjYOFuQnf/HfaQJPTalGipaVjv5xNPDZ/DnBlDDC2w03oFEa4Ai15AU4V/wwksiiwffRi9O666rYg+cGHTufy9Q7MCnBvu/VroI4sxAXJbv1F458GiO3O5Mb+azd8jDrfQC1jeXOoc8gV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj4XlYtKAzzvwluGDPPEuGdNj6BGyfej6B+oN8iNW+Q=;
 b=BEeiqtzsC98sBVlZZxw58OjfdZfv8416FHcqY2WJaUPE8IXTbBjUxbclV8eWG9s9zAikvlxCAqbB7jrInvoChGbH7YM/q5aHG7jKK8qRlT04WjuFZrKqILy1xXW1Bb1/Wr/eLvqeOnL3Z4pzaYV5LFJ3a0Co74qSt2Yd9+kMWdMNHz+hr0XLcNrZVHoDFpciTDyizHg9dZdRbvemKm8oD2bRfP6dS4mRnWwDGewNICmvw5fAKv9YoAievl0U1+waMekhe+MigeWo/vEATBW/noNT6NbXRe8fu4d4mVoCyz+peiqyjaej/a6vD4uOHBXjUX9XJFg9CNZi7mQNe27f9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj4XlYtKAzzvwluGDPPEuGdNj6BGyfej6B+oN8iNW+Q=;
 b=JwYhNTqXEEL2iYRtovMgWkQdsDsWPs/IG9h7MkDmSRqoCZtNLAILAkVZvOSnexFzXA2/bSbLVZGI2GxHK80WYU/45iQe1lT17ZUxQOaK/Fjn7UZhtIek0O0oQCH0jYAJG52ly8m482qVDGSSdeA8QmsIq4b01gUeY6PwkhlH+fg=
Date: Wed, 11 Nov 2020 12:28:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony Perard
	<anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/7] x86: guard against straight-line speculation past
 RET
Message-ID: <20201111112848.bzbqdqthsq2sm4nx@Air-de-Roger>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
 <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
 <20201110093142.hkufamaepn67gv43@Air-de-Roger>
 <92e58ff0-e6a4-f92f-1ad6-06db7751762a@suse.com>
 <20201110111603.rarf7ncddrkswlxs@Air-de-Roger>
 <586bb9e5-bb90-bb27-3010-e702d65e301c@suse.com>
 <20201110140856.dtdql7lkwzwijko2@Air-de-Roger>
 <63ac07fc-1a71-b765-007e-571550970833@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63ac07fc-1a71-b765-007e-571550970833@suse.com>
X-ClientProxiedBy: LNXP265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e2d4ba1-80fa-4646-c774-08d88634f7d8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4764573E1572A8412B356FBA8FE80@DM6PR03MB4764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y9Qgf6jF1n4w4KyhZFeHDh6p3mZn7Cmm/+9RW0dkyW86bKgpb6kEA9LPJbwNmZWbYCKPYZ6GDobpISbGAcun8sb0NM25Q545TQyD1qshsrniNlS4UC2SAr2lWRB3DSO0kT5AElxjlw36nb3waSAQR6dB0oOlECYQwmkNQ5TB31HKhfKrLP6rF4n2IBkFh3jlKEZ7AR0IEZqAxZMdB5a9U8Hr/jWa1izQ/oU2KAsUz7C4I5O6mBRznnDWP2h2/NjurTmZrnYU5M1p4ytzzc3NorqYm8c6JB/5fQLWV/w+4Rq6Mkbs6Budsue6zKEj+DMk3Yfz8vCmUJm72e/6/G8xPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(346002)(366004)(136003)(396003)(66946007)(1076003)(4326008)(66476007)(83380400001)(5660300002)(6666004)(316002)(86362001)(54906003)(186003)(26005)(16526019)(6486002)(53546011)(478600001)(6916009)(956004)(8936002)(6496006)(9686003)(8676002)(33716001)(85182001)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: EthS5pvSvrt+/M9F/l6yToTxyUVEVOgsdEGE4jydEPwQ7ikt2XXd0khI0gP9o2Ou0RcFGSpVH5BLEABf6JCI41AHfpWFpgpzjnEG+4fFGkoXvWjiWI+LufyR9vNddBjXuZcXb0uzdbrG2HkePFi4H4LkgUgXtbmdUoO/Zh1CHnwLVOW/llux7Gai4ui2WjgqEK7OrDpig3NcMHj7CPVsOKzlJQztXqBRdhQ1740SCqAKY+Zbt9Y/tjXoTxL5vaOwpnQv7pY+lx6pKFhI8peDyKq/ZNX+qNNYYZcXv1l8+JajCqQ23+Y8OKXn/vfYhq1qSNquIgV1i7G2mpSdg5FyEZyKRK98kR7skpii4rd/GcvCtwiGC5U+E3OGto4Kfz5A6s1HaImUvyUhcXd0pYGxAihzzadBpnO22lhVHm4Pfw8C/ZrWuDpvCqhsp+YGZIqIadPetFtogINADRhwsXn5WB1FUcjoTp8pj6PvVdYrXlUiTayOuOMcws4mn+NpAOkaj3VONiUNohZVew8b5b+GH+6M+B4Pgz7KbmaibxwXHEeBXSiBwJ9yFwz0K51E0o4vL7mJrVGT0iP8vXvAyy8OJZjXlhRvm6yv8F0T1oVZ5D/y9j/OKTofdP2B4/l8E47sWLhwHOYMs+dgoB9Nwm22uM2DlZIlSJ62DOPGHLQkQMxE06XiYlpkNk0FWcwzQvbq4RCIHyoeoR308kZGiVTyLLkDrFwRC9ZTMdbfXIp/3Dn4QFufT1ezAz00G8kfx7A6iw7WptHqyiVzbl+phQ/mNeLFNS1ZceP8Mr9iEHGpAVjaLOXiVT9FdCNZ4ta4J0ZYg/HcC2jVLnTo+IkY28Qf5JNHetm+XlB4am75iLtFeUiIpNHUU475PpbOyrkcZ6VASiJPDBpDYVh/2q+9zILQyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2d4ba1-80fa-4646-c774-08d88634f7d8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 11:28:52.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6knLT5f+iMDcpBFya5HiOs8V6kOCP3AllKtnIjq0YY7pt03IlSCFdA6KjtXsxq3Gip84VvGeG1RqZ9eP/Wkknw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4764
X-OriginatorOrg: citrix.com

On Tue, Nov 10, 2020 at 03:32:43PM +0100, Jan Beulich wrote:
> On 10.11.2020 15:08, Roger Pau Monné wrote:
> > On Tue, Nov 10, 2020 at 02:19:40PM +0100, Jan Beulich wrote:
> >> On 10.11.2020 12:16, Roger Pau Monné wrote:
> >>> On Tue, Nov 10, 2020 at 11:06:46AM +0100, Jan Beulich wrote:
> >>>> On 10.11.2020 10:31, Roger Pau Monné wrote:
> >>>>> On Fri, Oct 23, 2020 at 10:38:04AM +0200, Jan Beulich wrote:
> >>>>>> Under certain conditions CPUs can speculate into the instruction stream
> >>>>>> past a RET instruction. Guard against this just like 3b7dab93f240
> >>>>>> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
> >>>>>> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
> >>>>>> achieve this that differ: A set of macros gets introduced to post-
> >>>>>> process RET insns issued by the compiler (or living in assembly files).
> >>>>>>
> >>>>>> Unfortunately for clang this requires further features their built-in
> >>>>>> assembler doesn't support: We need to be able to override insn mnemonics
> >>>>>> produced by the compiler (which may be impossible, if internally
> >>>>>> assembly mnemonics never get generated), and we want to use \(text)
> >>>>>> escaping / quoting in the auxiliary macro.
> >>>>>
> >>>>> Could this have an option to enable/disable at build time?
> >>>>
> >>>> Well, a subsequent patch adds a config option for this, which in
> >>>> the worst case could be turned off. I'm afraid though I'm not
> >>>> clear about the question, because ...
> >>>>
> >>>>> FreeBSD will drop GNU as quite soon from base, and albeit it can be
> >>>>> installed as a package I would like to be able to build Xen using a
> >>>>> toolchain based on LLVM exclusively.
> >>>>
> >>>> ... it's not clear to me what the implications here are: Are you
> >>>> saying -no-integrated-as is not going to function anymore, unless
> >>>> people explicitly install gas? If that's not what you meant to
> >>>> indicate, then I don't see how building would become impossible.
> >>>
> >>> I'm still inquiring about this, but I would say that when gas is
> >>> removed from FreeBSD then the 'as' command would be mapped to llvm-as,
> >>> and thus -no-integrated-as would hit the same issues as the integrated
> >>> as. So far in Xen we have assumed that -no-integrated-as would
> >>> fallback to an as capable of doing what the integrated clang as
> >>> doesn't support, but that might not be the case.
> >>
> >> At which point Xen couldn't be built anyway, I expect. If llvm-as
> >> isn't sufficiently gas-compatible, we've lost (right now at least).
> >>
> >>> Ideally we would have to re-run the tests with -no-integrated-as, in
> >>> order to assert that the external as is really capable of what the
> >>> internal one is not.
> >>
> >> And if it doesn't, what would we do other than failing the build
> >> (which it would also if we didn't do the 2nd round of checks)?
> > 
> > I would always prefer a clear message (ie: your toolstack is not
> > capable of building Xen) rather than a weird build time failure.
> 
> Fair point in general.
> 
> > Also we could maybe disable certain options by default if the
> > toolstack doesn't have the required support to build them?
> 
> We could, but I'm afraid this will go down the route of embedding
> tool chain capabilities in xen/.config, which I continue to not
> consider a good idea (and the thread got stalled, as expected).
> 
> In fact (also to Andrew and Anthony), recently I've become aware
> of another shortcoming of this model: Our kernel packages contain
> .config files for the various architectures and specific per-
> architecture flavors. It used to be easy to update them on any
> system, until the tool chain capability checks got introduced.
> Now, in order to update them, one has to use the precise versions
> of the various tool chain parts that will be used on the build
> hosts, or else an error may result (for unexpected changes to
> the file), or one may unknowingly turn off options that are
> expected to be enabled.

I think the options should only be set based on toolchain capabilities
when there's no .config. If there's an existing .config we should just
check whether the toolchain is capable of building the selected set of
options, or else report an error.

I guess this would apply to defconfig selecting options based on
toolchain capabilties.

> Put more generally - if I handed someone a specific .config, I'd
> expect their resulting binary to contain what I did set up. Or
> for them to report back that they can't build the thing. But it
> should not be the case that the .config got silently changed and
> certain functionality disabled just because they use a different
> tool chain.

Yes, I agree with this.

> > Has anyone reported this shortcoming to upstream llvm, so they are
> > aware and can work on this or maybe provide an alternative way to
> > achieve the same result?
> 
> I didn't and I'm unaware of anyone else possibly having done so.
> That said, I consider it sort of obvious though that the goal of
> replacing the GNU tool chain implies being fully compatible (and
> presumably better in certain areas).

Well, I think we have to keep in mind that the usage of the compiler
and the linker by Xen is far more advanced than what most applications
do, and we are likely to hit corner cases. I bet the LLVM people
weren't even aware of such usage.

Thanks, Roger.

