Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC5415CB9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193754.345149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMlq-00031E-Nd; Thu, 23 Sep 2021 11:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193754.345149; Thu, 23 Sep 2021 11:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMlq-0002zh-KO; Thu, 23 Sep 2021 11:20:06 +0000
Received: by outflank-mailman (input) for mailman id 193754;
 Thu, 23 Sep 2021 11:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTMlo-0002ka-Iu
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:20:04 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31fd677c-1c60-11ec-ba2c-12813bfff9fa;
 Thu, 23 Sep 2021 11:20:02 +0000 (UTC)
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
X-Inumbo-ID: 31fd677c-1c60-11ec-ba2c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632396002;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vQOhuimDY2OitzZaBklOacvXpkqW1b3phNRavn8XKPQ=;
  b=S7Dl9eOp64T9FjnesVID6X67L6qSmAOB/Ir3Xyt0x1byn3ytE0PtDVRK
   muQsmsjY/NsnabWvmxYeFD21urfD8mS7/+3FBhVZZDfPP2V0g0QcxjNkF
   UDe0I8akGwNy9g6mzvYSM63nIzqD/f50DtgV/UafKXqbgPqw0eGPMGBSe
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OC+pEBFdVQTpi4PNsDt5LIsrxzyDBVRuk6PowLN7HobNhdsnqkL6Rdv7PPDCqzqGKk3wXQz0vq
 YheaEDr+ZUmyLYLcpdCzk1rEdRQbnq/t3+o5LKTchJzCmmLoKyJlgCdsfxZvjafD7+l7ClHd0g
 rUi6C2ewx9GoKQpmandEqLymp8dHRzMOX4Q7uEi87cEBMi4qBHeFxHrHbln8pf9EYdX2ITqruZ
 +TQhczhGnGAPfpQW28r6BecpaWD6bqe5kfHQQ0eJ2vBVG0l7ULXGVuxNcvzfYCACW0XHA0xK55
 i2cFb2hNPdC/9oa9QF+hjnLD
X-SBRS: 5.1
X-MesageID: 53022233
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OFGPb67bOQid2xdFhNwAjwxRtGjBchMFZxGqfqrLsTDasY5as4F+v
 mAWUW/SOP2CZWHwc4p+Oomy8kwOvsPVxtYxGwo/+C9gHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo2NUw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 el2jYyfYAcQZazHiv8scTxjNigmIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWxo3JoURq22i
 8wxYjxJUyr7eBZ2OxQnLLUAvdiCt0TcWmgNwL6SjfVuuDWCpOBr65DvP8DSYceiXthOkwCTo
 Weu13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PIO/8vlmkViC3Fs5ARcdVUa4ifShg0v4UNVaQ
 2QY8zQjhbI//0uqSp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWJqTK/PwAFIGlEYjULJSMa5/HzrYd1iQjAJv5iD6ydntDzASv3w
 T2BsG45nbp7sCIQ//zlpxad2Wvq/8WXCF5ujunKYo67xh5FX7a1SKWo0APa5uRbHaS8dXyI5
 GdRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy32/yoCP5I+i89Bk7fR0wY5tYIFcFd
 WeO4Vs52XNFAJe9gUabiaqKAsI2xODLEd3/X5g4hfIfP8AsLGdrEMxoDHN8PlwBcmBwysnT2
 r/BKK5A6Er274w9l1JaoM9HjdcWKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 Y0FbJDSk04BCryvCsUyzWL1BQpRRZTcLcqqw/G7i8bZelY2cI3fI6W5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3QAk2PnIjHBM4lxVpiZHREFQ/xhxALPNb+hI9CJsBfVeR2q4ReIQtcE
 qBtlzOoWa8UFFwqOl01MPHAkWCVXE7w2F3Sb3b7OmhXklwJb1Whx+IItzDHrUEmJiG2qdE/s
 /un0AbaSoAEXANsEIDdb/fH8r97lSN1dDtaUxSaL99NVl/r9YQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbi/ucIzgltEHjRQU6sD7dsfiuP0cVV7/Ufzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4K1sckvg5SJx8L6WamloPkGB2H5HMb94EII52
 uN96sQY3BOy10gxOdGcgyEKq2nVdi4cU78qv40xCZPwjlZ50UlLZJHRB3Ok4JyLbNkQYEAmL
 iXN2fjHjrVYgEHDb2AyBT7G2u8E3cYCvxVDzVkjIVWVm4Wa2q9rjUMJqTlnHB5Iyhhn0v5oP
 jk5PkJ4EqyC4jN0iZURRGurAQxAWEWU90GZJ4HlT4EFo51EjlDwEVA=
IronPort-HdrOrdr: A9a23:/Q4yPKwFCq9SvuX5sJOzKrPxv+skLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WB3B8bfYOCGghrTEGgG1+rfKlLbakjDH4JmpM
 Ndmu1FeaLN5DtB/LbHCWuDYq4dKbC8mcjC74qurAYOPHJXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAoqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocXTbqjVQGdgoBT+q3pYpxqdS32BXTq+/blkgS+pUoJjXfxn6ck7zE9HJFUcegN2w
 2LCNUwqFniJvVmGp6VP91xNPdfPFa9CC4kAFjiU2gPK5t3T04li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53022233"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtoBd1HwCFP1G3xsIikhM+pqv6N45zxpjk/fAJjnRRSzYKGV48rjg6IRLOUFvQqSMalg84J/Fg+cCE77R0jxc5yac91g4WEjucweD8eUfBQEv3f+wgrWkgic8N3ROgjnWVA5udcmB8FTojdX3QawXGttxtQy7rDWGX0L9FbG0vvwSxThM5PzuWedpikY0g9d5Snc7rZS60jLpD62XZNbUdmX+LEnJIvu7aWDOxW1jYxDGPjULcQ00+rh2OrKkxQtlYO0lgtIBAgZw/XvSW4WIGu1p2i810PM3Ylr3aGBPjR69iNLde9Jr71bH/z4mjecsJpYULKHu99bFTNvK9W0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dO+dY5cvH+56MllVutdEH/SCEq0JNQk2yLi4P15abpE=;
 b=mFfU+U575m2PTvZUfkJfLHcMl8PGEF0WSeMjXHANggisExMbJnG3GmQ94g6Q3dbMeq3tsUaOrLw6oCBpE0hF/hQ75UitIPcNif3QtQ964cRfu0bv5CydsFYqC/QyLpkRbCvtcucK/MZyE7GMIK893SoWKVjtamw3466SUeulDNIQijytveGTDKNIVUiT86HdH28ehJLXuW5NJY+EhzB6KxuKP+uYYTm0M+spglJ0rhtbjc8yR4HeC7B1sgtH1PwE++ctaqH6lAH0Pq1Z8hglnD7YjQPKMcLFp+HVIUlGUMo20vWXDv4BOUjbvwbGh5RKayOMazjEVnMvgfxRBG83qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO+dY5cvH+56MllVutdEH/SCEq0JNQk2yLi4P15abpE=;
 b=Qd+wEij/PyOKXqqerf1/Nd0bmUP9r9ccb2ksFQjQjB7D/9B3UCs4m3KCjaHmJ/RRBXdItA9g1yHArmlFn7pawUqzfEyicIkRmawn0C1b00joKfjZPVUXeULfJ8cEZ5FWdy5WQFlJmJ1IzdBhUvL4tGzOFCS2Eof9eYksCPAHztU=
Date: Thu, 23 Sep 2021 13:19:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
Message-ID: <YUxi2DeEXhsnUTi7@MacBook-Air-de-Roger.local>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
 <YUr525A3B0cs2rBo@MacBook-Air-de-Roger.local>
 <b93a13e3-2ad9-aac4-7f87-b290aa4c3953@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b93a13e3-2ad9-aac4-7f87-b290aa4c3953@xen.org>
X-ClientProxiedBy: LO2P265CA0418.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::22) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a5b965f-1f8f-4ff6-2f8d-08d97e84135e
X-MS-TrafficTypeDiagnostic: SN6PR03MB3744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3744738B120719013C68701A8FA39@SN6PR03MB3744.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1HcKAVmJqr6Xf2UhaZDNR2iDEuVgk4y3vFfa4htmTy5CLmMRMZ2XpvhbP7k4Ayv86xLaejRaUw9riMV/W05OAtkPmkEr9lgFIUd8Xgjx20nGURsgQaEQusyvxny9pb4UI7jXjdiuP4JKhLsAfc/gpCZ1HmIvTitArBcnregikEw95XnQjRwAp1PUau1Jg6B4U21NvgQ46KMFH2ZUvvJrRmudT5e+tRhodCCR1oTuCZ8FxSGCqVTltqil95iBJa8tfBy182/WIlaSAiH5niskV6JHKUqf4B0hHW5SD5ftgmHOt8+i+o2aIGZG2ZsuwZIpW87/gokb6zuZeAUkmGYvLkXQeBbDYCu0xYm3WSOI43olzCC84zUrSBv50b1Kqu7jI8RipK+yt4x3EzokiK2OAnOKwk0jiF9RpBmeldide/UF+5sohdUpm87uD9uFE1fRcoL/xkB2GjuMXna77Teu2ooa3SpLTlkbOuilRrQgAHD3gBuOnR6k4NFzfbcXoDO3bw2nwYTV/Nwyft/QGorYZUFZn0n2e6585fnDqvDw1tL6dlkl0E4DfnIZmA6I+CQFzShnbTa4BlXK/ijWyMQFDYGM+SV546ZdFx3sBfLwl9DSjdL8IBDMTgSJzYFKIuguniPDH1amcJ2ERinshbIlLy71a2DQRS3GBRjrzvpfphpP0pj9KRVADA4uMUwUt4gwNjpEqejLTff5IhXgPZhcwk4X1Q3sHtQfIDoVTVRtCUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(6486002)(54906003)(26005)(4326008)(186003)(8676002)(316002)(6666004)(8936002)(6496006)(38100700002)(6916009)(9686003)(53546011)(5660300002)(66556008)(66946007)(86362001)(2906002)(66476007)(85182001)(83380400001)(508600001)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L05EUlcyeWFhZ2Q2Q01UNHlEV2lUTVU2M09oQ1NGWTZUNWVSd1RPQmpibjVG?=
 =?utf-8?B?eHhGbVFqQ1FWaWFLR2JjQlFWYlI5anB1UDR2QWRQYk9UaWd0SEN3Q1RrOGVH?=
 =?utf-8?B?TlR5TU14cUs5Z3doRWo1bVpvbnQvUGJua3BGVm5aVWRoMHFhdHUwY1dpeHR6?=
 =?utf-8?B?ZUhrVFlxN0xBMDBqSkxlcEprdTZqQTRKUWVVcittNEZHemVxdjRVakc2MGpO?=
 =?utf-8?B?VjZUVW9lQitIZFBMemc4bkp0SkdxMWYzVkJIVGJLZTJkNnJvK1dpcWt3T3M3?=
 =?utf-8?B?M1RNQ1IxR1VqUU1obUpFOHZwblFseXVlVjBlNEtOY2dzblpoTjhULzVpcHVC?=
 =?utf-8?B?Q0dybUs4VStDcnRTMEUwaHlzaVpLL0xvekpvZmFDSENNRkl1YjNYNTlSSWg1?=
 =?utf-8?B?dVcxZ0lPTWl2UXpXRHBPUWFUNTA3VlJlM0pZaTdtK2wwckhNNjBUbUpBRFlS?=
 =?utf-8?B?MWNlazd3TiswK2EzMDk1Q3dwSlEvaUpGWTNrM0dRTWltTExqOC9RMG42anFm?=
 =?utf-8?B?Y2E1RXRKVnZhRlR0MXZJN1ZJTUhoV1NtWGI2NHZwODBYeExTTlRlVHdVK2Za?=
 =?utf-8?B?RjhEV3J0VHlCMkRrZ1pQQjNEZFpBK1M3NGZNWTVaLzZaOGJ4YldMV2doSTFH?=
 =?utf-8?B?NWJZOXdZa2syR20vTmtNVXpFOHNyVEx3clNoMDVQeEQxTGxqaVdDQ2pRMHhY?=
 =?utf-8?B?Znp2RXZhcUR4SU9EVVNnaWV6S3NheENJZFBidHpMZ20weTlQZmtMSUc0bmNE?=
 =?utf-8?B?S0orcG5FUUkyaEpEZDVsNEQzMHpORjYrT1Jtd3oxVWk3VzJvQ2dNeStWbjVs?=
 =?utf-8?B?T0k5YnZ1UDZMWmIzaG9lMTBKTGMwcEx1OWxadDhKdUYwOXFEdG9reTJvdGpy?=
 =?utf-8?B?YzM5SGx3UGN1ZHk1V09FYXlScHFMbWNZNzRwM2VCbStjZmx0Y2kvSThKSkwr?=
 =?utf-8?B?WGNmREJpR0xON3NibmdQbGtxbzYzc2FsZjc5eUdCNWxQYXhUZzl6VURvbWFQ?=
 =?utf-8?B?N0hwdVFnUGxCZUEydEVKVEx6YW1LRzhYZHIyZGREZ2JnZ0gvQWFsLzJ1N2ww?=
 =?utf-8?B?TWxFdWpYcFVHemFiL3hXMENXZlFyT3JzVFdCSW9XTDJGckFCbWxtV1AvRkNi?=
 =?utf-8?B?WnB4MG5pNEVUei80c3hpdlg3OVhMOTNabi9HT00wbitaWThFUmxxSUlsWGZt?=
 =?utf-8?B?TzlwVTlLSU1STHREMFFHTlQweWd2VHFuc2Z0SW9TbVliNmxpWG15Y3IxRlhL?=
 =?utf-8?B?clJLaHBZTTMvNkpETzlsSHEyVEt2NWxkeHZWdEVndlo2VmdOdFpKVzRvVjJS?=
 =?utf-8?B?U1ZjbjU0cXZqcGRCd1ByZElVUlNPV3Q1QXZ5OVhDN3VhY0pFZG9ReUhORk12?=
 =?utf-8?B?RmVZWmRJOWVkcXZqd1pvWGdMV3RKTDVtbWtBTW9ISDFwT09OQWtVSERja0M4?=
 =?utf-8?B?eDFDVUtXcGRrNmpQNTZGMXVINkdmSTZGdVdMZ1lDU3dQYW1Hemc5Y3orVUUv?=
 =?utf-8?B?UTIrc044cFFVKzAraTA1YTRBVW8vUWlFYS9EQjNQTWEvWXBHU0JHV0tmb29S?=
 =?utf-8?B?UXFhOGxqVFlWNkJDME5yU3ZFS0dRMjZDWjFyWUlsd0RnUnI4SkoxNEV0RGZB?=
 =?utf-8?B?eUtNOXJzV3czQzFadlIxVUNSWFBRMDRtV1Rtc2xVK2Ztbm9yblVhM3Zhb1c1?=
 =?utf-8?B?d3QyeDF6U08yY1UrSXpLNnZ5L0lqbUozanptaHRSaUo4czdWWHhlY295SWV3?=
 =?utf-8?Q?jELdfTsORK/I9+PaSaFkeKylGDvi7prGwBZRAtf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5b965f-1f8f-4ff6-2f8d-08d97e84135e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:19:57.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+DgiLG1AaHhriTrWWVon9di6q/ckcFsEneyqOs0KefH0QnGm6pMSEyX7c1eO9CJwpORfnstmbLXpN3zc7xawQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3744
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 01:47:37PM +0500, Julien Grall wrote:
> Hi Roger,
> 
> On 22/09/2021 14:39, Roger Pau Monné wrote:
> > On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wrote:
> > > 
> > > 
> > > On 22/09/2021 13:21, Roger Pau Monne wrote:
> > > > Hello,
> > > 
> > > Hi Roger,
> > > 
> > > > First patch on the series is a trivial change to xenconsoled in order to
> > > > use xenforeignmemory stable library in order to map the shared console
> > > > ring instead of the unstable libxc interface. It's reviewed and ready to
> > > > go in.
> > > > 
> > > > Patches 2 and 3 allow setting the host wide command line `gnttab` option
> > > > on a per domain basis. That means selecting the max allowed grant table
> > > > version and whether transitive grants are allowed.
> > > > 
> > > > The last 3 patches attempt to implement support for creating guests
> > > > without a grant table. This requires some changes to xenstored in order
> > > > to partially support guests without a valid ring interface, as the lack
> > > > of grant table will prevent C xenstored from mapping the shared ring.
> > > > Note this is not an issue for Ocaml xenstored, as it still uses the
> > > > foreign memory interface to map the shared ring, and thus won't notice
> > > > the lack of grant table support on the domain.
> > > 
> > > I find a bit odd that the Xenstore support is conditional to whether grant
> > > table is available. Are you expecting domains with no grant table to have no
> > > PV drivers (including PV shutdown)?
> > 
> > I don't really expect much, as having guests without grant table is a
> > developer option right now, if someone wants to make use of them for
> > any reason it would need some thought.
> > 
> > The other option would be my first proposal to restore foreign mapping
> > of the xenstore ring on that case:
> > 
> > https://lore.kernel.org/xen-devel/20210917154625.89315-6-roger.pau@citrix.com/
> > 
> > But it's also arguable that a guest not having a grant table should
> > also likely prevent foreign mapping attempts. Plus such foreign
> > mapping won't work from stubdomains.
> 
> There is another option: extend the acquire hypercall to allow xenstored
> domain to map the xenstore interface. This would require more work, but at
> least it would avoid the interesting dependency on the grant table.

Xen isn't aware of the shared xenstore ring page currently, so that
would mean introducing more knowledge to the hypervisor that what's
strictly required IMO, as Xen has no business in knowing such details.

The grant table slot used by the xenstore shared page is just an
agreement at the toolstack level, but not known to the hypervisor so
far.

> > 
> > I'm fine with dropping those patches if they turn out to be too
> > controversial, I think it's an interesting option to be able to
> > disable the grant table, but I don't have a full picture of how that
> > could be used in practice. Maybe others have and would be willing to
> > pick this up.
> 
> I think the current approach is probably OK as a developper option. However,
> we should at least document in the option that disabling the grant-table
> will also disable Xenstore (anything else?) support when using C Xenstored.
> 
> It might also be worth to clearly state in the doc that this is only
> intended for developer use and not supported.

Sure, adding it to xl.cfg man page is likely the best place. Will do
when updating the patches.

Thanks, Roger.

