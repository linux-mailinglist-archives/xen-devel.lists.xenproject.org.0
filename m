Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C78442BA76
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 10:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208081.364107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZfG-0001cA-J5; Wed, 13 Oct 2021 08:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208081.364107; Wed, 13 Oct 2021 08:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZfG-0001YS-Fd; Wed, 13 Oct 2021 08:31:06 +0000
Received: by outflank-mailman (input) for mailman id 208081;
 Wed, 13 Oct 2021 08:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1maZfF-0001YK-FO
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 08:31:05 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82b9d2ed-76e2-4c19-8269-c402b462519b;
 Wed, 13 Oct 2021 08:31:02 +0000 (UTC)
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
X-Inumbo-ID: 82b9d2ed-76e2-4c19-8269-c402b462519b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634113862;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WFE4KQXhonEdwZ7JWnQcSz+WrCK/8dKZUzv3EMOJXqM=;
  b=PpfkuAAxk36GsXGdwuM0J0IILAEdpBV+KKNcqwVH+yvDBkdXUrM5ODxi
   If1aWpSAmLeeQeJEq1SyqXdKoFHfYA6Z72kDE/ulx49G2lMX2azapStta
   VCfYN78MxRTuA2M5zvMggMTigJ2WlOTv0F0gArHBn17HJ39Sq+JgxGOp6
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +v8hkxJdSeLGfaT50oqAtD3/F4HOhAnemFSvPZN3hBmN512ztjungcSRFwyi5waIZrGee4eVPF
 H8EnB9p2A+K7fhlOWplcI0ATcLMiTtswN7TrmtZmn0VcG8fUVW5/FTwL9BGw1DHcAKeU1ASMPf
 AkNV+rmgdnqsmF5Tz8HlW1+nTQrroK+cCkHeKNvk/NvhkXi1a6SASkjqMeBRvJ1/Jqf3wqK/Mg
 9ddebB/ScO6A4oIz+3cB3RyMUKxWR3VjNQJPuviW+/DG6BVF3jQbvEfnAoj6UDjbWGoGAu0ohO
 DXHu+zVUUGDawWPd6Wt3Qas3
X-SBRS: 5.1
X-MesageID: 55465959
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AY/fe6JYaNp3NUOcFE+R8JMlxSXFcZb7ZxGr2PjKsXjdYENS3zUGz
 WIbDTzQPK6PYjH8L98lb4zjpEpQuZbUm4AyGQtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo6wLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2KhMt34
 fZSnqWJUF90MfHFs+BHWhlHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XuIMGgWZt16iiG979e
 vgjRx1eYy3wTAV3BnkPI5csvOW30yyXnzpw9wvO+PtfD3Lo5A573aXpMdHVUseXXsgTlUGdz
 krZ+0zpDxdcM8aQoRKE7XCEluLJhTn8Wo8ZCPu/7PECqGOUwmsfGRgHT2yRqPOyilO9c99HI
 klS8S0rxYAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCmP167V7gCxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcYbC8ZSU0e4t/soKk6lBeJRdFmeIawj9b1EDW2x
 CqYoSwWjq8Wy8UM0s2T8VnZjhq2q5POTwpz4R/YNkqM6A9jacidfZ659lHB5N5JNoPfRV6E1
 FAOltKC9ukIAdeInTaUXeQWNLiz4rCONzi0vLJ0N8B/rXL3oSflJN0OpmElTKt0DioaUTzye
 0n6mhx63aZKZCalMaZcZ9i4C9t/mMAMCu/ZfvzTa9NPZL14ewmG4DxiaCas4oz9rKQ/ufpgY
 cnDIK5AGV5fUP49lGPnGI/xxJdynnhmrV4/U6wX2PhOPVC2X3WSVaseeGWHauQ0/ctoSy2Er
 o4BaaNmJ/hZOdASgxU7E6ZPczjmzlBhXPgaTvC7kMbYfWKK/0l7WpfsLUsJIdANokisvr6gE
 ouBckFZ0kHjonbMNB+HbHtuAJu2A80j9SxnZ3R2YQ30s5TGXWpJxPxAH3fQVeN2nNGPMNYuF
 6VVEyl+KqUnpsv7F8Q1MsCm8d0KmOWDjgOSJSu1CAXTjLY7LzElDuTMJ1O1nAFXV3LfnZJn/
 9WIi1OKKbJeFl8KJJuHN5qSI6aZ4CF1dBRaBBCTfLG+uSzEreBXFsAGpqZveZ9Tck+fmmLyO
 sT/KU5wmNQharQdqbHhrauFs52oA615GE9bFHPc9rG4KW/R+W/L/GOKeL/gken1WDym9aO8S
 /9Syv2gYvQLkEwT69h3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0Ga7+HD9zoTQwKLw0/Y+XdifxNwmvO7e44KVnR7TNs+ObVSl1bOhSB0XQPLLZ8PI4/7
 /0mvcoat162hhYwa47UhSFI7WWcaHcHVvx/5J0dBYbqjCsty01DPsOAWnOnvsnXZowVYEcwI
 zKSiK7TvJhmxxLPIygpCHzA/etBnpBS6hpE+0APegaSkd3fi/5pgBAIqWYrTh5Yxwls2v5oP
 jQ5LFV8IKiD8ms6hMVHWGzwSQhNCAfApx70wloN0mbYU1OpRirGK2hkYbSB+0UQ8mR9eDlH/
 e7HlDa5AGiyJMyhjDEvXUNFquD4SY0j/wLPr8mrAsCZEsRoejHimKKvOTIFphaP7RndX6EbS
 T2GJNpNVJA=
IronPort-HdrOrdr: A9a23:zaHqXaNdq6euTMBcT1L155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY55as854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nIviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sv1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfp2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DDeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeTP003MwmNG9yUkqp+lWGmLeXLzMO91a9Mwk/U/WuonprdCsT9Tpf+CQd9k1wvK7VBaM0vt
 gtn8xT5cZzp/QtHNdA7dE6MIKK41z2MGDx2V2pUCDa/YE8SjjwQs3MkfgIDN/DQu1/8HJ1ou
 WYbG9l
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="55465959"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyVdUYGZUnZv+gz3b8K6CEPVnNKR0eQp8B0qavRAn1B5OIiMfvSgN6LG40wRepakhV48XvGq2VCXe/ipc9hGBSbzS51hjkocrlBzIQs8oZWopQkSxKiHtysq79aYdR5hAIL6yCX8ForabLo4UmT3SltCI6f+DR65zpFnk3G4fhTsFXbWHXL9fxHTBcZI+pg6UFUGgRSpInpaLOrpfNu+CRQE21Dd8+ttqaw3w6Sb1SwQNduk5fKw4TsvNuhUWpXc1U2qsz37Uit3a97C4GmIJYANN3q5tsl6ALUutT+nmeC9OaWoN656VYAvFcNZNweRwkdacOoUsxHPAezJVkoMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4d7SnycqOTjWlfVwndMpJ36JESroADFh+e51ulQjF4M=;
 b=bIWlth3fm0ncxiQTA8KgYmA2Qtl6NLuMgoESUKWWpn+80CiKV3P8h1anlfQsweFbUORns7+DCti1ya8hvKE/ndOQ1GUjS4Ft6oyL1/NNcRrTkg98XAmHa0IC/28FP4UuC/395P33MfCgIfpEBgSsL6xhhI1HQAdtnBlc73ms4shqJc0j1d+A1fTkNMC2IDzYuP58o1uyHC41PzPjequqWKrObMLveOEk0TGBY5lQSN7Qj8XdhgT0ClgCKtw4OgtyyP/MKJiPyn3WKLv6MYf1PGcBdRz+e87OMZKNIwx8SWl2cFLVDO7fj09jHugSlbWFWHATbZIeEf71jQN7TDix6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d7SnycqOTjWlfVwndMpJ36JESroADFh+e51ulQjF4M=;
 b=om1sr34AA2Dgaumjj/iq/At7TLl7F9COJWaflCWOIM/0Bpn34elS2tw8p5ir4hO2S8lU5AkfCZxFAQACjmyFxV+mpGgFahKTDv51RlB+mCX7MzriexB64D6YeDKhkPCZHywPXrnlsYLgVAedqkIqVpBou2P2zJl6nUOIJFNNIlo=
Date: Wed, 13 Oct 2021 10:30:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Michal Orzel <michal.orzel@arm.com>
CC: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>,
	<bertrand.marquis@arm.com>, <Andre.Przywara@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Message-ID: <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com>
X-ClientProxiedBy: LO4P123CA0159.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06ec72f6-e908-4de0-ff5e-08d98e23bccb
X-MS-TrafficTypeDiagnostic: DM6PR03MB5322:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5322C85C324706FDACD92AF58FB79@DM6PR03MB5322.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OKhSwAWgwf/+tYFdbJpLoQ6TnzgkENh3UvEwrcyk+sxFyug9RqXOA+b5fgxXYcxgMnp5o8iG+DhEKwFcvbmc9c0dFr+exJYUSJnCL+hEbHGYKxiEsEHt8dfs2MAmM/R1Q3SdYc5F7e2ohDbSWbH2+PXW0oYvYpBIe6T5npuhkv5OUA3JaqxiQYbPqa57KfqsMpYcT2agGy7fy9Zv0TH5uq/cKanSIvDsP0sh8kQqOuBxxw33OK7t2Hc/cD0Mwd5zAR27U2cAymbsc5HeNMrFYmnW/pdLBtCsni0zZrbmQqUTopsB7ksomqbfUVtxyEnz2wfmPwiAk1ifCnRjOmjPBZJ5jAi3o73KlOBLJk6BpfHutiC68R5lPDGhJrs8tA17mXZuTtgVgXD6rdEbwHIq1mYXrxrvrnb8LqdVtERAgSe68TXnqVUuVI9uEUxKlUMcRhp2TkRnmDRCIv08CKN3Na9Dwe5AFEYyoxDXepwAhPlP2GhYbx0H3DKsOHKh4PLAzY2oyLnKmgzh548o94ltlDnVfd+ORN2OY6eB8OsqBxbjzq5XRsgbrHFGmhtfUdp4JNbxDhaUlgqe4JY/7SR4d1kbZMhI8S5+79Fkx4FQRbj91KLr0jbtx53tWSYpsn/3XwXjEl+kCm2k/X4Tlb6DMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(85182001)(9686003)(53546011)(6486002)(54906003)(6916009)(66476007)(82960400001)(4326008)(956004)(38100700002)(186003)(26005)(86362001)(8676002)(2906002)(6666004)(66946007)(316002)(508600001)(83380400001)(7416002)(8936002)(6496006)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVI3ek5hVlFocTBmOHV5MXRpRVJReFdpeFFnOXZNY1psNDhXY1dSQmV5VTlz?=
 =?utf-8?B?bXdaWkJQcnVDREthU0RSWmNiTWxsMWJtUURtc3ZxMzlHZnc1QVJxV0J5bERh?=
 =?utf-8?B?ZEtvck9nRG01WTBzRkZ6RkNMK1lPd2M1QTZuRUNTellIS1duZDN1bFZRWWpZ?=
 =?utf-8?B?MXJ1THVIUm5IbWxwTmJBMUNOeXhQOGZUM2ttK1pxdzNWcjY0MWc5OGZPMHFt?=
 =?utf-8?B?eUJQSitrT0RSeTh2RGNIRk9sZ0tKQXAzQXNOczlJa24rSHZVajRKVkJOaEhT?=
 =?utf-8?B?REdSd2hSc0g2SGlMZU0xTzc3TFd4anNKQlpXdzhjU1Y0WW1kUGJ6L2pyaUM2?=
 =?utf-8?B?U0V0WUY2cTh4ME9NdmVkVWJvWkV6bnBCbUlFa0l4ZGtwWEpUNUU0V1psbk1v?=
 =?utf-8?B?L3RZTmR0TCtBNHhqZHhNN2VnWGR2OTFKY0R5Y2NzY21Ja3E3OWYzdXAvd214?=
 =?utf-8?B?S0pGWXpIZTRIWDkxM0Q3TnI1S0EwVjA0anJaNlNqZkxZSmk0b2JOczNEVWN6?=
 =?utf-8?B?RkZBcU8wNW41bDhtbnE3Vk8wRWJ1ZVh6aFBFdUlOM1Q0YTR2czhLd0tMWlBQ?=
 =?utf-8?B?eVE4UkRrS1FSYUFtTjVzMlg5MkZBTWRlZC9pR0E2OUdKdmloZ2QxSGxwVks4?=
 =?utf-8?B?bS8yUzNGZ1BhdjlrYnpDM3RhYnkxQmk0YTlKUDBlSlUyZ3ZabGpLZGk1OHhv?=
 =?utf-8?B?b1YxRmYvSU9xTWw0RUJOai84NVIyVUJvd09VVWMyNXpYYnhQaWNtRjYrckE5?=
 =?utf-8?B?M3hFS3A2cHI0cGgwSlN6MG02Z3Y0ZTNCMXN6RE1oK3dqclRDZVdSZDhFazJj?=
 =?utf-8?B?VnoxVFJQaGs2Vmtva2JpejVMMmR5ek85V1FDcFRGdW5XV1A2RWw0Skw3WFI0?=
 =?utf-8?B?UEVJb1JwU2V3OTVlVmtFc0JEOG5UWitrM2xuMThaNmhxT3RsVUUwMWhwcmJs?=
 =?utf-8?B?Zmo4eXRxa2pDczN2LzBhMk16M1ptdXlFSUJHcDFQUVVoamlBcnA1TjJWb2VB?=
 =?utf-8?B?SEhhV2h0bkQ1bnFjaFZQNGNvVi9KVkdKRjlYWVArVFFFNzBqY3hPMkhyLzFI?=
 =?utf-8?B?NWM2SVVDTDdsai8wRFlGVExoMHJvYnB6d2h6d00xKzRTOXhBTnJwU0U5cEZC?=
 =?utf-8?B?dkNld0ZOTlNIYlBKVlFURGNaVDFKSTB4UFFZem40RjZjN2ZEU3g5UlJFcVFF?=
 =?utf-8?B?V1VHam9hS09FRG90TzFUbU9VUHh4QXVVcnk1elNjMXVaa3hISy9Hck5ZNkc3?=
 =?utf-8?B?U2tYaVZJcU84Qy9YVldpSm82cWNmUjk4ZGtYZ0phSnZqYlQ2TzBhNE9EcG1N?=
 =?utf-8?B?dWJ3T2RWRkh2VXl1NXFSbFliL3RrdjJOZklkcVgybno1R3RoQi91VGIwYVpM?=
 =?utf-8?B?ZjZxdDJWSGVZOWRwbjU1aEhady9zZUphb2krTXFLa0JvUkNpd0pac2JwWkox?=
 =?utf-8?B?aFFaZnRiWE1IcGFQMnZyM1F2bXN6d0JpZGFuK0tTYVV4K2J4aUlMYXNFc1dO?=
 =?utf-8?B?am5OWjN0RGxjTFlFMUtmZ1dXZGtiMXpoL0gxREExcjJrUnI3L2ZlZTRBRkNv?=
 =?utf-8?B?UXhZSnFlT1FpTm9TTDBGMHFYLy9VY3hWQmFxdE93QitVMCtBUnhHaHV0TFNT?=
 =?utf-8?B?NEpGKzJ2RzJsMzRXUDhSWHR2c2wzYUExcTkrSC95YlFaZTN6SW43TGxwMkQ5?=
 =?utf-8?B?Q2I1dHg0bUpkTzdEZ3FkQVVlZ0JNQm5oc1pieExNclBkMUdmQ3JrYWNaZUtD?=
 =?utf-8?Q?3miWy7uCN3QcgTviatqa2RtZD/Gu45Dq6Msfs4Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ec72f6-e908-4de0-ff5e-08d98e23bccb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:30:39.3863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOcIHwdfTWRps0LXWL3kKVt6O58gHTASNGyzLwHNfTkNd+kW8KaEMxUPiepMT+QbJ4XvOD32S/JN0KFM5HQM1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5322
X-OriginatorOrg: citrix.com

On Tue, Oct 12, 2021 at 12:38:35PM +0200, Michal Orzel wrote:
> Hi Roger,
> 
> On 11.10.2021 11:27, Roger Pau Monné wrote:
> > On Wed, Oct 06, 2021 at 06:40:33PM +0100, Rahul Singh wrote:
> >> Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
> >> Reject the use of this new flag for x86 as VPCI is not supported for
> >> DOMU guests for x86.
> > 
> > I don't like this approach, XEN_DOMCTL_CDF_vpci should be set for x86
> > PVH dom0, like we do for any other CDF flags when Xen builds dom0.
> > 
> > Things like PVH vs PV get translated into CDF flags by create_dom0,
> > and processed normally by the sanitise_domain_config logic, vPCI
> > should be handled that way.
> > 
> > Do you think you could see about fixing this?
> > 
> > Thanks, Roger.
> > 
> 
> I have one question about this fix.
> If I set XEN_DOMCTL_CDF_vpci for dom0 pvh in create_dom0, then in
> sanitise_domain_config or arch_sanitise_domain_config I have no
> knowledge on whether I am dom0 or not. I can check if I'm PVH but not if dom0.
> This would be needed to add a warning if this flag is set but we are not dom0 pvh.
> 
> Any ideas?

I've just realized this is more wrong that I thought. vPCI is
signaled on x86 in xen_arch_domainconfig.emulation_flags, so
introducing a top level option for it without removing the arch
specific one is wrong, as then on x86 we have a duplicated option.

Then I'm also not sure whether we want to move it from
emulation_flags, it seems like the more natural place for it to live
on x86.

If we really want to make vPCI a CDF option we must deal with the
removal of XEN_X86_EMU_VPCI, or else you could introduce an arch
specific flag for vPCI on Arm.

Thanks, Roger.

