Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F5F2AD489
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 12:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23264.49919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcRdH-000748-Lu; Tue, 10 Nov 2020 11:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23264.49919; Tue, 10 Nov 2020 11:16:15 +0000
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
	id 1kcRdH-00073j-IX; Tue, 10 Nov 2020 11:16:15 +0000
Received: by outflank-mailman (input) for mailman id 23264;
 Tue, 10 Nov 2020 11:16:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcRdG-00073e-3s
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:16:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2d39282-37fa-4aee-9921-54f575537241;
 Tue, 10 Nov 2020 11:16:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcRdG-00073e-3s
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 11:16:14 +0000
X-Inumbo-ID: a2d39282-37fa-4aee-9921-54f575537241
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a2d39282-37fa-4aee-9921-54f575537241;
	Tue, 10 Nov 2020 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605006972;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cqQem3HhAF2O33HayaRBvE+pd3V5gZFLS317N09pocw=;
  b=dmKRlGsWX0/wDkGLoaDzeyEYAyV/VbE9jXOGAmVf64FnMgs0Ike9P5JG
   lsUpTIwPSWhclS3q2JC4neEtnibzfT8GXliamCQ7CLx1lpo4+iCQAIih8
   hlwCTl1hxydvGLy7wRM0Rd8fZB777fhFR8gVItFk+vGGYbG039/xOy4EC
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FzvriLHXav0THI47ZVQwxKykduWLJfdUIW95aSXpBTXPW7nPDFZgCevwYkq8/o1yPnUP/aFnJa
 RJ+iDMAYiSdOaO16E7ERwG19kLvndhmNm3oJwOh1HTue515d1D7qwcMMVpq6EauTyowtDnBhjt
 aw/aXoLcJX2mmzJ4DFOifKZP9CMYMOP6snSgnmvrjDWZVzSK8JCLYZNUzBjXtJT8tHMVPjqFO1
 pBe/8z35yGVVpFP3cm+Q5jGu0rkFKpoMGEAh+zvyIE8lrTGI+Axw645XIjrbtDjPDO1DG/9QEs
 vhc=
X-SBRS: None
X-MesageID: 30809968
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="30809968"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6fya2vX62CndgJoDBnstFv8r65WYuxWEEwYE/CR/B/cfBmhMaI+rvwJKIkM4Zp5kNl0w7aMRDVAVwF01VDCCfo48e9PIJxjaGJGaOwC4NT4r5Al0nCAjksb5IkuACYLmZSgWbLLDf9z5fHXZMqs8xPfnxpJdjXegjiTQqmS3uNt3aJCYTs0zlb0AXVrrjxcOVPbRn8+0xF+zq4VY3cxhAfT0sRMjf5zoubmq1M7WtWEGkTLtlCgf++VzAnliiUKqjzRtvjWCqqKNVs5FcQWtEuMgVz4IcXeJwcPMr3R1MGncnENxAs3XHyOUfaUm4JGMvI9boRssto7/L1f4kGTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnTB1J1VK+kzRdZpv40WckXOrhwiJ028YdQrgs5DGVk=;
 b=UyMDJyQo4uGY8JZkziAXZAaTvtkya9qws3x/VqySFR83uiK32H0ml+shcW6b64jGHpkgwNySRI1MiQB+bB8F29tdTmX7kD6nRdgt1cfb5RIrMbcLefQKuPdHJ9WKLHbHh368gkTUs19sqMhGz/my0cFfYn1PBCXy6rw7ZBvzpG1uiiQdT0WC9djjo23QbMzKdcp5e21/B93FlpBfSey5zKMBs3jODhSZYGEzZNWMObSEmbAcqLjEBTWcYaJtdd6QOiiKiWUyP8//W72BOIYRxOHqGhrfqOl91QasCFGrO2Dlm+mPVR8EyOkhGgN3d5Y5AUKXnZ9PQitCOqesltufZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnTB1J1VK+kzRdZpv40WckXOrhwiJ028YdQrgs5DGVk=;
 b=hEPlbda1CiyCh/r90KGrVLojCorpQIDZ7aILgMlOPSPtiEimOpav99JRbHSjElJA6O5yXYc3j7ABwj2CZwhxpIgfUwZHjZfByRV9W0ue2vqwcBUqGIarML59+5yFdH2+psOrgO/jec1tAWU6nmQq8mLD3buTzqE1TOSCWkS0luQ=
Date: Tue, 10 Nov 2020 12:16:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/7] x86: guard against straight-line speculation past
 RET
Message-ID: <20201110111603.rarf7ncddrkswlxs@Air-de-Roger>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
 <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
 <20201110093142.hkufamaepn67gv43@Air-de-Roger>
 <92e58ff0-e6a4-f92f-1ad6-06db7751762a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92e58ff0-e6a4-f92f-1ad6-06db7751762a@suse.com>
X-ClientProxiedBy: LO2P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 972414f6-9620-4f50-3890-08d8856a0606
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3483C9B45219B40AAA411EB48FE90@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZJZFys9KloDYAIKMARVm2tUH8FNDKavYu6ibvyOQ+TknzBb7QEsjmm+j3pND8b/NY9Z/OTIJs4a0qwyPS8tDX5cA2fplts2dD7GhxM6mftvgKaEuKwVcSZuy983L8TRKDlMT4Zu8mW2zn3KfuhxB0BxgAvyYHADLRB+ZX8boKwT1TFkY8N1nByZPU4A0DFo2DZxD7vJiX1fiWKHuop2r7vdrSZAQQrBWHQS54VOOxAhLnKCjrwlT/gJyQwXunILfh/De9CoO8a9q34+3c1P9DCg4a6oivYxZ5mC9W+xuRlTtyQBkAzoDR7DesZIavtO7tNxPqYfjlbtdnpMODqz/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(6486002)(8676002)(2906002)(478600001)(54906003)(53546011)(33716001)(316002)(26005)(66556008)(6496006)(83380400001)(956004)(66476007)(8936002)(6666004)(1076003)(86362001)(16526019)(4326008)(186003)(66946007)(9686003)(6916009)(5660300002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: G/UIrY9Pnb3dxJ2AFfBZZFpgI3SuqRy3O3XQhE9r9V6YlKbZLddl7zvZPX6tjM56nZ4s8viGCzesR0PtWTogoWxkPGNwh0miIwes3XunC+eAv8i1VnNAzHLOw5v0oKEwLa0ea9ih7ec4M0KuMKExnzOGcKowLQ+fTThiPMEXVNJMUDksMMiALueSsVdjsKyMJ3Tv8liyx/i3AYjnVcGPjQ+jKmZ2bA7WyPFjqSnGt5UTUL2XE1DK4jOcTHGkbbeaT8iQJcpLxBR2MUVjWAWBb1BwDMv6HrJ5D0j9lTgbzmZe6ubl37YHwk8C7yWHtk2BaOrsy/WGB6FONQ1OW1llakGtyXTWeTCaDqFh1m9Wb6/q0z3DeAvw33sl/ydB9/J3YO1KRlmLRW0ooMyjdFN1akaALglWeR+UhnpsBUHHSZ+4MziT405NSsDTkzQMo5aRumHztO4tQeaY254E21IbuzDjXZbTXFph5fgSNi/aLGc8bURHzbUNs3FZlvJN9AIG8ztDqVtA8hWYXSRxBIu6/ysWooxADdNog80bJK0G9zMSeZVe8WhkoYaqAWH4bc0W0KWJWBmPN5lDfKlR61h2W6KLvMIOXN/oVko78QJKRpJwrXF+2sxMeWAqCi8/rwi2dGSDxP33E7HKzhcSr4lXNVSkWY1HMoeulM3Pe9AQwlLCI8TFwmWarRBSJIJxlcKyxUQqRgpZ+Gq8rnD7z+anqmzRRVnq+KQQAhmI6hR/Znpeu0Yc+0U0s2mrdlwAAKA7AwQhoBgH7+FOtYIXgebykfCSlJsUHoaKin4C9s5kcTQEAfec/BUAtJq3GQQ2Ye2XekcXufKag0kHoqD2P3PCKdNRGVfOcmz2X+e8tZOFbl7QS+mib3IUefP5h5uVVw4YK5ZveN6vxGEQmco1/FteYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 972414f6-9620-4f50-3890-08d8856a0606
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 11:16:08.9064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxIT6S3Wr7wIIliiQhQSJBtD3LU5rIQy+psIVpJinoolmlKAclGPsTMSVxc5CBAwh6COxDE1cyieqb8GBJzdRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

On Tue, Nov 10, 2020 at 11:06:46AM +0100, Jan Beulich wrote:
> On 10.11.2020 10:31, Roger Pau Monné wrote:
> > On Fri, Oct 23, 2020 at 10:38:04AM +0200, Jan Beulich wrote:
> >> Under certain conditions CPUs can speculate into the instruction stream
> >> past a RET instruction. Guard against this just like 3b7dab93f240
> >> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
> >> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
> >> achieve this that differ: A set of macros gets introduced to post-
> >> process RET insns issued by the compiler (or living in assembly files).
> >>
> >> Unfortunately for clang this requires further features their built-in
> >> assembler doesn't support: We need to be able to override insn mnemonics
> >> produced by the compiler (which may be impossible, if internally
> >> assembly mnemonics never get generated), and we want to use \(text)
> >> escaping / quoting in the auxiliary macro.
> > 
> > Could this have an option to enable/disable at build time?
> 
> Well, a subsequent patch adds a config option for this, which in
> the worst case could be turned off. I'm afraid though I'm not
> clear about the question, because ...
> 
> > FreeBSD will drop GNU as quite soon from base, and albeit it can be
> > installed as a package I would like to be able to build Xen using a
> > toolchain based on LLVM exclusively.
> 
> ... it's not clear to me what the implications here are: Are you
> saying -no-integrated-as is not going to function anymore, unless
> people explicitly install gas? If that's not what you meant to
> indicate, then I don't see how building would become impossible.

I'm still inquiring about this, but I would say that when gas is
removed from FreeBSD then the 'as' command would be mapped to llvm-as,
and thus -no-integrated-as would hit the same issues as the integrated
as. So far in Xen we have assumed that -no-integrated-as would
fallback to an as capable of doing what the integrated clang as
doesn't support, but that might not be the case.

Ideally we would have to re-run the tests with -no-integrated-as, in
order to assert that the external as is really capable of what the
internal one is not.

Roger.

