Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD724ADE21
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 17:18:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268463.462300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHTBu-0003dl-Pl; Tue, 08 Feb 2022 16:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268463.462300; Tue, 08 Feb 2022 16:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHTBu-0003bp-M0; Tue, 08 Feb 2022 16:18:06 +0000
Received: by outflank-mailman (input) for mailman id 268463;
 Tue, 08 Feb 2022 16:18:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHTBt-0003bi-0p
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 16:18:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af18f7e5-88fa-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 17:18:02 +0100 (CET)
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
X-Inumbo-ID: af18f7e5-88fa-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644337082;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8votztAyVj7o0zTJnE+AxFxCugKE6I2R5I4eZXfz8pc=;
  b=h32Ha76v3DoFE0Mz2gP0Yz3UCpbt3rZq32GCIkA0LU5m6EnrDKyRMFRJ
   z0T5YcHVF2miy73bldBIAKvVsKwNbldAZrtyUoYHDjXb4qfDFkR6As223
   QwqlREAszH4hJu3Z2dw/g7iAyZjmKPFILcGuCGTpjGnakYaQTQ6iCduSv
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oHZWCyIAX+LhQRofbA9GsPMWsDvQ05lLp/yDZtTX59tO6M0UuLQ0rPX1+DX1YWhoL0p/Pl5Sqb
 b0hcqkKUq+qqb+oUqWFdvTb5Nq0nkCOIOFQ1/YT2mFCeXELLrcAKJuuM0MlKDVI4SgZhBD+HtJ
 giwDnrWVBpGgvdmbxvV61CRnNBrAopYjgP2ul3PmNs33QOPCoYvDTQ+LUgv4Bu2aTzEXnXNi05
 V+/PK3XePhHdCIuBbw6JqXE12UnV+RN8bRpI5d41zH+07YyNGlhB8kCE2eMDYf+RmdpC7gfqnq
 cWjyrFDYl6WrA7UVTO8OnZSM
X-SBRS: 5.1
X-MesageID: 63752021
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YhTz+q5JoHthxxduzsRN+QxRtIDAchMFZxGqfqrLsTDasY5as4F+v
 mAXDDuFbqqJMDahc9wnb9/jpkNVvceAx9NmHlFk/H8wHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2t4w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 Y5TsLeoZR0QP7DDndYlcDNpTSZQFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxv25oWR6+2i
 8wxLiZBZ02dTzJzZFoYMJwVv8fygUnEbGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSd1D6E/3SEluLJ2yThV+o6Krq88fJ7hUyJ8UYaAhYWSFiTrOGwjwi1XNc3A
 0Ad5CcGt6U5802vCN7nUHWQv3qsrhMaHd1KHIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRturCITXOW9p+PsCi/fyMSKAcqZyAeShAey8L+u4x1hRXKJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2mpk7CqCqAvKHIUwEw1D30dFP76S1QMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFpib7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2OBjatSsIoHONiwM2JTRTBt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGcyink3+j+vEPSX9pVI53LymNLFR0U95iF+Nr
 4Y32zWil32zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClEOJY3VMNeImelJU9U8x8x9z76Ul
 lngCh4w4Aeu3hXvdFTVAlg9M+mHdcgk8hoG0dkEYA/AN44LOt30ss/ytvIfINEayQCU5aQsE
 KBeJp7QW68np/au0211UKQRZbdKLXyDrQmPIzCkcH44eZthTBbO4djqYk3k8yxmM8Z9nZBWT
 2SI2lyJTJwdaR5lCcqKOvujw0no5SoWmf5oXluOKd5WIR2+/I9vIi33r/k2P8BTdkmTmmrEj
 16bUUUCuO3Ag44p692V16qKmJikTrllFU1AEmiFsbvvbXvG/nCuyJNrWfqTeWyPT3v9/aivP
 L0Hz/z1PPAdskxNto5wT+Riwa4kvoO9rL5G1AV0Wn7Mag3zWL9nJ3CH2+hJt7FMmeAF6VfnB
 BrX94ADa7uTOc7jHFoAHyYfb7yOhaMOhz3fzfUpO0GmtiV5y6WKDBdJNB6WhS0DcLYsaNE5w
 f0ssdI94hCkjkZ4Kc6Piy1Z+jjeLnEEVKl75JgWDJWy11guw1BGJ5fdFjX38NeEbNAVahsmJ
 TqdhazjgbVAxxWdLypvRCaVhecN144TvB1qzUMZIwXbk9XIsfY7wRlN/GllVQ9S1BhGj7p+N
 2UD25eZ/klSE+OEXPR+Yl0=
IronPort-HdrOrdr: A9a23:C6daea3ZvYcLe0Q/bcItAQqjBTRyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHO1OkPMs1NaZLUPbUQ6TQL2KgrGSpAEIdxeeygcZ79
 YZT0EcMqy8MbEZt7ed3ODQKb9Jr7e6GeKT9J7jJhxWPGNXgtRbnmNE43GgYyhLrWd9ZaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njAsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqu9jIDPr3MtiEmEESutu+aXvUiZ1REhkFxnAib0idrrD
 ALmWZlAy080QKXQoj/m2qR5+Cp6kdT15al8y7VvZKrm72HeBsqT8VGno5XaR3f9g4pu8x9yr
 tC2yaDu4NQFg6oplW12zHkbWAcqqOPmwtVrQfTtQ0tbaIOLLtK6YAP9kJcF5kNWCr89YA8Ce
 FrSMXR/uxff1+WZ23Q+jAH+q3mYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdq5oiLZNRMkLar8VPpZIfeKnTmjWBR7cOmObJlrqUKkBJnLWspbypK444em7EaZ4uKfaWK
 6xJW+wmVRCCn4GOPf+rqGjqCq9PllVdQ6duv1j2w==
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="63752021"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEpl2kgPMAQ5ODMRr/LUGhgY44kS5merkG2ToZNq8VwY2T8k0WzJN3rOgPix1FR5HiUcICbmPPmPwJ/91wHV8tYIcFJXi28BXjc7DSd6dD/3V3mvMAJGx8lpHwC4eh4heVqqa77Jf7FZjG8Gcq7D8j8uHVSgcbW1Wl6xnjeyFjSpHhuppN/sI0obsvqcWJdHRssNeA6Ym3N18Oa/LyIlwYdp9SVZlkFkrCqlHSFyFytwUabRlIUKQlWa8/JvDctb9dhvxDynv2TeE4hsZHiHb5fDYEUiUbGZiP5yG4rHCNcO6y/ycS8XCcnhZBtfl/LY3+/xWvV328WOk7tfOmbWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhTbDkT/Te2OmrXv6b10gX9Ad9ETCpHTKSAst5QPMU8=;
 b=EyRARxcBi33bKba0amzI8v0S6wE7kDnA3xgwFy3QDv2o0pbx/DCu8Qbn+yV1JpRzol7be76A/ABB6YNNEk22UHcx2xNP3UnQ6z4vv46mjnNrN+L0J8bEo02UYw6/GRVbwRxpSVc78ivA1EGnKMMkTqXuK/RD8v5BzaMptGpwLVAiAWPXreue+WV0YOWdd2Cpu7XqWZgihDc9ffKrafEKpz6ulITua+ADnh/RdzzVXnpCoYon2ytvKXhS+bnsXeQJCQi3eAM4WcwTXAWn90FdgE1W6QWtxaLOSgDMkHWD3y6H2ch7jcX0FBu1Bm6enjLhPOE8wagBtGJjot0tgFv8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhTbDkT/Te2OmrXv6b10gX9Ad9ETCpHTKSAst5QPMU8=;
 b=aGE6wXjCW9ZcpVkWJ7nvcJhgICXu4sXGAkXcRw4uvmcTsc35RXFcNCkC/jm4CQYb5u8QnVOqY+kkTGjMCBqhW+got+7obBgfB642TcfV30lBjFSG40kPVo7QzKA+dcpjaVwmtkawDfyjpC4tOsL+JVH/3Y3DYuCkKerH9RlG6PE=
Date: Tue, 8 Feb 2022 17:17:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YgKXrZ/U2XuECG3d@Air-de-Roger>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220207182101.31941-3-jane.malalane@citrix.com>
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82236c18-a600-465d-dcbc-08d9eb1e8f0f
X-MS-TrafficTypeDiagnostic: BN6PR03MB2548:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2548EFE3C029FAFDAC3EC71F8F2D9@BN6PR03MB2548.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDMiEoQzRTDyMYCzeDFhqJ3atJj2iOYkdB/ebI1NALWFRVd3Fw7VCqBfKbwRMwE2H+7MAwlg9beY9pXV2P2VCVItqeROnyo4jIDCGwZIdQcMWYeyNWukTBDSaKNGixsJpfaT3K5M8bc/x+Qlb48O1ODQA0CVaJcQTfbpobA2z+OkCHFdWFl1rF0dVsUE2QLbmrJ1/We8VqUkZrZYv15jYi2yry5Szv3bGwSctKLNmF7Z9eNaDJTD6Pu16udguFABTVe0FYN8ingH3N1Zmc827wnqILas9AaIfHQ6RqlMh7uQLHP5krtpvr7th1ppbQplRZiwcGZTerbFWanqg8XSM3FMBYZ92lxYyGQOj4fqWIkGbGGCwhxxPelYMQCpvmOOoqH2EUWNirJCNy6hwPrZV+jrxAvb7SVmK1uX6SREMb8J60y3ceaCy2HJBdHKwoYvNAFbcl1hBVAoTG2lgvxvGNu5LH8Lf7CRy3TqvTyd7gqMy8U5mj/GwUp96bNdX0YDKS+08zvdbGK0WwUFR4gSA0SBKY/3f9vbEAFPnZ6N86NqdiDdYr61tcArp5QJ1sKxnNtVh0dy7vy35/D/p+jf+wCkvwIo09lCkOubWEG15p4ryEsWQw6Xt8vYqZxJDyLCoQJa25Rb9MpVTWE4gWgXdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(38100700002)(6486002)(30864003)(85182001)(33716001)(54906003)(82960400001)(8936002)(9686003)(8676002)(5660300002)(316002)(186003)(6862004)(6512007)(26005)(6506007)(2906002)(66476007)(83380400001)(66946007)(86362001)(66556008)(4326008)(6666004)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d01rd3Fzc21iWXliZm1kY1FZb3c2cjN6ZmdSZEwraFFoM0I2T1cwbXBiMkIz?=
 =?utf-8?B?aU5JcHJ4V096SjB4WFFxeVpwUHJtMk5sVHg0b0Q1TmtRNFdHTUllSWRndHVM?=
 =?utf-8?B?YUx3UTJwREZQMHZoYkxZZ3FrREpvYzFnR1g4SjhaQkRlQTJqQW9qM3loc25P?=
 =?utf-8?B?THVuS2trRkhIR1M4eXJMek52UTd1VjAvNVA2VUdFcFJQMzZYc3h6SncyaHlt?=
 =?utf-8?B?T0xxVjdFY0ZvQks3My9HQzVKNUVUVDFtcmpybUE0WHE4WHRLTGc0QjFNU2xR?=
 =?utf-8?B?Z1RTbTBRZWpzdXdxNk0zR2ZEZHZHNUpETitUUHJNeWxMSzJWa0xmR25raVU1?=
 =?utf-8?B?T3gwbjRyYXp0a2drOSt5QVpxcHpHNkVqUzdaUGJJWU1OLzF4MGRtZTZ5aUxo?=
 =?utf-8?B?NUFacGZtdXBFUE1SajZ3SE9hQzJiUHdHRkdHQStPR0FjZnhBNXI0bE1FYVND?=
 =?utf-8?B?VWMwK2o1T2IyaXJySW9ab3NvLzRlTUIwVXNqeTNDcTZsVWhoWWhieXlvd0Z3?=
 =?utf-8?B?Z2oxQXFqSWRia1R3SUw5WldrbmRNSkcrZ2ZLRW5SL01CWElJRHU5Ym1sNW9Z?=
 =?utf-8?B?WW04M3AwM2ZBbHoydm41anBKY2NGTmNxR0dRdSs3aU5pZVZYMDZTNWVnSVVG?=
 =?utf-8?B?WHQybkpTVjNpRU9HcjR4d0FFdlFlbUxUb0RWb2gzWmt3V1gzUXpFLyt3T0V5?=
 =?utf-8?B?Wnl5THVDRDBaMU1sbHVIcW5ZRTBCdGl3MDhZaUlFQ1RaVHJRNHphTzAxTUg1?=
 =?utf-8?B?UHVPNFgra3c2YVMyL0tqTlNuOXZuT2lrQ2g2RUx4OEhjakp5cER0RE81YmdF?=
 =?utf-8?B?bExQVnpCZzVJMTRiNi9NU2g3Skk2WkE2cVFuakRHbHNjYlo1aFU0ajFESlR5?=
 =?utf-8?B?TlZKcy9TRlhUTzNxeFk0NGZTYlZRK28yZVlJR2tDbWVVZ1Njc3hja3dNbU5H?=
 =?utf-8?B?QWdiemJQaW8yU1QySVpvOWxicElsY1hwU01SRWhnZ0VRODFFczNFQ1R4T0lk?=
 =?utf-8?B?REVjSjgzNjVZaW5vdmU5ek1xS1F1MEQxK25uNW14OTU2TDRvWlNwWDJ5TVVU?=
 =?utf-8?B?Q1ZDZ01vVzBPSlh0eXY4RDhqNU9mQmQyMHpsbGtteE9wOFdHUWd1UTREVzVT?=
 =?utf-8?B?VEp5UTNpMkt4bnB4L01qdFR3UGtPSi9qNG5JSG1BbDMrdWtXUnhpZmdzNXEv?=
 =?utf-8?B?VzlLVFVYSHhNZVY4UmppaFZtNkphVkgyMEZ2Mjl4SEphRVVsZHdoL25qNUdl?=
 =?utf-8?B?Z3VRdjN5OUlSOEpLc2Fzc2d3cVF4NWhGOGR4OG11Y0xMbUpidWpsRDZkalk5?=
 =?utf-8?B?YkVJYmdRcXRpK1gxYUdqclQ0N3ZiWGFtZjhKTFNJMFpTS29ocC80QXlrcVBG?=
 =?utf-8?B?UTFlYmdBWlI5U0hzTVY2N1lscDhPSTk2US95K3drUTZ4MXNaallFWitpQ0pt?=
 =?utf-8?B?akhlQVVTMkQ3VjdKRExCRllIaTBNRVFsWkFDbFRoMjRwSUhZdW40SDdmKzNl?=
 =?utf-8?B?NWtJcFMrUlpNVUdwZEljcFI3UzRtYVdncnZ2Z3NlT1U3UFFMYm5VVXlTVUI0?=
 =?utf-8?B?VnY4dkpBbU5tbWNEVENkLzR0U3NtTENsT0JXalNzSjhWaXNFdVpFMTBDLzY0?=
 =?utf-8?B?TnpSRGRTb3g2R1pDMEFXczN4U05ISk1WazVyQlFKdHUwWWxnR3FaV1I0bjBy?=
 =?utf-8?B?aFlmWEhuT1VRNVFiUEF0Qkp0UjFFUlRPODJxZFovZnNHeXdxdmFLd2gxTXhJ?=
 =?utf-8?B?Y0tLNFlpK0w4dnVpbkJCZHZERk1TblYvKzhnZzIzR3djYTBHZXpTSmduVGNa?=
 =?utf-8?B?UWNWVWN4L1Q4WGNUVnZQVGhPUWFiUmlYajFOOXdUenpMTjZsWTZBN0RpOTUv?=
 =?utf-8?B?UGZxS0lPaURLdlQrSjFkTTNtaUVJTnMwVDZaMFFvbnUwM2JWNlFmUDJPeWMy?=
 =?utf-8?B?Z1lmVzdNQnhJTjdneDJPZkhOM2gvUDdxR01nSE81aEduek1ZdFJ0dUNsN1lY?=
 =?utf-8?B?RHdTUFg0Mm1SNEhVSWtpeVpVS2Q5U2xURHRhalZJZHNXb29GUVgzMS9TOFUz?=
 =?utf-8?B?K1IyVmZNZWVPcWtPSDJjc21SS0JhOHNoRFZpcFVLWlRSODQreFBUaU54R2dJ?=
 =?utf-8?B?SER4Z3JCRjJJanhwTTczZ21VNGMybEZaK2VnM0I1SjdFOFoxTjltZWFtNWpC?=
 =?utf-8?Q?yxNBAvAL9yMt0NMSrUe9yIM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82236c18-a600-465d-dcbc-08d9eb1e8f0f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 16:17:53.4956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sg8xCkPkqce83ksrfqDJLnumFUBiZJLU8p/RqXeYhaRIwmUgpUXHodKXfJJPq5/3HTmuGaSQWvaKRk0uN36Qzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2548
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 06:21:01PM +0000, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted vitualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by running APIC
> read/write accesses without taking a VM exit.
> 
> Being able to disable x{2}APIC hardware assisted vitualization can be
> useful for testing and debugging purposes.

I think you have agreed with Jan some changes to the description
regarding the purpose of the commit.

> 
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> v2:
>  * Add a LIBXL_HAVE_ASSISTED_APIC macro
>  * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
>  * Add a return statement in now "int"
>    libxl__arch_domain_build_info_setdefault
>  * Preserve libxl__arch_domain_build_info_setdefault 's location in
>    libxl_create.c
>  * Correct x{2}apic default setting logic in
>    libxl__arch_domain_prepare_config
>  * Correct logic for parsing assisted_x{2}apic host/guest options in
>    xl_parse.c and initialize them to -1 in xl.c
>  * Use guest options directly in vmx_vlapic_msr_changed
>  * Fix indentation of bool assisted_x{2}apic in struct hvm_domain
>  * Add a change in xenctrl_stubs.c to pass xenctrl ABI checks
> ---
>  docs/man/xl.cfg.5.pod.in              | 10 ++++++++++
>  docs/man/xl.conf.5.pod.in             | 12 ++++++++++++
>  tools/golang/xenlight/helpers.gen.go  | 12 ++++++++++++
>  tools/include/libxl.h                 |  7 +++++++
>  tools/libs/light/libxl_arch.h         |  5 +++--
>  tools/libs/light/libxl_arm.c          |  7 +++++--
>  tools/libs/light/libxl_create.c       | 23 ++++++++++++++---------
>  tools/libs/light/libxl_types.idl      |  2 ++
>  tools/libs/light/libxl_x86.c          | 31 +++++++++++++++++++++++++++++--
>  tools/ocaml/libs/xc/xenctrl.ml        |  2 ++
>  tools/ocaml/libs/xc/xenctrl.mli       |  2 ++
>  tools/ocaml/libs/xc/xenctrl_stubs.c   |  2 +-
>  tools/xl/xl.c                         |  8 ++++++++
>  tools/xl/xl.h                         |  2 ++
>  tools/xl/xl_parse.c                   | 16 ++++++++++++++++
>  xen/arch/x86/domain.c                 | 28 +++++++++++++++++++++++++++-
>  xen/arch/x86/hvm/vmx/vmcs.c           |  4 ++++
>  xen/arch/x86/hvm/vmx/vmx.c            | 14 +++++---------
>  xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
>  xen/arch/x86/traps.c                  |  8 ++++----
>  xen/include/public/arch-x86/xen.h     |  2 ++
>  21 files changed, 173 insertions(+), 30 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b98d161398..1d98bbd182 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1862,6 +1862,16 @@ firmware tables when using certain older guest Operating
>  Systems. These tables have been superseded by newer constructs within
>  the ACPI tables.
>  
> +=item B<assisted_xAPIC=BOOLEAN>
> +B<(x86 only)> Enables or disables hardware assisted virtualization for xapic.
> +This allows accessing APIC registers without a VM-exit.
> +The default is settable via L<xl.conf(5)>.
> +
> +=item B<assisted_x2APIC=BOOLEAN>
> +B<(x86 only)> Enables or disables hardware assisted virtualization for x2apic.
> +This allows accessing APIC registers without a VM-exit.
> +The default is settable via L<xl.conf(5)>.
> +
>  =item B<nx=BOOLEAN>
>  
>  B<(x86 only)> Hides or exposes the No-eXecute capability. This allows a guest
> diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
> index df20c08137..30993827e5 100644
> --- a/docs/man/xl.conf.5.pod.in
> +++ b/docs/man/xl.conf.5.pod.in
> @@ -107,6 +107,18 @@ Sets the default value for the C<max_grant_version> domain config value.
>  
>  Default: maximum grant version supported by the hypervisor.
>  
> +=item B<assisted_xAPIC=BOOLEAN>
> +
> +If enabled, domains will use xAPIC hardware assisted virtualization by default.
> +
> +Default: enabled if supported.
> +
> +=item B<assisted_x2APIC=BOOLEAN>
> +
> +If enabled, domains will use x2APIC hardware assisted virtualization by default.
> +
> +Default: enabled if supported.

We don't capitalize xl options, so I would suggest to lowercase APIC
for all the option names.

> +
>  =item B<vif.default.script="PATH">
>  
>  Configures the default hotplug script used by virtual network devices.
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index dd4e6c9f14..90e7b9b205 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -636,6 +636,12 @@ x.Passthrough = Passthrough(xc.passthrough)
>  if err := x.XendSuspendEvtchnCompat.fromC(&xc.xend_suspend_evtchn_compat);err != nil {
>  return fmt.Errorf("converting field XendSuspendEvtchnCompat: %v", err)
>  }
> +if err := x.ArchX86.AssistedXapic.fromC(&xc.arch_x86.assisted_xapic);err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
> +}
> +if err := x.ArchX86.AssistedX2Apic.fromC(&xc.arch_x86.assisted_x2apic);err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
> +}
>  
>   return nil}
>  
> @@ -679,6 +685,12 @@ xc.passthrough = C.libxl_passthrough(x.Passthrough)
>  if err := x.XendSuspendEvtchnCompat.toC(&xc.xend_suspend_evtchn_compat); err != nil {
>  return fmt.Errorf("converting field XendSuspendEvtchnCompat: %v", err)
>  }
> +if err := x.ArchX86.AssistedXapic.toC(&xc.arch_x86.assisted_xapic); err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
> +}
> +if err := x.ArchX86.AssistedX2Apic.toC(&xc.arch_x86.assisted_x2apic); err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
> +}
>  
>   return nil
>   }
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 924e142628..83944c17ae 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -535,6 +535,13 @@
>  #define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
>  
>  /*
> + * LIBXL_HAVE_ASSISTED_APIC indicates that libxl_domain_build_info has
> + * assisted_x{2}apic fields, for enabling hardware assisted virtualization for
> + * x{2}apic per domain.
> + */
> +#define LIBXL_HAVE_ASSISTED_APIC 1
> +
> +/*
>   * libxl ABI compatibility
>   *
>   * The only guarantee which libxl makes regarding ABI compatibility
> diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
> index 207ceac6a1..03b89929e6 100644
> --- a/tools/libs/light/libxl_arch.h
> +++ b/tools/libs/light/libxl_arch.h
> @@ -71,8 +71,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>                                                 libxl_domain_create_info *c_info);
>  
>  _hidden
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info);
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo);
>  
>  _hidden
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 39fdca1b49..ba5b8f433f 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1384,8 +1384,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>      }
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
>      /* ACPI is disabled by default */
>      libxl_defbool_setdefault(&b_info->acpi, false);
> @@ -1399,6 +1400,8 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>      memset(&b_info->u, '\0', sizeof(b_info->u));
>      b_info->type = LIBXL_DOMAIN_TYPE_INVALID;
>      libxl_domain_build_info_init_type(b_info, LIBXL_DOMAIN_TYPE_PVH);
> +
> +    return 0;
>  }
>  
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index d7a40d7550..843e523df9 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -264,7 +264,20 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>      if (!b_info->event_channels)
>          b_info->event_channels = 1023;
>  
> -    libxl__arch_domain_build_info_setdefault(gc, b_info);
> +    libxl_physinfo info;

The definition of info needs to be at the top of the function,
together with the rest of the variable definitions.

> +
> +    rc = libxl_get_physinfo(CTX, &info);
> +    if (rc) {
> +        LOG(ERROR, "failed to get hypervisor info");
> +        return rc;
> +    }
> +
> +    rc = libxl__arch_domain_build_info_setdefault(gc, b_info, &info);
> +    if (rc) {
> +        LOG(ERROR, "unable to set domain arch build info defaults");
> +        return rc;
> +    }
> +
>      libxl_defbool_setdefault(&b_info->dm_restrict, false);
>  
>      if (b_info->iommu_memkb == LIBXL_MEMKB_DEFAULT)
> @@ -457,14 +470,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>      }
>  
>      if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
> -        libxl_physinfo info;
> -
> -        rc = libxl_get_physinfo(CTX, &info);
> -        if (rc) {
> -            LOG(ERROR, "failed to get hypervisor info");
> -            return rc;
> -        }
> -
>          if (info.cap_gnttab_v2)
>              b_info->max_grant_version = 2;
>          else if (info.cap_gnttab_v1)
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 42ac6c357b..db5eb0a0b3 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -648,6 +648,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>                                 ("vuart", libxl_vuart_type),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> +                               ("assisted_xapic", libxl_defbool),
> +                               ("assisted_x2apic", libxl_defbool),
>                                ])),
>      # Alternate p2m is not bound to any architecture or guest type, as it is
>      # supported by x86 HVM and ARM support is planned.
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index e0a06ecfe3..f0fa0ceea2 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -23,6 +23,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
>          config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
>  
> +    if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV)
> +    {

Coding style for libxl is to place the bracket in the same line as the
if.

> +        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_xapic))
> +            config->arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
> +
> +        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_x2apic))
> +            config->arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
> +    }
>      return 0;
>  }
>  
> @@ -819,11 +827,30 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>  {
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
>      libxl_defbool_setdefault(&b_info->acpi, true);
>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +
> +    if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
> +    {
> +        libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
> +                             physinfo->cap_assisted_xapic);
> +        libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
> +                             physinfo->cap_assisted_x2apic);
> +    }
> +
> +    if (b_info->type == LIBXL_DOMAIN_TYPE_PV &&
> +        (!libxl_defbool_is_default(b_info->arch_x86.assisted_xapic) ||
> +         !libxl_defbool_is_default(b_info->arch_x86.assisted_x2apic)))

You could just do:

    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
        libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
                             physinfo->cap_assisted_xapic);
        libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
                             physinfo->cap_assisted_x2apic);
    } else if (!libxl_defbool_is_default(b_info->arch_x86.assisted_xapic) ||
               !libxl_defbool_is_default(b_info->arch_x86.assisted_x2apic))
        /* ERROR */

> +    {
> +        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
> +        return ERROR_INVAL;
> +    }
> +
> +    return 0;
>  }
>  
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 7ce832d605..cce30d8731 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -50,6 +50,8 @@ type x86_arch_emulation_flags =
>  
>  type x86_arch_misc_flags =
>  	| X86_MSR_RELAXED
> +	| X86_ASSISTED_XAPIC
> +	| X86_ASSISTED_X2APIC
>  
>  type xen_x86_arch_domainconfig =
>  {
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index a2b15130ee..67a22ec15c 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -44,6 +44,8 @@ type x86_arch_emulation_flags =
>  
>  type x86_arch_misc_flags =
>    | X86_MSR_RELAXED
> +  | X86_ASSISTED_XAPIC
> +  | X86_ASSISTED_X2APIC
>  
>  type xen_x86_arch_domainconfig = {
>    emulation_flags: x86_arch_emulation_flags list;
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index 5b4fe72c8d..0aa957d379 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -239,7 +239,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
>  
>  		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
>  			/* ! x86_arch_misc_flags X86_ none */
> -			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
> +			/* ! XEN_X86_ XEN_X86_ASSISTED_X2APIC max */

We would usually define an XEN_X86_MISC_MAX that would point to
XEN_X86_ASSISTED_X2APIC currently.

>  			(VAL_MISC_FLAGS);
>  
>  #undef VAL_MISC_FLAGS
> diff --git a/tools/xl/xl.c b/tools/xl/xl.c
> index 2d1ec18ea3..31eb223309 100644
> --- a/tools/xl/xl.c
> +++ b/tools/xl/xl.c
> @@ -57,6 +57,8 @@ int max_grant_frames = -1;
>  int max_maptrack_frames = -1;
>  int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
>  libxl_domid domid_policy = INVALID_DOMID;
> +int assisted_xapic = -1;
> +int assisted_x2apic = -1;
>  
>  xentoollog_level minmsglevel = minmsglevel_default;
>  
> @@ -201,6 +203,12 @@ static void parse_global_config(const char *configfile,
>      if (!xlu_cfg_get_long (config, "claim_mode", &l, 0))
>          claim_mode = l;
>  
> +    if (!xlu_cfg_get_long (config, "assisted_xapic", &l, 0))
> +        assisted_xapic = l;
> +
> +    if (!xlu_cfg_get_long (config, "assisted_x2apic", &l, 0))
> +        assisted_x2apic = l;
> +
>      xlu_cfg_replace_string (config, "remus.default.netbufscript",
>          &default_remus_netbufscript, 0);
>      xlu_cfg_replace_string (config, "colo.default.proxyscript",
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index c5c4bedbdd..528deb3feb 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -286,6 +286,8 @@ extern libxl_bitmap global_vm_affinity_mask;
>  extern libxl_bitmap global_hvm_affinity_mask;
>  extern libxl_bitmap global_pv_affinity_mask;
>  extern libxl_domid domid_policy;
> +extern int assisted_xapic;
> +extern int assisted_x2apic;
>  
>  enum output_format {
>      OUTPUT_FORMAT_JSON,
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 117fcdcb2b..0ab9b145fe 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1681,6 +1681,22 @@ void parse_config_data(const char *config_source,
>          xlu_cfg_get_defbool(config, "vpt_align", &b_info->u.hvm.vpt_align, 0);
>          xlu_cfg_get_defbool(config, "apic", &b_info->apic, 0);
>  
> +        e = xlu_cfg_get_long(config, "assisted_xapic", &l , 0);
> +        if ((e == ESRCH && assisted_xapic != -1)) /* use global default if present */
               ^ no need for the extra parentheses here and below.

> +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
> +        else if (!e)
> +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, l);
> +        else
> +            exit(1);
> +
> +        e = xlu_cfg_get_long(config, "assisted_x2apic", &l, 0);
> +        if ((e == ESRCH && assisted_x2apic != -1)) /* use global default if present */
> +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, assisted_x2apic);
> +        else if (!e)
> +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, l);
> +        else
> +            exit(1);
> +
>          switch (xlu_cfg_get_list(config, "viridian",
>                                   &viridian, &num_viridian, 1))
>          {
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index ef1812dc14..9033a0e181 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -619,6 +619,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
>      bool hap = config->flags & XEN_DOMCTL_CDF_hap;
>      bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
> +    bool assisted_xapic = config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
> +    bool assisted_x2apic = config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
>      unsigned int max_vcpus;
>  
>      if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
> @@ -685,13 +687,31 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          }
>      }
>  
> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
> +                                     XEN_X86_ASSISTED_XAPIC |
> +                                     XEN_X86_ASSISTED_X2APIC) )
>      {
>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>                  config->arch.misc_flags);
>          return -EINVAL;
>      }
>  
> +    if ( (assisted_xapic || assisted_x2apic) && !hvm )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Interrupt Controller Virtualization not supported for PV\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( (assisted_xapic && !assisted_xapic_available) ||
> +         (assisted_x2apic && !assisted_x2apic_available) )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Hardware assisted x%sAPIC requested but not available\n",
> +                assisted_xapic && !assisted_xapic_available ? "" : "2");
> +        return -EINVAL;
> +    }
> +
>      return 0;
>  }
>  
> @@ -863,6 +883,12 @@ int arch_domain_create(struct domain *d,
>  
>      d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
>  
> +    d->arch.hvm.assisted_xapic =
> +        config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
> +
> +    d->arch.hvm.assisted_x2apic =
> +        config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
> +
>      return 0;
>  
>   fail:
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 4060aef1bd..614db5c4a4 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -1157,6 +1157,10 @@ static int construct_vmcs(struct vcpu *v)
>          __vmwrite(PLE_WINDOW, ple_window);
>      }
>  
> +    if ( !v->domain->arch.hvm.assisted_xapic )
> +        v->arch.hvm.vmx.secondary_exec_control &=
> +            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
> +
>      if ( cpu_has_vmx_secondary_exec_control )
>          __vmwrite(SECONDARY_VM_EXEC_CONTROL,
>                    v->arch.hvm.vmx.secondary_exec_control);
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 36c8a12cfe..3c9ff60154 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3333,16 +3333,11 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
>  
>  void vmx_vlapic_msr_changed(struct vcpu *v)
>  {
> -    int virtualize_x2apic_mode;
>      struct vlapic *vlapic = vcpu_vlapic(v);
>      unsigned int msr;
>  
> -    virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
> -                                cpu_has_vmx_virtual_intr_delivery) &&
> -                               cpu_has_vmx_virtualize_x2apic_mode );
> -
> -    if ( !cpu_has_vmx_virtualize_apic_accesses &&
> -         !virtualize_x2apic_mode )
> +    if ( ! v->domain->arch.hvm.assisted_xapic &&
> +         ! v->domain->arch.hvm.assisted_x2apic )
             ^ extra space.
>          return;
>  
>      vmx_vmcs_enter(v);
> @@ -3352,7 +3347,8 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
>      if ( !vlapic_hw_disabled(vlapic) &&
>           (vlapic_base_address(vlapic) == APIC_DEFAULT_PHYS_BASE) )
>      {
> -        if ( virtualize_x2apic_mode && vlapic_x2apic_mode(vlapic) )
> +        if ( v->domain->arch.hvm.assisted_x2apic
> +             && vlapic_x2apic_mode(vlapic) )
>          {
>              v->arch.hvm.vmx.secondary_exec_control |=
>                  SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
> @@ -3373,7 +3369,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
>                  vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
>              }
>          }
> -        else
> +        else if ( v->domain->arch.hvm.assisted_xapic )
>              v->arch.hvm.vmx.secondary_exec_control |=
>                  SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
>      }
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> index 698455444e..92bf53483c 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -117,6 +117,12 @@ struct hvm_domain {
>  
>      bool                   is_s3_suspended;
>  
> +    /* xAPIC hardware assisted virtualization. */
> +    bool                   assisted_xapic;
> +
> +    /* x2APIC hardware assisted virtualization. */
> +    bool                   assisted_x2apic;
> +
>      /* hypervisor intercepted msix table */
>      struct list_head       msixtbl_list;
>  
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 485bd66971..33694acc99 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1115,7 +1115,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>          if ( !is_hvm_domain(d) || subleaf != 0 )
>              break;
>  
> -        if ( cpu_has_vmx_apic_reg_virt )
> +        if ( cpu_has_vmx_apic_reg_virt &&

You can drop the cpu_has_vmx_apic_reg_virt check here, if
cpu_has_vmx_apic_reg_virt is false assisted_xapic won't be set to true.

> +             v->domain->arch.hvm.assisted_xapic )
>              res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
>  
>          /*
> @@ -1124,9 +1125,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>           * and wrmsr in the guest will run without VMEXITs (see
>           * vmx_vlapic_msr_changed()).
>           */
> -        if ( cpu_has_vmx_virtualize_x2apic_mode &&
> -             cpu_has_vmx_apic_reg_virt &&
> -             cpu_has_vmx_virtual_intr_delivery )
> +        if ( (cpu_has_vmx_apic_reg_virt && cpu_has_vmx_virtual_intr_delivery) &&
                ^ unneeded parentheses

Thanks, Roger.

