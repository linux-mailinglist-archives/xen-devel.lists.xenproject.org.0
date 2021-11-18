Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA11745592C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227317.393132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnenc-0002ui-86; Thu, 18 Nov 2021 10:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227317.393132; Thu, 18 Nov 2021 10:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnenc-0002sH-4q; Thu, 18 Nov 2021 10:37:48 +0000
Received: by outflank-mailman (input) for mailman id 227317;
 Thu, 18 Nov 2021 10:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45Id=QF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnena-0002sB-Hs
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 10:37:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f26ffdc-485b-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 11:37:44 +0100 (CET)
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
X-Inumbo-ID: 8f26ffdc-485b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637231864;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=467SMhHvKC8b/X5FFPZw048OgtsclbIiJ+ca4P453Pg=;
  b=YSQV320bwgyUd8vc8QaNvhxNTPfnx0CiTEQeNBqRD3WKral9tyLFPBVs
   KjshhFcpuWa5WQIOLaNeaCEVBpilhRxE+usaplPYrCK6Rku7IjoLCS9rA
   /9iM8w7oE11ZWEaOqBZr149Rjutfh0QVONsLa4JD9MD4UC/azmXUvA2se
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1d3iyySweqbhNhJSMXT8d63zGcWjzqjRLSOzfFAA/vUuVcboKghrOd5HG8c3LtkQbf9Moxv8Fs
 RRrTBQkuIDagnD9SwkrZfE6j76JxX17vc70e+REHpxTXUyJ6VC+JTKEPXgm2SzSO2zztzTKtvR
 OExYw0jepEhbwdOjJ3Dzeu0Jriq7G4UFnKOlrpc09O99ibchgizPFWFIZSE4qKSAYkfzsOw9cA
 qKeq2xQ1XEs8sgLav/hXr9DlU8LWQqCYgarZ8k7hvmavlPCQF/D8HAuAHjAXQmBvf5sHnmWGhY
 jnMcM2p5CPMSEP46q3OFGpRH
X-SBRS: 5.1
X-MesageID: 58134277
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 IxM4Xb3JBWwnslkSOt7CiZXWgu7Kic2Hk41xH0=
IronPort-HdrOrdr: A9a23:TGacsKOoNPgiZsBcT1D155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcPY9ds2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCDkqhoPRPAhwY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFh0dL5lUUtKPpZ2fSKGMB2/ffvyChPmHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,244,1631592000"; 
   d="scan'208";a="58134277"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1za34jiLnt1copWNyMiZEmN9XMBZh779Jk0tXMgHGZyZF3/PcvIg9mieRi4CpDFOacvTuOZteMSAWYsoDUoYK04iG6JX4DWaFtWwxeHRHPeTErBfVlvmaU14stctZMAzrmt0wFUA4kQ4bg6LtOqZtY/J9NYjFynyZLTFyKVUZQIfqCniauZGCCWsJyvQeuhdtFu5V4Bk3zg+X5+HzNzVHVPSsgKG77jmmNX7UGL2ygzg2+sQVjBMbwXmgiCwHJevZz+8tnL39s5/AF5ncbmZ13q7SpOfOOa2sN1OrmFAU5vYswpCsZnHrgB1RBLiDf0/7p/nsEKSxpVPDWNBBJRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovf4+s0uKJOMtoOtxbZ3WDZ+71Sdg7gsqjwe7mFV5Uo=;
 b=jjm4YTf81jn1gtT4V5HDmiOICsBzR4IdWokykPnFs2bOWx4nTcMHQ/0sOqXlEQbPCXsi+rUO7zUo3M1suN7JLgMZhKWM0MGpDWT6ZxG8jXnIbRad1RS/HP7drSCqF79a5tVPXjVwVrq00v99tgnt+h6Q2zQV0K5JVU0phspWtDB31Yu+L+0FRU4dxmeRK9pnr+O4XdovonK8ewUjaoD/pnlQP4abABG1Wtp8BZZnP26Wob03f2aDfj17Ku2v44AV9c7QeKXaWcpanOZmLDrLM63h3hfrOL9P4ViQTWrwYrHWonmvoUWGg4/dDjkzrgNecNUPPS1ClXS+HHYlx5S0BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovf4+s0uKJOMtoOtxbZ3WDZ+71Sdg7gsqjwe7mFV5Uo=;
 b=i66rcIfoIzNi0HDzpdkzeTx0RE9yy7OC0gZxxFvvYXDTm7AtwOMw4hLSRV+hCcicIrY/f+wP3xuX2Mo2TyLmhiMTNcyQ3sjzjtrCe/cowRpEXEmUoHfFeEy8Lw+gJcRXZZwxKTXa4jbupwdRS03BGltOqOKwCDschd1VF7UK15U=
Date: Thu, 18 Nov 2021 11:37:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Julien
 Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Meng
 Xu <mengxu@cis.upenn.edu>, Nick Rosbrook <rosbrookn@ainfosec.com>, Paul
 Durrant <paul@xen.org>, Quan Xu <quan.xu0@gmail.com>, Rahul Singh
	<Rahul.Singh@arm.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, Shriram Rajagopalan
	<rshriram@cs.ubc.ca>, Stefano Stabellini <sstabellini@kernel.org>, Stewart
 Hildebrand <stewart.hildebrand@dornerworks.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Message-ID: <YZYs6ewhD7yBetFh@Air-de-Roger>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
 <YZYVzkaQTQ6+Rn72@Air-de-Roger>
 <31E84B55-DF77-40B5-A61E-45DC79AEC7F6@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31E84B55-DF77-40B5-A61E-45DC79AEC7F6@arm.com>
X-ClientProxiedBy: MR2P264CA0051.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59efa5d0-080b-4430-5a2d-08d9aa7f6e65
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB348378831F6F5E842645541F8F9B9@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EEPy1SDmdLIifYi+alxbVppNPjwxQCHVJx0okBWD07Y+aKYYSI9eNxqXdnhA3euwWv2zlzsLcX7klP0cFpZGY5RdFBOzx+nTjkSazezOgUuRdo3ASkyGMEjl3s/Pd1Cx7GHjXZeUqXN3uRpLEBhGShxZUlD/Jd2ack3Ee2b2hg70PI1FHUHDjvDcEVG1eOVJll4nfpe9hd0Wqnl4lF5nyNfZBiVSFQ9TdVuTpBfZ4JV9lRDGIUXayr/K8d5qw6+yNbb1lrn7gRjYjkClNzY382wICITKyXTBFXGmLznfxReghbLt+P01gcEjLuN1KdtPAGuLejHhZBsMYlOhK0IOSHBZ14FG6N7LhzzwactwmCVeiwjdJhsdGN0rg4hRGWKCxm3qzJ9Dys3018fCV+jLTRfx8Htt2IlB4cEEMeSD5YoEhTr3l1vraYnfpaB8XKorPtmPUp2EAy1Oa0CcJvrih0l4JkxadqmyQpdmnN3zBCf5OKiZrBDNc8pA1p3vJfTikRyBoErghjJGFZLfQRtPuCte3SOXvQBHT79XspMN0+WOvH/fkKyl5NF5229i86lfvvwLFYA/RYnX/drTgj2XAUn6B477ZmfQFSkTxnXTbfXgNH+1WxifN0nKbtldKh7EgQt0sR4MUuxzWldSBpijLJm465nqndXpA0K5kKWbcxfxJfbgDf21flvcCs+ukclWwCmRLR4Ql325hBPVYoxraO1OkEOhCHvONnm+CS1GOwBxcNIinzO8ajnHG+krAcIjF9K0QikamwmTV/NNr5JP4+Y4Ke1mOQ3GVT42PsOmw8NwNsqxFjAisnmniceTB+RdGkCrWrm/khQ2HGMp3CFl1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6486002)(8936002)(38100700002)(53546011)(66946007)(66556008)(956004)(316002)(6496006)(5660300002)(9686003)(83380400001)(6916009)(54906003)(33716001)(85182001)(2906002)(82960400001)(186003)(86362001)(26005)(7406005)(66476007)(8676002)(7416002)(4326008)(966005)(508600001)(6666004)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2JEcmtSVVZpT2pEd3pMYUVKUmVqNWM1MiszOGRZM1J2ekFZcGFVaHBCUGl0?=
 =?utf-8?B?anhOMlBuamtLZmRCTGVxTkM3RkFiYVp5NXBra3pua01ScDhvUFZoUXhBSHMy?=
 =?utf-8?B?YlpTeTE2cXpIUVBoMkNiQlVGRXJZWnROTDRGWDMybmxIVFVNaUNyZlJjQVQ5?=
 =?utf-8?B?dXo3QjRyMzZUOW4yZ0dEUTJPRXZwQml1MnQxZjRKcUw1REVwR21VVWhkR2NH?=
 =?utf-8?B?bzhrVlZxZ3pLZ3RlNUphMWlrZ3YxMGIyL25FYlFpUmF6bnZ3VVo5S2Q0WWdN?=
 =?utf-8?B?K2J0dGdpSlVOU09qWWJUaXBVZ2g1NEVYdjNBdWU3amRyaEkyY0VGNC92WG8r?=
 =?utf-8?B?K2piVTE3by9YQi93WGladW1HLys4aXRvWXQ1SlZyNVNqakl2WGlBVEh3dXM0?=
 =?utf-8?B?cmtWQ3AyKzBYckJXYVp1bkZjbUR2UXBxV3laZ0dmc1lwK0dYWTBZa2xxb24z?=
 =?utf-8?B?dHRUOEU2cUNIbDNOalZVbXBhb2lGdXd2MXMrQ1RHYnJPWEs0QWJyV3BsaXMz?=
 =?utf-8?B?ZWRpSUN5cGdDbjhoNjM1aDBpZkMxQVRHSjdTNHY3SG9CVWlWNDd0SDEwT3lN?=
 =?utf-8?B?RS8zeWVNR2Y5UG1iL296NzJOanRQcGRLQkVmbFEwbE5mV0hSUCtxZWJlMlVF?=
 =?utf-8?B?bTZvR013dXJhRXJrUGllWDRCOVFCT3BqNzhFcjdMekw0VWxwem5hZEJjS1hM?=
 =?utf-8?B?cEJaWUJiNDhZRU9aMm9HeVZBS1BhQWNrTVdXOTZPRWJIc1Nza2t1SzhRV1JS?=
 =?utf-8?B?TXYyRGd4OTVqejB0QVBObnlnMjlBblU2aUhHK1JEMHRmQUVhZWlSZHpwRVhK?=
 =?utf-8?B?ZjhBaE5hUnpOZ09kUlpTN3pFcFNPSHdubndBOU9zaGJqTHNpelczV2c1OXBL?=
 =?utf-8?B?TUlGSUx2ZUd0UmxDWlhIWmhWZnNGblN5b1dDZnVpb09rcTg1V1lsQ0lhaFh6?=
 =?utf-8?B?WS9HZDlvR2U5QnBPUWxkbElUZlBVQU0yOXdCMk52dEU0RXJBamg5SUk1Q2tX?=
 =?utf-8?B?dUUvUWVjc0kzekRnaVY2ZThiTFZQMGZiTE5TbWR5dUptNGszUHp2V0lPWFBG?=
 =?utf-8?B?ckVlTzRjcUpNc2VmNk9VODhIbFA5UVM4YlhzQXlWTDRCaWkwenFpeGtFenRi?=
 =?utf-8?B?K2g4eU1FU1dHRHhaWno4T01sM3JzeFlnd2ZQSEE4bnBEbU93UFkzcVFWcnNh?=
 =?utf-8?B?bit5d2F2QUJTcUdVNU5zUURLOXhSUVdFSHBTdVJodXdkSUdzQVNHVHFqdFFj?=
 =?utf-8?B?U0pYc3VXejl1dExxdFRjTitId3d4cTM1MDllbFlobno2dDhpNHNuWEJYMlRX?=
 =?utf-8?B?QWdUVWY5cGFGQmswZlF4V1Z3VTdta2x1Y243Q3plRDdEUzJacGI0bW9TWHF1?=
 =?utf-8?B?RE81S2dyTEQ2akEzS1M5SmRpKzY2bVN2OTl1dWFiM0JFdktyQXk0L0JIV2xH?=
 =?utf-8?B?ZEZaY0RIN1lEVTlHSDJZWW9LN2x5ZlQySUFVNHNkZ0tvNnJjR0doUkJFZVRj?=
 =?utf-8?B?NTBsTjVWSzkvYTNmLzRNc2plVmxmZVJvNUU4eFptaDh4TG1xZzR3NFNsa0th?=
 =?utf-8?B?a2s4YXdEc0xEVTFIMmwvY2ZhRkJTSjhhWW1lcjEwMHpwQWhLaXBpMFBwUWoz?=
 =?utf-8?B?Qi9ERFd4TW9sM1V3NktGTFdOdHp4ODVrbTF3NUMySlZLZ3g0Nkl1aGRmdllL?=
 =?utf-8?B?aTd5UytvWGc2V0hrZ1hvVndWemdTUmF0empnVGU3Tzdpc01yMkV4V3pud002?=
 =?utf-8?B?bU5lV1pOTElIVGp2ZmpWaVdSd0F5d1dGbUplZXZKa25VQms2VTRYY1ZuR0hT?=
 =?utf-8?B?M0lZVmJ6Y3VqUUtlUXd3YmJjcVJKOVBOb2lVVDkyb3JTZmRNeHdQZzZ0UG1y?=
 =?utf-8?B?VFBEcGx6UHArRnF0eTRDQmI0UytpNHpSSGQ4NFpFKzhyMDJmSXovejhNTjBx?=
 =?utf-8?B?R2VvQlU0VVN3YnRWQlcwdEk2elpBc2txeVpKam5sYlJqS1hWOFRqdnFHZnJa?=
 =?utf-8?B?VmZJelVVQWVld0I5UW9VbjRYTitHMTlnSjFjRHd4d2Q1ZTVhOFpYYkM4dmRl?=
 =?utf-8?B?Rys0Y1IyNkliQ1lSZzR4SHd4a2c2QUlnc214NGZXRU42dmJwVDMydVBSV2Z6?=
 =?utf-8?B?RXI2Rlpha0oyQ2c4OFNTTzdITVFveFpGUmxDa1JSbVhobTN0emZLSGhTTjVT?=
 =?utf-8?Q?OOqY/+dMQo4il8RqkZmMyaA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59efa5d0-080b-4430-5a2d-08d9aa7f6e65
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:37:34.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esm0Pq/nBuUETIE+MHlNDLEQWglj9jUNGNqJUz7iduLWWPFmZdIG25cXYNDsUBxckjZ4ptC/BvuwjzTqU+RflA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

On Thu, Nov 18, 2021 at 10:01:08AM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> 
> > On 18 Nov 2021, at 08:58, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Nov 17, 2021 at 02:07:50PM +0000, Bertrand Marquis wrote:
> >> Hi Roger,
> >> 
> >>> On 17 Nov 2021, at 09:53, Roger Pau Monne <roger.pau@citrix.com> wrote:
> >>> 
> >>> Document some of the relevant changes during the 4.16 release cycle,
> >>> likely more entries are missing.
> >>> 
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> CHANGELOG.md | 11 +++++++++++
> >>> 1 file changed, 11 insertions(+)
> >>> 
> >>> diff --git a/CHANGELOG.md b/CHANGELOG.md
> >>> index ad1a8c2bc2..8b0bdd9cf0 100644
> >>> --- a/CHANGELOG.md
> >>> +++ b/CHANGELOG.md
> >>> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >>> - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
> >>>   no longer be built per default. In order to be able to use those, configure needs to
> >>>   be called with "--enable-qemu-traditional" as parameter.
> >>> + - Fixes for credit2 scheduler stability in corner case conditions.
> >>> + - Ongoing improvements in the hypervisor build system.
> >>> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> >>> + - 32bit PV guests only supported in shim mode.
> >>> + - Improved PVH dom0 debug key handling.
> >>> + - Fix booting on some Intel systems without a PIT (i8254).
> >> 
> >> Missing:
> >> - cpu ID sanitization on arm64
> >> - fix 32/64bit vreg emulation on arm64
> > 
> > Can I get a bit more information about those items? Just a pointer to
> > the commit messages would be helpful so that I can try to write a more
> > comprehensive entry (or maybe it's just me not knowing anything about
> > Arm that fails to understand it).
> 
> I agree, the text is not quite clear, I will try to come with a better one.
> In the meantime here is are links to the series:
> https://patchwork.kernel.org/project/xen-devel/list/?series=535805&state=*
> https://patchwork.kernel.org/project/xen-devel/list/?series=477151&archive=both

Thanks. I've added:

 - CPU feature leveling on arm64 platform with heterogeneous cores.
 - Handle register accesses as 32/64bit on Arm depending on the processor
   bitness.

Let me know if that's not accurate.

Roger.

