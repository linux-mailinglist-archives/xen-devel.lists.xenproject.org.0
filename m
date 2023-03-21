Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D16C3665
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512826.793096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeNl-0003os-9H; Tue, 21 Mar 2023 15:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512826.793096; Tue, 21 Mar 2023 15:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeNl-0003mO-6a; Tue, 21 Mar 2023 15:58:41 +0000
Received: by outflank-mailman (input) for mailman id 512826;
 Tue, 21 Mar 2023 15:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKE/=7N=citrix.com=prvs=437062dd9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1peeNj-0003mI-Ed
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:58:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c8dbf1c-c801-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 16:58:37 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 11:58:33 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW5PR03MB6908.namprd03.prod.outlook.com (2603:10b6:303:1c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:58:30 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:58:30 +0000
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
X-Inumbo-ID: 3c8dbf1c-c801-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679414317;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fd5EnBrdx/N9ypagAmNXlfSKtlJYWrUiUACWDb1luBE=;
  b=BYborFh/KIHOG7z5I1I6OaINaBDt+AXvliX0Xf4P1z1DYUJ7PUanM2g3
   fltVEQAjxUidCbYGsSzSr31fNMlhKofKyPyXGHB4wvsr16vnNx4AebjAt
   4PBhxJ6fMJo0OevMQ3r3jwyajLioJWUh/ZAEYy+wgJfflnYf7JqefuDWg
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 101643843
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zx7KSKlnupa1lKGBvvw6EFLo5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXWiPPPjZMWD2c412bonj9EkPupPSztMwGgptrHo3QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gaGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cAlFjwySQqCu9/177CVY8Axqvo8B+C+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHuiBt5JROHjnhJsqFuvnHUXChwqbASindiHk1S/C/h6C
 GVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4P5YnlqYRq1xbXFI89Qeiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:alfhKqNA6NJn78BcTvejsMiBIKoaSvp037Dk7TEXdfUzSL3hqy
 nOpoVj6faQsl0ssR4b9exoVJPufZq+z+8X3WByB9aftWDd0QPDQb2Ki7GSoQEIcBeRygcy79
 YFT4FOTPH2EFhmnYLbzWCDYrAdKaG8kJxAXN2uqktQcQ==
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="101643843"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXU1CMVejM7Kn4QpqKVqbOFJwjEPpdx0MxuuCI/11BoXOIyIOKaf3uWV6kSxJaDjvqk7ZHspEOCCMD0ylCOBtb5du+/0Y8Yr81pcR6xuyC/fs99wAH+LP/hvCo0M6aaXqh56PfP7T7oNKJpphc+t+J2tLK/f9F2gUD/XDZ/lMhQJAGKy/QKphEHL6ALN3nG/epukJs4baTLTPzCmLFguYG32aG0xWA7nYb+PI9oXkJ3m1yellQ51hM3tyeizM/CaWnoeksk8AMbyTrG8tWUheujV/y76E4qLdds5xqx55JA5xG+LJ6u2YQTg/1bNS595tf+HBmcsOrTkGXbxnNvzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjRnAdKTnGMf8ytIdDz0drTY6lFbThODyVm2NRpa2Ns=;
 b=aA/vQVs01wnO0f69EJ3N3aWePMBzQKv/weHkQ2e8re0EEJ9rLy0Q92eMBVghLarY2vq9VRSrD42oylIV3CCaqM+qA0DGJDcr4jsJ7hgovi50oaGq2H+Kk5nSeDGNkA4qcvBcUhQ9Vk5a+irBSaepV/1CSftLC3ZgZo1Eob385RBH1VjQ8QAkGbcKYKvw22qG+Sa4qmeKK5/vYDOjTNRv+nWAcadn0tRtjYfBsx8Gaalbd3EG9zr+M7FOJWMHZr0pI6QSmIWvFHQl3a3+gZfT7DBkl039kkR6g1PGf0YHe/ug8hm1DMTjKzaU2ryNyGIOppi3xl+S8c8sDyPaAdZ+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjRnAdKTnGMf8ytIdDz0drTY6lFbThODyVm2NRpa2Ns=;
 b=KCd2F+L5v0HlyNbcjQJRdXVHKbHOtkIMbDsA9lQgeVqW4P4gaE2ZyAdcmpEHc77Cyzy/Nv7o93FNJme7noGeUZyiLLbpr5T/YLnA+UWae2ENlZbwivMWgB6NztVlrO4L/O0Qzd3za/lPnH98dxTzHTKftNO22PSYtM0kcmEUAvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Mar 2023 16:58:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Message-ID: <ZBnUIJLHJSBTlwLe@Air-de-Roger>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <ZBnCTAw3Fj/BpvTl@Air-de-Roger>
 <9864c24a-6d08-5a5f-3de5-3b34b68a6edd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9864c24a-6d08-5a5f-3de5-3b34b68a6edd@suse.com>
X-ClientProxiedBy: LO4P123CA0280.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW5PR03MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 146f9a96-ba01-4ceb-e0c5-08db2a251d7c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TMWUnsI0bTDMEFETk3+yLc4v+rLBMNkMQLCEwQdRzvcXep8TMCyhfMKWoSdxj+gwoen1h5u8KMhjF61F+3QbabmY3A1wzjb+i0rxkxK1MG07sJckrIiAiOn4hPxEgUW/y7YSQPt/dCY0sngbzAP4AEwWYnOUmhGdXJiXoLLZg+Jd/4NmDs6maQWBiZe3U8bJmIDdhZohOQHj4SA17tk25meXxjEkKZF/qsRIgk+M5en4Zy1LkngyOtKFc5HkGIY1oTtcfy0p/mWTvpnjTt/rXnehruTOSlpL71v6WMbOlTnU70s4c9CIYWMdQDhVu3SikBTnUXB+HQqXxiFEwsuY5ZVlBqbHBipQZA6m8UIZ/luPIZpuKHNXJr8MxMdQ6biPN6oq/pJVOLbEH60KhcqFCMacdVaN6PdDt2zVqXW8dlujB1TIddFJAm+iT1HZmnbloYp8CpKvGEPxYwLnOOG0DC2EaBFQvenMI6GTCu2lH+9gwRa6KZv7NHcKY0iiF6mh5YR8CGoygfP5kNxWAqzZrX/4eloXO5R8Ki+srdeQfy/hXWVkbMvw5nn+Q0J9Ep+zv6FdsqT6yzJtCrsRpbNka3xKgju47ev5pSjng3RRD64BM0YgUKOMFIo0qxLTeFi777JfoVrcVMjFCSK2OBNing==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199018)(33716001)(83380400001)(6512007)(316002)(54906003)(6506007)(53546011)(26005)(186003)(9686003)(6666004)(478600001)(66556008)(6486002)(86362001)(38100700002)(66946007)(2906002)(6916009)(5660300002)(4326008)(8936002)(41300700001)(85182001)(8676002)(82960400001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1ZYbGxmN0tnQjJ1c1hpSHRwZlJwVEhmUDh1YnJJT1doODBvS2xuTnJmd2Nz?=
 =?utf-8?B?LzVrcnM2N2paOCt4OEJVZTgvTnZ6RVlEU1RTdnhpNmpsMVYwUlBOWWJOa0pI?=
 =?utf-8?B?K3VvanBFMDVxTUdhaEZDZUZTZkM2K243alhZcGpiR3NwSzJoMTVRNS94T20z?=
 =?utf-8?B?OUlMN3NiVFlYc250Y2s2VzlxditBZ0dRS256M3hGQU8wZ1FCa3FUK0RRTVdN?=
 =?utf-8?B?YVlPZjBtZ1VhVDZKN3hYSFpwcUVWY2w4YnZvd3ZuUUF5cjRVbzFTME5KY1Mv?=
 =?utf-8?B?WXpqeFExSzY3Zy9VUDlOdVNtYkJxTG83UUFuV1JVNmR3SGJCZXdiV3N2Nnp3?=
 =?utf-8?B?a0ZRN0FYdE5yd05uVE1oZUIrRTByVUVDK1J3ZXBoYll4YjZ5dWhpU09yMXBz?=
 =?utf-8?B?NGF6Uk9QVXNjS1VWb0xqaldFNHNEWlEyNnBHVUl5YUtuQWUxZXZySUU3S2cw?=
 =?utf-8?B?ditEdURLK2lXTGRiTkF6TEtOc0RlWTgrWFduMWRtT3R6T21LbUxKSnNuRCtq?=
 =?utf-8?B?dkh2OW9yem44aEFXaUljV2tTYXdQbXErOVVhQ1lldVBZL0d4N3JGZ2JQTGJt?=
 =?utf-8?B?eDc5NnhGREhMUzA4TlZveTk0TEtoTjRqQXZaOTlicERaaWdIYmZBL24wU1dG?=
 =?utf-8?B?OHhrR2pBWGl3RTJzeWNhNmp5Mkw4c2ljV2Q1bUh0Z0hFY3U3UVZKR3ZkQU5n?=
 =?utf-8?B?Y3oxV205KzNqNTlKTTlBOFFoYkhuSk5ra0laS2k2NFlCWVNxWXk5U1hEV1BK?=
 =?utf-8?B?NUllU1JLQ2JZbkJHbGdlcDJhRitlTlV5Z0YrQUlEZ2lNYkJDNEVER2wwdGo1?=
 =?utf-8?B?NnhnMWpkZzRuQmk2cXBHTlY2cS9rWnUxaFdleXFDR1RvamhyUHBxaktTMkFP?=
 =?utf-8?B?RTRNZGcxNnAyaHVhNHpkcGVHY1YzSmFTWmNQeVNCbWJuSWcwbjJCV2FMcXRr?=
 =?utf-8?B?T084djRxaDFGREU4S1B4WlRxZTVvdEpzNWNheTh4Q3lpTGpEQ1JCTDNXQlZ0?=
 =?utf-8?B?QVJvLzhiU0czMGZIdnpHa1JSQUgzTmFlVDZNQzlnd01RNGZ6SW95b2h3WE1R?=
 =?utf-8?B?OHZ4eklZYWpGV2JWUjQ5UDdia0c1NzV0cUtERVE3NnZxTkpCQnk3OS9WTDU1?=
 =?utf-8?B?K0hpQ0tXa0FRV2tkZjVQWEtYK2x3Y1BwRjFZT2xYS2wydXZ2MWNtRXpMcS91?=
 =?utf-8?B?VFJSOEI1NDRBd24reDN1bjY1RTdLVHNBZTNUY3Z6Njk5NE4xMXp2RlhQRkth?=
 =?utf-8?B?eUFjampISGZTWHFLWmRQR0NweW9IcThhS0MyTldLQlBCZkw1TWR6MFF1L0xt?=
 =?utf-8?B?NWhzclUzYUVZeGZsWmRGY3NuQXU1MG5ibDU3ZlVXS2JJNkhDM3F3OTZERGw3?=
 =?utf-8?B?aHpXREU4UFBrdXc4SzBhZ0FvWmp0eUVUeEludVBKcTBlNnQyU3EvbWxIWHRN?=
 =?utf-8?B?VVpuQjhJYWZTSVpaWndjd2lLR0ljMlh2ZUdZaFI1WHBaamE4REtEZ2QrSktZ?=
 =?utf-8?B?cWRvVk5tVmQ3ZUZMZ0FROGZQQUxNbGRVSWxaUTAwK1k0N1NzS25ZTTRrMHda?=
 =?utf-8?B?SWpoU0NLN3JtUWJQWU5BYUc5bU5ycUZ3MEZMeVFhQUY3ZEdZVTJhQ1d6Z1Vm?=
 =?utf-8?B?WnpDQjBYaHpWZFZsVVVlWUZjaU9DUFNxQm50RXVnVkQxVEsycWxxVWJvb3Bv?=
 =?utf-8?B?em9EVUpJM2tnNnhWNzg0b2E5cVp1U1d5aGVDN1F4VDNEVFViekdqU3ZVcUZQ?=
 =?utf-8?B?MjFaVUF5RFZ6WHVJRGkwUUFhYnUyOHVST3UvUWx4K1JGb05QU2lMakVHOGJH?=
 =?utf-8?B?SkthTjdtUGt4NlVvV3hyRlNlbTI1clM5aVp4ek9ubDFMT3BYa0xJWTBYdDlm?=
 =?utf-8?B?clZpVThaWEhYK2V1UUhRMjdJRmJTVllUYmdYUFBXTXZndThjck80MnVoU0g4?=
 =?utf-8?B?SnVWUXlMdUlIKzRzQU5sM29IZnVKZE5ObFlwUnF2QXl2cUwxVEpCa3dsQUlo?=
 =?utf-8?B?U1JlU256dWR6M1lHK3NGVUxPSTFWNGxod2RlWU1yelBpRTlISi9Vc0tMdmti?=
 =?utf-8?B?ZFRsTzd3YlRzSmI0Y0VraGh6Rm9OQjU3c1drelFqQS8xYmljUUVUV2VQTG1v?=
 =?utf-8?B?SUdvNy9weFVBc25iQXJXa21jQXhZUHk3S25FZWpKejl2ZFRWNVR0Nit3MytY?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zm+z8qxjkIpjkLCH+W2irjEBiZJJamfMBw2AjasRrC+7oMIs+98hRlQeRNGoiGh6y5ZHC9Qvp22lLocS9BHIodfZsobpODt/wKbnwEEawQQSGklnOk+ZIBM/BhVUjWwdX1X5iuzEH/yoN9PeDYXT7slLP4aHO9B868X/mVby/z+XHtJ0CiLZsazTQm6j3CwCwPZyEUOf8rq0qYMNI+anTUVfvkhKuZ5pkstBpdVEiMiJf8nBFr1nRDO4dvr5ckh4ptU4C65sRia3jyg+YM2/FKmm05p4UxS7+BBerqAGh3IPc1waDg6WPRHiwxg9NV/imt9smRQtpr9fIGOgKWyEm8r7V+wjiHvuajAtf6Jy0KWh3niSJ7QK1rUB+7sRpBdTtJ8l4d093Xe1TnrMrNf/ZcfJyOc8FGSDnCVgqFt8O6rdsd2J8XtMu0OKd2Q2XvRDk+Wil35mE1VV/kYvgLkcuNOEiTPJBH5DVHTv6bUnE/floUVmFpbU8IB8tJTFpmt7AA7Bz5sSeQYrN3/ord0fByS92TJKXbbYBTmC1OqNX6dW+iUrwItL6HnE9h0nZRKUFLXpMwuqW1of3KQIUQ+uPKH1/6WfG/2P3k+gL4QGsHbGgR2t7+4YqYs+mrPmRqYd7e8jd1HWVAriD2OQZSmYRaAivHRTlyNucaajlfCrUU0dZMcfNqp/HLFqF/YulqZyM87k8zasjLGpJ/FVksqyHPqkmW1hVSNyKKaqh6rVPyX558SQSO7EkKp0/3jjP1VAU9o3GeEZmbKjEkoLCarGStQ51iePEyvtunvDTzcBFSaynVRyIdWQ5bir09DsNXD+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146f9a96-ba01-4ceb-e0c5-08db2a251d7c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:58:30.2280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HC13pHJ7TLwR1aWpFwNdIBaw4AdPaxI5hc7rqStVwBvYV2vjIpJ1c9otgqv2fTa5Rn8T4gZQ7nLhyU8p8Gy89Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6908

On Tue, Mar 21, 2023 at 04:51:43PM +0100, Jan Beulich wrote:
> On 21.03.2023 15:42, Roger Pau Monné wrote:
> > On Tue, May 26, 2020 at 08:49:52AM +0200, Jan Beulich wrote:
> >> Respective Core Gen10 processor lines are affected, too.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/arch/x86/mm.c
> >> +++ b/xen/arch/x86/mm.c
> >> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
> >>      case 0x000506e0: /* errata SKL167 / SKW159 */
> >>      case 0x000806e0: /* erratum KBL??? */
> >>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
> >> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
> >> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
> > 
> > I think this is errata CML101, I would add that at the end of the
> > comment.
> 
> Indeed in the current version of the document CML prefix exist. The older
> document I've been looking at has no such letter acronyms in front of the
> errata numbers. I can certainly update.
> 
> > Also you seem to be missing the '806ec' model (806e0 case)? (listed as
> > 'U 4+2 V1')
> 
> Isn't that pre-existing (see 2nd line of context above)?

Oh, indeed.  Would you mind also adding a reference to CML101 for
0x000806e0 then?

Thanks, Roger.

