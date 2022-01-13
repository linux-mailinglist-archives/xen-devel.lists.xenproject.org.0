Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D924548DB6C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 17:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257259.442038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n82hU-0005n8-Lt; Thu, 13 Jan 2022 16:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257259.442038; Thu, 13 Jan 2022 16:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n82hU-0005lB-IQ; Thu, 13 Jan 2022 16:11:44 +0000
Received: by outflank-mailman (input) for mailman id 257259;
 Thu, 13 Jan 2022 16:11:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n82hS-0005l5-Gl
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 16:11:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b1ef49b-748b-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 17:11:39 +0100 (CET)
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
X-Inumbo-ID: 7b1ef49b-748b-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642090299;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UiqlFBznZttB2P6CFSFvCA9g3In19JfZ9DkkEupeBLQ=;
  b=Tt8K0dl3veocqrj+pLcAf7bXifZlwBpowtj5IFed25rOjNnvCEcUTLk1
   kNNY4SJAqYzMORQRNOZ3NMlajdl9ESTBUatCH55RgIWx3cOexY5LdN67l
   TBiPkGumQ3ziMyWf/xfJAhIRg5r4cvMzT6Tv45Tl2K9kvFFlAfDNDEtfT
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o6AEBBgvBkW2mgvUSJSj3o2Xi+DEjThJE/Ko027lIhjtO0hGFKD78zuJk/oZG5DuV9DMN1FqmO
 +172BZ11ifXldY1FfCYPg57JeeOqRF/XdQebqHAR0A4i3IWK0UiH4QYXUjqB+OLUECl0yJwMYI
 iEIWOVE51vUSiGiXzlLLzKrlj2zwltR0422YbV+/AFE00ul5tO5xhBvEWstWRQcR/Ff1NyfRK/
 Uce0faikvAWijgYRxrQGbj9MxmbJ1Bf3hOQopm7W46oo1cDdXyLXXsU5s/duu5NJAFPtro7oDZ
 dstb2VZOUeYX3lhmj+2PMEL5
X-SBRS: 5.2
X-MesageID: 61853325
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wUllZq3mjKCFhFgUKPbD5Ql2kn2cJEfYwER7XKvMYLTBsI5bp2RWm
 2cbCDqAaPaDMzanL99wPtnl9UsGuZeAnIcxHFNkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wrVh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhro0u6
 dhEqZmKRzgPJ4Hg295BaER5HHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4YIgWxr3J0m8fD2a
 5JAOT9xakX5egxjM34uUMxgtei5ryyqG9FfgA3M/vdmi4TJ9yRh3b6oPNfLd9iiQcROgl3et
 m/A537+ABwRKJqY0zXt2nClg+LU2DP2XqoeFbu36fduhBuWyyoOC3UruUCT+KfjzBTkApQGd
 hJSqnFGQbUOGFKDf4SifhCxvHu+sCE6QvZ8UNdm01ysxf+Bi+qGPVQsQjlEYd0gkcY5Qz02y
 1OE9+/U6SxTXK69EizEqOrNxd+mEW1MdDJZO3dYJecQy4S7+OkOYgTzosGP+UJfpvn8AnnOz
 j+Dt0DSbJ1D3JdQh81XEb0q6g9AR6QlrCZpt207vUr/t2uVgbJJgaTyuTA3Ct4afe6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2QcV7r232oyD/LdsKiN2bGKuPGpxUEdMOS
 BWC0T69GbcJZCf6BUOJS9/Z5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWTqL89Aj+5D7n1ulAv7GMGgpzz6gOX2WZJgYepfWLd4RrpnvPrsTcS82
 4s3CvZmPD0EAbKuOXeGoNdDRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKm2xUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:V6bmvaiSwd1p5PHechlygUOFv3BQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUZqFh5dL5iUUtMPpZxfSKJMB2/ffvtChPlHb21LtBPB5ryw6SHkondotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61853325"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PP4LLuQsjHh4ZetM7mT5g+PWeC41k9ZCOfzgEewHv0csHlSo9sIjQ8RdoST5DyYZkyyHnJ/4vg77f2YTA0XboLIT64t0g8Ts8UxHwogW9SEgnceUdKxYvLvLSQ2b6ZQFkFmzXRP/izE55WaOFI//sr0oWzdpbddy4xx6pG2XRgeA4wTY0ul6kWxaGidR7p4p0dVP/D1qzQYhZ65pG8mM2lCTioVD8RxPaSbTft9tuX2JWsznMAkGyG7WdjYFrokTTdpn4fwncLUf2RiOgMlTMSxukMZyQPw0b4fPzMwiQWCDUjIB9qJ2RiZi1r+eR5XoB/ktSVQCvhc8Axtmp0gWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Slr2GhhCNaXEWifmCr49UNvxjA6VYstXfirn1wac16k=;
 b=L6HytB3tpvt5OVEIbX7Dafivq9gjWjswlKCy2KpKSGZEqrsrfX/ahV+B9dyqhm2DgHcdCt9eB0ygU8QVLcSiTPN3GdTSAEKhonDheUFwvqtu/rABoUWSEgjJlfQzF8dOEJmqLMeuVy1j0luTzuY/l2T3P96Cv9W0/z96iwdrEtG/SdDkcQm/2FF9EHON5Lk7y52GmGs0w3/uALKkn/fdF0QUXN3d8/aC0AEX5h9I/Rz/IvGbUeqLn3oj/Q+C08RyK7sMaNyDr+tKDrrBlx9QqikpZgSx94b3OuLGVK1gJ9Bwt1MTA23TslEI/15CrWX6tOIHIGIFl/E7or20HaOJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Slr2GhhCNaXEWifmCr49UNvxjA6VYstXfirn1wac16k=;
 b=mvibDkKWjhsInhJREfkwgYPvqmwBMYIyvnV/bjvtFo0GaDLHu2T1B7CiGSM6c5aWqlPureWhb4NYc/9XXdt7j0TKXSrPLkoWjRYNgDWIEVR16S31gj0tDEnBH1GQIOEJyHosnKE9cGRmaxJ0J565Xh39SKHlKbIyLdyyAofeUNQ=
Date: Thu, 13 Jan 2022 17:11:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: James Dingwall <james-xen@dingwall.me.uk>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: possible kernel/libxl race with xl network-attach
Message-ID: <YeBPG+8D00xG4h0j@Air-de-Roger>
References: <20220113111946.GA4133739@dingwall.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220113111946.GA4133739@dingwall.me.uk>
X-ClientProxiedBy: MRXP264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5b076ff-9235-4d09-bb40-08d9d6af51f3
X-MS-TrafficTypeDiagnostic: BN3PR03MB2177:EE_
X-Microsoft-Antispam-PRVS: <BN3PR03MB2177A9E5CEB7602B6BA0CAA18F539@BN3PR03MB2177.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aCANyWIREHUyMghugVu03Dq0T+xEktPUdrSmVeo/vRtfnnBAuFNdpY0u3v47vWvY98WIWYPaRcPV0BAPR+YgtbfckXqjLBUJabek2XTgzdtTcK/eybrx3euBNLlkLOKGk40Eg4mfPjJ3nGMO8udQcINwAMtxoLf7MLex2OvqQcTN4pOSE5ImgrRXbzArzZGHEG8wDTxxoDIDPiJOSNeSzZURGZNsQStxxjbtCSILXcFXHL+2/jfn88CNvoFXyw32I5qz86Yb6HyYvk8XFXMoY4xBV/7FrL/WePMIrZLNUNn9zXkpRnRTMXgRiRaQ3Et6cyyBeixbxHsMQHYl5gRfVckHphdqohs+hUbirim/3HnnNOCWiHCnXATM/a9wneHWJTkn9ku1nmA6pCJr4Qq9Tq5Jfba/wf9ssMG3fDgZ7X/+FPbmsiqFZa8ta8p7YskWBOLacY31NFdhB4M1OG9CuGpqr1j0wBw3RMTHiQPqf09sh15h4c71XY7u4arzo+Gn+/LXmksHynjh2S3huAv+6hCnRFSl/P6PWQiWCOZ+bfX8h7IQ/+4/U3tT5ZOcjKlKVrfkP/PR/ASGSEE1chxA2wOLsGIMkJycil43uXrxnu70gAP5PLZntH1OCJYjpusOHqYBcsF2iTEuBXZ8N5uWufHtVLrLI8ZM9ROYJ2U96wesrm5FbamoV9WRyebB/DCj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6512007)(316002)(8936002)(6916009)(38100700002)(33716001)(6506007)(86362001)(6486002)(26005)(186003)(9686003)(82960400001)(8676002)(2906002)(85182001)(83380400001)(5660300002)(508600001)(66476007)(66556008)(66946007)(6666004)(4326008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a25zU2dBd09CNml4amVZaTRoYVNmaFJsUmQ3YmkrMUZMM2d2VDM1QUZMZHUz?=
 =?utf-8?B?L0NwMzZ3Vkk5b3djT0ZQSlFnbUVlSEd2KzFocVg5M2hrRWdnZ3dTZWRmd2NZ?=
 =?utf-8?B?ckI0ZzJ0ekR4TjJWa3lQeGdNTVRDMWs3NHd2WFdSVlpnUHFPd2F5WWR6YVpH?=
 =?utf-8?B?bnMySmUyd2ZocFQ2MFByS090RTVJTmNSMS81MkMxTFpUQTluMmJJd0IyL29s?=
 =?utf-8?B?dEp3U2FlV08rSEQ2L21EZW51bE5lNmdYS1lYMkZBVnNkQ0ZLZ0JySUU0T3Az?=
 =?utf-8?B?a3NyL3R2QjF1Szg5N1NwRHRPNU50cFNVU29XMkIwZXZIZHAyNHFmaFZtaUEy?=
 =?utf-8?B?YlNhM3dZbkRaaS9YUEx1bVZBeUQ3dDhiaHpheFhyU25qTFdvSEQ4RStPZUR6?=
 =?utf-8?B?bTgwUmNDNklIQ0RrK3ZxUWJ2SDZkeUFBRjQ0aGx2NkRWOS85ZDl0Wlc3WHZq?=
 =?utf-8?B?cUdMb0RndEFkd2MxaHJrYTZoNXcxR2hOUmJuWmlnYlQxOFlBYnlNNDdhMzJz?=
 =?utf-8?B?VTdCemswM0FJMHAvaEtlUGhham5BWjFCRm1XckdrVFRLcGlYdjVXSmpJRU9Y?=
 =?utf-8?B?UHlYMFRkNDdSemFuMzYzYnZOSGdCWHJwY01qSnlTSjhGN2hwNnVULzIyazJB?=
 =?utf-8?B?dUJZZW1mZ055c2pkSGpuZlJtUXM4TThjL1lzbTBnYlhXQURPRDRhQU5kcXBs?=
 =?utf-8?B?Q3BHZmovWG5sd2xDZ08zWEd0UzRKZWdhWHlkMzV4WWZrU1pRNjczb2U3blpD?=
 =?utf-8?B?SVd1TEpUUXN4bHNyNlBrWkVoZWpGblArVGtPVHJENWg1MWQ0UmJIMExsalhk?=
 =?utf-8?B?bFU1SzhSZEtQTWxZUC9EZTNMYmR0MkhsUis3a1RYY1pmb0JZTzdLY0hTbzdS?=
 =?utf-8?B?UnlxOE8vK2s2c2lpSytYUUZibHlIN2kzZEhiOVVmSHFRUTdYY0M0ZmV5dWZp?=
 =?utf-8?B?VU5RTjBBSXFpNTlXZTVnd2RpRkxpVS9neVV5a2FSYnY1d05JL0dMdk5HVXdv?=
 =?utf-8?B?UFhtYzlLSWowY2J2OEtLYWJFR0tJMk5BSWt0NjAwKzJWdHpISjVxK1dCdnNT?=
 =?utf-8?B?MWVBSDNNdU13QmU3UUdrY1M3dStnSjJTMFBUZEpjYnFWQUt2WXdSUWt4QUxV?=
 =?utf-8?B?cWt1bHhJKyt1SllVYUFsUkhPaGFLZEM0SnYvZkJ0eEZJTWVZWUtMakZQRjhn?=
 =?utf-8?B?R0R1Rll1Tm1Db3FRdWNuSVFQZUNQSXUza3ArdGdBTXR3TzRFRGo3ZTR4UWI4?=
 =?utf-8?B?dnFrMmU4SVFXRmx0ZWtEcXhza2N2VDdJaWZHeEFGMFZsVzZIakFvZHhveC9X?=
 =?utf-8?B?UHQ3eFJ5SzVOOTBBUFgzVkdPam91K0Q0OUxWVUwxZmM0YWJWZnBHNmZmZ293?=
 =?utf-8?B?Z0FnVC9TdzVsTHVTSyszNDRibEhQbTNka0V2VzZzN1IwNHJJQTgxK0EySzhR?=
 =?utf-8?B?bGt5eFdPTFl2WmxIdUVtdTUxdVY0STYyNWg1S3I0RUpPOGJ6RW94RDBWZGRs?=
 =?utf-8?B?a0o1dWNIU0Z3UlBDaTVkeGxPbGVrNGJBbjRmUVRueFhWSUpiRUNBVjhESTF2?=
 =?utf-8?B?bEFob0g2ZlgvSE1UZ0N4L0JXQnhiTUcrTnZKMS9yMkpaR1lwczd3V1RwazY0?=
 =?utf-8?B?RTVFNTNFdzVpU2dUYnVoWm1oQnpWU3NQdW9pbjluQ1pFOWJuYWI5MWhWenUv?=
 =?utf-8?B?aHBycFhxaUtKY2NYMlJjMWtUT253c0lxbXpheW9DTllJZXEwR3ZYUW5uWTBX?=
 =?utf-8?B?SndpQ2lTaWNwcEgzUStLNy9DUkVqYVNPR2lNNThsNXFHY1dCZ05iYWlaSzdh?=
 =?utf-8?B?a3hPdXN2QmczaHo4R2VPV2tFL25Vb1Y3eEwvV3FkQ1N1Z1E0eE1kQi9nejRh?=
 =?utf-8?B?OVpNNEZPNFZTbzg0MDlPNVlRaWswdkc3Y1BIbDZXZzh0b3ZsenJwdHNXVVJH?=
 =?utf-8?B?SitWQy9wTDhKbDU4MStXNkQreVZ6aHVyRDNlN3JFb08xVDJRemlKTHlMSVJT?=
 =?utf-8?B?V1pZWklpWWU5ZkRZcThoNVRIcUx2UXhMd1JiYzU0S0draUk4V2UvTzF3ZjNw?=
 =?utf-8?B?ZC9PNTUwUGJwaWorN29RWmZjR2ZnVlRnZWcxSlVxcUhjMWYwaGUrNWdqZmNN?=
 =?utf-8?B?emlRZHhhbk55Rk85cldBTEJrTDNZd1drMmd4d2Y2VXZiL2xUTTdteGhGRkhu?=
 =?utf-8?Q?1LGNleEUsztKI70Dc2ou0Rk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b076ff-9235-4d09-bb40-08d9d6af51f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 16:11:13.4996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJU0xRhkJkZXywNaCVG9lKW8OY5xGZ8vitA2ObrLvCayp0VNXndC5RpizbDBCbBYUfcdtTWX+7Aet7UPsxSEkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2177
X-OriginatorOrg: citrix.com

On Thu, Jan 13, 2022 at 11:19:46AM +0000, James Dingwall wrote:
> Hi,
> 
> I have been trying to debug a problem where a vif with the backend in a 
> driver domain is added to dom0.  Intermittently the hotplug script is 
> not invoked by libxl (running as xl devd) in the driver domain.  By 
> enabling some debug for the driver domain kernel and libxl I have these 
> messages:
> 
> driver domain kernel (Ubuntu 5.4.0-92-generic):
> 
> [Thu Jan 13 01:39:31 2022] [1408] 564: vif vif-0-0 vif0.0: Successfully created xenvif
> [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed: /local/domain/0/device/vif/0 -> Initialising
> [Thu Jan 13 01:39:31 2022] [26] 470: xen_netback:backend_switch_state: backend/vif/0/0 -> InitWait
> [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed: /local/domain/0/device/vif/0 -> Connected
> [Thu Jan 13 01:39:31 2022] vif vif-0-0 vif0.0: Guest Rx ready
> [Thu Jan 13 01:39:31 2022] [26] 470: xen_netback:backend_switch_state: backend/vif/0/0 -> Connected
> 
> xl devd (Xen 4.14.3):
> 
> 2022-01-13 01:39:31 UTC libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528 wpath=/local/domain/2/backend token=3/0: event epath=/local/domain/2/backend/vif/0/0/state
> 2022-01-13 01:39:31 UTC libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac569700: nested ao, parent 0x5633ac567f90
> 2022-01-13 01:39:31 UTC libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180 wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event epath=/local/domain/2/backend/vif/0/0/state
> 2022-01-13 01:39:31 UTC libxl: debug: libxl_event.c:1055:devstate_callback: backend /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting state 4
> 2022-01-13 01:39:31 UTC libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528 wpath=/local/domain/2/backend token=3/0: event epath=/local/domain/2/backend/vif/0/0/state
> 2022-01-13 01:39:31 UTC libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac56a220: nested ao, parent 0x5633ac567f90
> 2022-01-13 01:39:31 UTC libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180 wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event epath=/local/domain/2/backend/vif/0/0/state
> 2022-01-13 01:39:31 UTC libxl: debug: libxl_event.c:1055:devstate_callback: backend /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting state 4
> 2022-01-13 01:39:51 UTC libxl: debug: libxl_aoutils.c:88:xswait_timeout_callback: backend /local/domain/2/backend/vif/0/0/state (hoping for state change to 2): xswait timeout (path=/local/domain/2/backend/vif/0/0/state)
> 2022-01-13 01:39:51 UTC libxl: debug: libxl_event.c:850:libxl__ev_xswatch_deregister: watch w=0x5633ac569180 wpath=/local/domain/2/backend/vif/0/0/state token=2/1: deregister slotnum=2
> 2022-01-13 01:39:51 UTC libxl: debug: libxl_event.c:1039:devstate_callback: backend /local/domain/2/backend/vif/0/0/state wanted state 2  timed out
> 2022-01-13 01:39:51 UTC libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch w=0x5633ac569180: deregister unregistered
> 2022-01-13 01:39:51 UTC libxl: debug: libxl_device.c:1092:device_backend_callback: calling device_backend_cleanup
> 2022-01-13 01:39:51 UTC libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch w=0x5633ac569180: deregister unregistered
> 2022-01-13 01:39:51 UTC libxl: error: libxl_device.c:1105:device_backend_callback: unable to add device with path /local/domain/2/backend/vif/0/0
> 2022-01-13 01:39:51 UTC libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch w=0x5633ac569280: deregister unregistered
> 2022-01-13 01:39:51 UTC libxl: debug: libxl_device.c:1470:device_complete: device /local/domain/2/backend/vif/0/0 add failed
> 2022-01-13 01:39:51 UTC libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0x5633ac568f30: destroy
> 
> the xenstore content for the backend:
> 
> # xenstore-ls /local/domain/2/backend/vif/0
> 0 = ""
>  frontend = "/local/domain/0/device/vif/0"
>  frontend-id = "0"
>  online = "1"
>  state = "4"
>  script = "/etc/xen/scripts/vif-zynstra"
>  vifname = "dom0.0"
>  mac = "00:16:3e:6c:de:82"
>  bridge = "cluster"
>  handle = "0"
>  type = "vif"
>  feature-sg = "1"
>  feature-gso-tcpv4 = "1"
>  feature-gso-tcpv6 = "1"
>  feature-ipv6-csum-offload = "1"
>  feature-rx-copy = "1"
>  feature-rx-flip = "0"
>  feature-multicast-control = "1"
>  feature-dynamic-multicast-control = "1"
>  feature-split-event-channels = "1"
>  multi-queue-max-queues = "2"
>  feature-ctrl-ring = "1"
>  hotplug-status = "connected"
> 
> My guess is that the libxl callback is started waiting for the backend 
> state key to be set to XenbusStateInitWait (2) but the frontend in dom0 
> has already triggered the backend to transition to XenbusStateConnected 
> (4) and therefore it does not successfully complete.

I think your analysis is correct. The question is who sets
hotplug-status to "connected" in xenstore if the hotplug script in the
driver domain hasn't been launched by `xl devd`.

It would seem to me some other entity is launching the hotplug
scripts, do you have some udev rules in the driver domain that do that
and race with `xl devd` maybe?

Regards, Roger.

