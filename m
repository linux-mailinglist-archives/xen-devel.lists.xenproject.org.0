Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99A1715C94
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 13:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541101.843472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3x9a-0002Fa-H6; Tue, 30 May 2023 11:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541101.843472; Tue, 30 May 2023 11:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3x9a-0002Dq-EP; Tue, 30 May 2023 11:04:38 +0000
Received: by outflank-mailman (input) for mailman id 541101;
 Tue, 30 May 2023 11:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tCH=BT=citrix.com=prvs=5074c9224=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3x9Y-0002Dk-Ub
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 11:04:37 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0291991-fed9-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 13:04:32 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 07:04:27 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6980.namprd03.prod.outlook.com (2603:10b6:510:16a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 11:04:22 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Tue, 30 May 2023
 11:04:22 +0000
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
X-Inumbo-ID: c0291991-fed9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685444672;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uFghc1LBtGzWY4E+3teK0Rk/zJALyJTxpnBN7UxQxSQ=;
  b=UWsiO9NwgS5WByXlsx3YkDdbzNjEhq4eeyaqvEY4OAxOb7FDGVz1BxCj
   oDq5k77QbYcADqRUP3GBxxk9YLv6leD+3IsmbUQoINBgTC3L/whZeEPa0
   y8FB1S4ZV4LKORLjSNPl+DF/UmNs6LtQzoeFAVGksEJxruwJ18K7MGgXf
   g=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 111310354
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZuE4O6uDzO5woBzNFKkRBOKAgefnVHxfMUV32f8akzHdYApBsoF/q
 tZmKW+OO/yOamL9f4wjOo++90IH6J7Qy9E2GgJoqn1kHylE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKFzyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwbz4gRAyul72Nh+y0V9M1qPZkLZnGBdZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIG9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdtJTeXjq6ICbFu7+HA5JRBNTXaCi6er1FOyWNt1K
 349w397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyLzflTrKR9dnVaKw0Nv8HGiox
 yjQ9XBlwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:hS0IPa78UNSJEMcvfQPXwVyBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhIE3Jmbi7WJVoMkmsjqKdgLNhdItKMzOW3FdAQLsN0WKm+UyYJ8SczJ8U6U
 4DSdkYNDSYNzET4anHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCazqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOtXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6Q64aT1eUbpDLS8KoMOCW+sLlVFtwqsHfpWG1VYczMgNnympDt1L9lqq
 iPn/5qBbUI15qYRBDJnfKq4Xiq7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPsi3N7N2KzoM3G3am8azh60k6v5XYym+8aiHJSFYMYdb9KtIQauEdYCo0JEi724J0uVL
 AGNrCr2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgMYfgnAD/pQgTIQs3Z
 WyDo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdHmfJFz2fZt3SE4la6SHkIndyNvaCaDglqFC56
 gpeGkoy1IPRw==
X-Talos-CUID: =?us-ascii?q?9a23=3AqONmYWjaA6olCyNW7E//cB7pNDJuNXPw5mv9MxC?=
 =?us-ascii?q?DTjhmVYfMZ23X+fNJqp87?=
X-Talos-MUID: 9a23:Ghk8Nwje+CrC0tBnrZopfMMpCttCzqn1EG00u8sU5dSINiVaOwW0tWHi
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="111310354"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kcq0hqTH1Wlkr3/7lY+yDlfVv7YNlVhfrHbiJCqNWWccav3uB5iIQTf4n4grNf4qQmp0YTWL1vfia7c0g2Cr4aHsgyqcukCAWZWI/B1yJPi8sagOUkzsiziuNqkd9ebQerl1WL3yk6U/rzVUkRpTEKfbXQET78HNwJiI/J8HHIhrzXwO6Dy2Hy0ZXrRrkMuBiSozpbtrtRsfwoVzQJ90VsM4jfppHZUYj8kguMBUlc1STKdhlG/DU7ba9SCAGeZLcGnVzJ1Pym1wxOvn1RjtVAvkt13GS0TUS7Nvb2dv7qb79EUd4BPUPb+VqouHqfGYerFtlLoOyQX2wPGEfjtHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mpXyUmSdrJG402BKaiJCtmB5duRnj++5v+WGT5Kx4I=;
 b=hmz+h1muIRzHNctBb3BFH1neKVl/7d5EuUetLv711My63r096k58OjefcZE2tpbx5KbyHvbM4+VQ89qhA35G2EJFMnHYKXTfzjcfmI+0kM11BLMf0rOmNCME0tTmTGcEIGcchQZjXK6V/loChbReyXcMOZkFtYDUm/cRzdhBMg7PPkba2Tm5p3MHrni3WV6XrnMedXsPtZitNeI8NJRFs23asFC8d6qoRYV/Ur5alw+5i/k87bEKqzaMnPOsXTGYm2OGYmpwRM/bK+1WwpSf67UaB9mQoUq6g9kppZpmZS0hDtJh3czGOScCpH8G35u4JtKS+dfFEJz5SdZrxhM/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mpXyUmSdrJG402BKaiJCtmB5duRnj++5v+WGT5Kx4I=;
 b=heZi1aiLq+Y8KulKveJWJnI5iz+5Dle8JiCpVZVspWeADlPhD0NOVtDb2eRtuMonuVVbxp8UFrv6p/m2O+N7gMU+rGU8aA6WhznYrLaAH3S8pYQg70dixdF6vUW1xXhZgy6WPT67IgMGK8Q1LI1VL09haWVU7D35BqbaLFNTah8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 May 2023 13:04:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Message-ID: <ZHXYMPn4mR0O4rfR@Air-de-Roger>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4zx+TvUWTCEMh3@Air-de-Roger>
 <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
 <ZG94c9y4j4udFmsy@Air-de-Roger>
 <cedbc257-9ad9-56f1-5060-eaf173d45760@suse.com>
 <ZHRdjCKSVtWVkX96@Air-de-Roger>
 <25663dac-6023-a9a7-a495-c995762191d8@suse.com>
 <ZHW+Fu99ZGHPgMj+@Air-de-Roger>
 <830fb3cc-6ade-f10e-2a0a-95b676c63d87@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <830fb3cc-6ade-f10e-2a0a-95b676c63d87@suse.com>
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e77f5e-3560-4dea-fcff-08db60fd9f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VFKefwLukZrBWEXBk5BndxbH5kL6Dnw1O4dcmTf/KS3C0bbfLtOonFyWCztkqhnWDd7S99IU5QQgd0enLiS5C7AtMuvvmVPzTiE3vvpHQeMg1mQuLeJe9T062+jj635DxirU/nQjRu6hp7gC/mRRllCtl6nA3/Phxg1dpp8KKK8slFHkQDb9xKtC+NlgPbm4dGnrP8A/fIlxBC8yw0Whh6Ci2yjZaxTlYBxoYiZb1TNwxk2f0PYH/zx/vjEsnCCghED/OaBJzKOxJRQDd85g6TJFSPTWDqQwLQrGAizu7YGhoDrEsfiEHQwvs/st8ndNSIKWRPDuzr/Sr/B3w67bjqJ6x3tRbeQQGiOI4GDAgU2OsBmS8fKUcLYZRPfD6poHWXjqAMw81g088DZ28/wZ3b68IztCcZHXk38xOGFEkM+QYGlCbKvJnZYGF2fgx1PgopR/6iUZ55ToZ28D3WUVb+HGGoN7frD66Mckx7Qc5usacfjJcWWWe0habAbvhqQS6tOUKchnX2qmh0a6aTai2FmsTSl/Y/q6PBKzRIgu8fg/ezdnKWKdRECeaO1yARID
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(186003)(9686003)(53546011)(26005)(6506007)(2906002)(54906003)(15650500001)(6512007)(478600001)(83380400001)(86362001)(6486002)(8676002)(8936002)(33716001)(82960400001)(38100700002)(41300700001)(316002)(85182001)(66946007)(66476007)(66556008)(6666004)(5660300002)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TllENnhyYU5XdUxSbkF6b05kZVAzMUVFUnVBWUt0bEhTa1pCT3dzdDN3aXFY?=
 =?utf-8?B?SDJIZHNUUXdyTXZTVG10d1JCUEx0OEdLN2tkTzJFRGd1WHYrQVU2TkFGTGNv?=
 =?utf-8?B?SHhYTGZ1MExBemtaVFUxYVVXM01sb2NvZmVuc2p2dEpRZnR0UGlrQVp1elpB?=
 =?utf-8?B?emhKQ1pNWkZqWlArcFRUeitUQWtaZ1Evc1VQZUZ2YUFsWE5xYythblBUUkk0?=
 =?utf-8?B?M0R0cHlQdlZjdGFFVGJtaGhucU1JZlo1YytOam5uR0hFNHVRQy84N2wzR2pk?=
 =?utf-8?B?akhBUjBZYWpXeUxUa1pZUkVMM1pYRzRuK2VvQ2N6L2g3UENoMDZMTWlOUm05?=
 =?utf-8?B?UkhORFI0RS9UOHM2Qktra1cySHRDN1BQSU1kTHJLZGQ3SUhTcUpYR21mTDh6?=
 =?utf-8?B?QW5wL3ZNbWFhSGEvZXVIMERwbXh6Vnh5WkdQdHAzSGZ4NE0rN0JZRGVqcktv?=
 =?utf-8?B?dzlmWURTY0YvZkE1ODJDYWllMTRDTUZMN0RVTUpTZkdMS2VGYXJUZnhWNFF0?=
 =?utf-8?B?N3RaaEFhK1dzc0xCRDhFdHhDTmVuY3NtU25QRXltSUZJRlBrS1k3czAyYUtT?=
 =?utf-8?B?Ykk2clJscjV5aFNDSko3S1FqcU1uYzgvZFArZ05rL2NUTTN2V3Z0ZitsUTQy?=
 =?utf-8?B?cTIxTVIvcG8zREFPcWxJbC91Nks1ZDlSOVR4TFRiWTRGVHRvNjI2bGE3UCtW?=
 =?utf-8?B?UnAyTEw1a0NKYk9nMU05TXZ4dlEzdzlydUtGcFN0QnhOaFQyZUNTV2R6Sm1V?=
 =?utf-8?B?WHpZeEdVOWhLNWFTNzloL0VnOC9QOXZRNyt0S1I5NU5yRVlrZG5nTU4vcVRF?=
 =?utf-8?B?b3JXV053YWplbERMMG1ucjMwaCt3UnJhSmxPbXFqQ1A4OHJ5UFhtcjlLNFpT?=
 =?utf-8?B?aEJsSVByeWNLWHVPZVMxU3R1bjRLYUlIRWlXNElndVQ5aTE0c0t6SWFpSmow?=
 =?utf-8?B?V1JXN3g5YWdvWStUUS92K3JBY1FXYjhob0RWRnFkY05nb3BSaUc1VnIvUkpE?=
 =?utf-8?B?ckl4ZWpnVWxVWXNOV1RTQzFKZWx2SnZBQm9HYnJlTmNsTWZyeTJoRUpUb1Bz?=
 =?utf-8?B?ZmsyTm45NWVkclRTM1BCbksvQzhqWDdUdVd0bW54QnNDdUJxSUhXT0NXR084?=
 =?utf-8?B?Y1d0NisxUHN0MytBRXF6QVdGRGp5WDFzeGFhbU9WRUhaNjYrVTJsUTIrRUll?=
 =?utf-8?B?Z2NPL3VlNFJoZ1FNN3FJQkZXOTVuWEN1OE1IL3E0clhpQkJzbU1IQjFvZmx4?=
 =?utf-8?B?VzJIbVJIWHRrWlhIdDA2dG8yZ2dDT0pPWnhNZWRtQVR3U0hXYXR3OWtXRUlk?=
 =?utf-8?B?VFhTVDg1aUREK0E4TC9KanRMcUVWU0pybUY0WGFJN2VLTkF1ZE9iblE2SVlU?=
 =?utf-8?B?VDlSRmtOZHJSQkRYM0o2UzR1eFRLMStENDQxV3JaSGhKUUtGa25UTjcvMmhI?=
 =?utf-8?B?Z0NZMHgrQ1RNWUZuTXdwMUYrVm43YWNDVzZQU3NUcXdWMG9EdXZ1VjBJMERG?=
 =?utf-8?B?Y3dTcWl0TlU0ekZDKzU0TGo2aTNOVnYvRCtDYnBYbC9IUnZEeTVhTTFPbGhs?=
 =?utf-8?B?b3pSeldHTTEzelErNVlNOGhDZlF3czVPRU5wMTFCODN0N25YcFJjTjd2bXkz?=
 =?utf-8?B?ZFZpTTRLdE9VQkg0aDFUeldHcGU2NXpVK2FKZkY0Q0h1SlpmQ29aZjkvblla?=
 =?utf-8?B?eFlpSHVFVFlvazYrenZmenMvQ0YwWm43MXBiVG5BM0VtaDVwYkYxdm9RdHR4?=
 =?utf-8?B?QzhCQzJZL2czSDRwdytob0NDTlgwMzRBS0F4OTNWNXI0UzNPTHVpNzU5ZHZF?=
 =?utf-8?B?Y2J6WFlsZWtYNldiUXNBS0I3QmN1U1RaTTFXYzlWL2lScXpRaTk5UnNsa2dn?=
 =?utf-8?B?WE0vK1ZoaXY0NlRVaUdtS2ExYW5JdGI0Y0phWEpEY0VwQlp3d1ZPWnJCdXNJ?=
 =?utf-8?B?R1B6TUlPcmx0dXQ5V0xWbzNIZStFN0ZycjVKUEdoL2JTMnZyY0tkTk90T1Z5?=
 =?utf-8?B?OU1VQ0t3clZBbnNCV0dLSEZ0L211UlBBL3dRcWlVOWNLY3dqTk91VlpuVGtz?=
 =?utf-8?B?U3dxanpjblFSSmR6OTQ2ZkJKUlRIdkJJeWJlN2E3QlV5NWZkTmgxS2tubHRq?=
 =?utf-8?B?aUJtMTYraTVjZjl1dXNXZnA5c2haSGo0VGRydzVGYWkyTmQ4NkYzYVRkQlZo?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hriTPy6t5V+W9Rzr62rlYdQkheSlXGRbaYdaF4AmKoEKV5LZKgMq+OgE7njdRtTSubCjRVy8b7hfquv/IydC17iSq1OKSrM87qUb+DUhEBgVXZoXgLJNyYbEwV4o4+Fzp0c08tZfoB9tSAj3NE7QgXyJH3EgtJz5Hfo297eK8u+LYA5bDiruvJ1NIYXrQv4hMK4J5vBiQs566XdsUDWFzevz3oMNq/TkaMUulknQH16uPUIgEzrXIFan4FeRVorN8/ebKd6FmmNsPWqKStUUthMuTB6GKzOosLp1M3ExmjbtTnh7I3CvOhHoSx1inxKEdfWr+kgEES61zqAKrdnEqrqX6qkeMNqlAtTWrAOz1h/gOaZfc4i3MBpO3tmtvQantr3fvifhLt3uzr9Y4gYCjwtTfYiQGvKnBLglVg2+wTIAjd4rsd8LU9scJZW/vUkJTvWcLfuzE0PIvEUovWu25g5nKbBUD9EXWDpvxUpYuxoj7j59Ck1wxssHzzA+ltz9OJXrRZWPlZfRer6R28ygFHE1bjs21c3TzOrFgk9DGDUeig05qc2y92cKSD7xO6c/ZGvGy+WsymBdBtaSWiaUk0p/ubuviAHnRAf7KfDLTqEp+YNCGOxBN8y0d44PzgT12xYwesYLiY5880EZ4MexN9cPKNUGgkkqBH5bmd496ur0sDrLiDaHl5QYHvhFyFkQkFzq3tdSKE23AmAhOuTgJ2l1zX8tmIrFdipDY4Izf1hXOmqg6yjK9UIOyyxd4/QO6+wyDYSw+CkMGX2y/s30XnPDeSccjl95qZVDAKoP8awUVeWXE2KTmpJy4RHhphIes/7bdpt3I30qpI6SVAAXYA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e77f5e-3560-4dea-fcff-08db60fd9f32
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 11:04:21.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7YAothSWiqgYHs/vo/kZrtbmMX2M0ni5ZOcU5sVY/aByEa+KXmtpMfWVrpuORLYbyjpLZVA3TyxvWNZUkJ7yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6980

On Tue, May 30, 2023 at 11:44:52AM +0200, Jan Beulich wrote:
> On 30.05.2023 11:12, Roger Pau Monné wrote:
> > On Tue, May 30, 2023 at 10:45:09AM +0200, Jan Beulich wrote:
> >> On 29.05.2023 10:08, Roger Pau Monné wrote:
> >>> On Thu, May 25, 2023 at 05:30:54PM +0200, Jan Beulich wrote:
> >>>> On 25.05.2023 17:02, Roger Pau Monné wrote:
> >>>>> On Thu, May 25, 2023 at 04:39:51PM +0200, Jan Beulich wrote:
> >>>>>> On 24.05.2023 17:56, Roger Pau Monné wrote:
> >>>>>>> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
> >>>>>>>> --- a/xen/drivers/vpci/header.c
> >>>>>>>> +++ b/xen/drivers/vpci/header.c
> >>>>>>>> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
> >>>>>>>>      struct vpci_header *header = &pdev->vpci->header;
> >>>>>>>>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
> >>>>>>>>      struct pci_dev *tmp, *dev = NULL;
> >>>>>>>> +    const struct domain *d;
> >>>>>>>>      const struct vpci_msix *msix = pdev->vpci->msix;
> >>>>>>>>      unsigned int i;
> >>>>>>>>      int rc;
> >>>>>>>> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
> >>>>>>>>  
> >>>>>>>>      /*
> >>>>>>>>       * Check for overlaps with other BARs. Note that only BARs that are
> >>>>>>>> -     * currently mapped (enabled) are checked for overlaps.
> >>>>>>>> +     * currently mapped (enabled) are checked for overlaps. Note also that
> >>>>>>>> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
> >>>>>>>>       */
> >>>>>>>> -    for_each_pdev ( pdev->domain, tmp )
> >>>>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
> >>>>>>>
> >>>>>>> Looking at this again, I think this is slightly more complex, as during
> >>>>>>> runtime dom0 will get here with pdev->domain == hardware_domain OR
> >>>>>>> dom_xen, and hence you also need to account that devices that have
> >>>>>>> pdev->domain == dom_xen need to iterate over devices that belong to
> >>>>>>> the hardware_domain, ie:
> >>>>>>>
> >>>>>>> for ( d = pdev->domain; ;
> >>>>>>>       d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )
> >>>>>>
> >>>>>> Right, something along these lines. To keep loop continuation expression
> >>>>>> and exit condition simple, I'll probably prefer
> >>>>>>
> >>>>>> for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
> >>>>>>       ; d = dom_xen )
> >>>>>
> >>>>> LGTM.  I would add parentheses around the pdev->domain != dom_xen
> >>>>> condition, but that's just my personal taste.
> >>>>>
> >>>>> We might want to add an
> >>>>>
> >>>>> ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_xen);
> >>>>>
> >>>>> here, just to remind that this chunk must be revisited when adding
> >>>>> domU support (but you can also argue we haven't done this elsewhere),
> >>>>> I just feel here it's not so obvious we don't want do to this for
> >>>>> domUs.
> >>>>
> >>>> I could add such an assertion, if only ...
> >>>>
> >>>>>>> And we likely want to limit this to devices that belong to the
> >>>>>>> hardware_domain or to dom_xen (in preparation for vPCI being used for
> >>>>>>> domUs).
> >>>>>>
> >>>>>> I'm afraid I don't understand this remark, though.
> >>>>>
> >>>>> This was looking forward to domU support, so that you already cater
> >>>>> for pdev->domain not being hardware_domain or dom_xen, but we might
> >>>>> want to leave that for later, when domU support is actually
> >>>>> introduced.
> >>>>
> >>>> ... I understood why this checking doesn't apply to DomU-s as well,
> >>>> in your opinion.
> >>>
> >>> It's my understanding that domUs can never get hidden or read-only
> >>> devices assigned, and hence there no need to check for overlap with
> >>> devices assigned to dom_xen, as those cannot have any BARs mapped in
> >>> a domU physmap.
> >>>
> >>> So for domUs the overlap check only needs to be performed against
> >>> devices assigned to pdev->domain.
> >>
> >> I fully agree, but the assertion you suggested doesn't express that. Or
> >> maybe I'm misunderstanding what you did suggest, and there was an
> >> implication of some further if() around it.
> > 
> > Maybe I'm getting myself confused, but if you add something like:
> > 
> > for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
> >       ; d = dom_xen )
> > 
> > Such loop would need to be avoided for domUs, so my suggestion was to
> > add the assert in order to remind us that the loop would need
> > adjusting if we ever add domU support.  But maybe you had already
> > plans to restrict the loop to dom0 only.
> 
> Not really, no, but at the bottom of the loop I also have
> 
>         if ( !is_hardware_domain(d) )
>             break;
>     }
> 
> (still mis-formatted in the v2 patch). I.e. restricting to Dom0 goes
> only as far as the 2nd loop iteration.

Oh, right, and that would also exit the loop on the first iteration if
the device is assigned to a domU, so it's all fine.  Sorry for the
noise then.

Thanks, Roger.

