Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A436C40AB4D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 12:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186363.335091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ5F5-0007OC-4g; Tue, 14 Sep 2021 10:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186363.335091; Tue, 14 Sep 2021 10:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ5F5-0007ML-1Y; Tue, 14 Sep 2021 10:00:43 +0000
Received: by outflank-mailman (input) for mailman id 186363;
 Tue, 14 Sep 2021 10:00:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ5F3-0007MF-HI
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 10:00:41 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d251b8e5-a86a-466e-8d31-0166cb5a04ec;
 Tue, 14 Sep 2021 10:00:39 +0000 (UTC)
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
X-Inumbo-ID: d251b8e5-a86a-466e-8d31-0166cb5a04ec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631613639;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=F9sPTkw0mJCRNPcVyWrmjj75j6YyGRmrGKs1xZxnygA=;
  b=TGq2PwOuNc3xYTgG/ukkkH/1ljMUpkCgavNfRVQ2DDkLXvR4C1e1EF+r
   ZxEl93WdvvZ9XbdRzfBBHMeTMWKR3FNcvXA5sy8MghFbDFSbgyiBM6Kg7
   nLj8CiahJzMnwEZEdsoGx1NdXt+6RcjcxNk0wfdv86Ow0g9/csZkSk4uQ
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /Q/3amSaS/fBh/unwhtU8GMhDcF8NNutRKzimd20FSwjthReyMxynzEJTeREIp7pyyxGWIg6HU
 2YxnhvmcwSfi8IUoXEIezP5VPbu7nyEwymDOf+2MZMIsllQ9VAE3L3oXGqaZ2X/d6/ZBOWqYrT
 ZsTesiXxa8+gHi6jGZXyE5uM2kFFbcocTkjMkpCA7SsYjw/UeT1Y4COAdgO+e3pp+ROCiMKPZE
 DHD6423+EjMPbwK+YKA+877HOEzjU0LF4Mjh7Vm/Eorz5564D+uCUisL3i5m6ePcBeAwfIFzhz
 0fCUYWPJ2fv56kVKosg13DqL
X-SBRS: 5.1
X-MesageID: 52677731
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fgxo5K1/MasCEyzPaPbD5dl2kn2cJEfYwER7XKvMYLTBsI5bpzVSm
 GIYWTrTMv2PNmb3eogkOY7ip09VvpKAx9RqHVBlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhko1y2
 NQKvpGMRFkzDIHrtcdAV15AOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIUGg2hv3Zkm8fD2X
 uBAaxp1Sir5X0MfH0kUDZRmuMmIvyyqG9FfgA3M/vdmi4TJ9yRh3b6oPNfLd9iiQcROgl3et
 m/A537+ABwRKJqY0zXt2nCmi/LLnCj7cJkPD7D+/flv6GB/3URKVkdQDwHi56Dk1AjuALqzN
 nD45AIj8Ksi9QugQ+XwAQeKjFmpnUMYHMJ5RrhSBB629kbE3+qILjFaFWcbM4F36JBeqS8Cj
 QDSzoiwbdB7mPjMEyvMqO3Mxd+nEXVNdQc/iTk4oRzpCjUJiLo6iA7GBv1nGbS85jEeMWCtm
 23WxMTSarN6sCLq60lZ1Quc695PjsKQJuLQ2ukwdjj5hj6VnKb/O+SVBaHztJ6s1rp1q2W8U
 IUswZDCvIji8q1hZATSGb5QTdlFFt6uMSHGgE4HIqTNAw+Foib5FagJuWkWDB4wbq4sJG+4C
 GeO6Fg5zMICYxOXgVpfPtvZ5zIClvO7S7wIl5n8M7JzX3SGXFTbpXo/ORHJhDmFfYpFufhXB
 Kp3uP2EVB4yIa9m0CC3V6Ea17oqzTo53mTdWdbwyBHP7FZUTCT9pW4tPATcY+YnwrmDpQmJo
 d9TO9HTk0dUUfHkYzmR+okWdAhYIX8+DJHwispWau/cfVY2RDB/U6fckeE7Zohov6VJjeOUr
 HuzbVBVlQjkjnrdJATUNn06MOHzXYxypG4QNDA3OQr6wGAqZIuitf9Nd5Y+cbQ92vZkyPp4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1K2picUDyexuc8vm
 JGa11vWEcgZWgBvLMfKc/bznVm/imcQxbBpVEzSL9gNJEi1qNp2Kzb8h+McKt0XLUmR3SOT0
 gubDEtKpeTJpINpotDFibrd8tWsGup6WEFbA3Pa/fC9MiyDpjivxopJUeCpezHBVTyrpPX+N
 LsNl/ysYucamFtqspZnF+c5xK0z0NLjurtGw1k2B37MdVmqVuttL3TuMROjbUGRKmu1YTeLZ
 38=
IronPort-HdrOrdr: A9a23:46ZM7K2WVtoCWEMJ4TUOtwqjBVRyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YdT0EcMqyAMbEZt7eD3ODQKb9Jq7PrgcPY55av854ud3AQV0gJ1XYGNu/xKDwOeOApP+tfKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52677731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGuqkWfNwPm1HqBrYFEN7LA4iuC+8ydsZy/Fq6sQV5KT0bu7KXGTDpok22yllty3yJFe1hbBD9AcpPgU4E/jwzBdOQnVppIBSdSBMfIseK6MvSWp4XyL1kp5D/s05f7JBzuGEtcteYIz0HmGxuPqDLG0Gjc9lwfkhEe/42nDCRI1BpaRLAcBTtxW80pig6GTOPfpVeeE03tFXzZ1O6JIaYRaGJgV66NplCCuXC7NlnisBSrZQhlScglGIFn2DGS5ucF+Mp11bKT8uXmfZXaRVWccQ+wXEmuNDG/duoUMQy6Ba2sbJK4B/OxKTMu1+10080BOKjXJDR9xhfqodyZ65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=G/nGGELEptmYClFcx/LRVXVpbY27RoS9J+An/txk4a0=;
 b=KdyVLNA1x87IfId71rOzAgH/b8Rnab4dnzkaB3iy2bTf+4IvsM+FcWhaRDmyk+EVYYwhAg8awg5vU+w3jp/eKK1ku9BBiq4BHnIf4eAAVwOiFZY55XfKHOpnO5To6LOb0uJJON1NIWk4dD+eQtVhnV9t9loXsvmbmEJtdRrD8D8PUwj7wnHTsYU/iDQLmjwWcqk7YWK++j27PW7gzFgUFsRIgCWBSNxsDMQfKkCPXju6k7efzONBYVcKWnu36Jf+/U/iToqt/htY88VE3DsSAx4LqSXLOlBPs3veWdWvGP4YBf9p4kwtqi2XhlCzbhK+NiOnJGemgd40DJgFdDcDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/nGGELEptmYClFcx/LRVXVpbY27RoS9J+An/txk4a0=;
 b=QXRIOo99inXkqHI0/94CdjkOLjH99S5E3/GROqc5pc3mDmqiTYM4p3jDmPmZ4Z/q04pafa+ARV0sDK+DgZWOWufkbDPDES0XwDrVT2GIug1Op06soZueTvpM/ccvbhokJrYIZXPzU0oG9OpYc3RBbr2NscSCwPH+K9nCTIbJmMc=
Date: Tue, 14 Sep 2021 12:00:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
Message-ID: <YUByvkKO+NlIjB2m@MacBook-Air-de-Roger.local>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
X-ClientProxiedBy: LO2P265CA0368.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b3b073d-0636-4e5e-536d-08d977667ece
X-MS-TrafficTypeDiagnostic: DM6PR03MB3484:
X-Microsoft-Antispam-PRVS: <DM6PR03MB34843E26BA3956ACA7FE3A808FDA9@DM6PR03MB3484.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdGmu3mD4wF78v3CZ5OIVSPp7UoK5iRsJzd6cYUoM4WnLTx/f7iVAJDQeu4E1OwDM+/ZgSuO513lg6pDkyR59PhRK+7h8MMnhX7QNr0ccwGtkLxLHlyaP0pjsw4FeEZrEFu8D+1GhAEJQEGST7oLxBb2u2mdw2uYwf3lY1X1KLgTUVyRTn3BWwIQM5rtp+ocT8tJLFsh6P6vUg79A6e0YNX3Tc3vvofvX7zE/BMlZlwM7/SYAx7qKEhbKq0LgIu74uAFaZHgJAd+1yT9VBFjJYKYNIpCnVBQ+0vjLquE7DVjOR/ar0NXXXUaNFN+eQDe7HrZr2HQEcy4agWg+jzhHijYR8f/XtxDLczPJHYwOAY3i/cfA15I8+RWW/knYTcPoorJHCodtP/sjbeXom2g+v+y0m9Rcf4QGuOnYJUjhTcqEWuGQ/t32gVu/xaYukcrQYi04gevxDUCjuwtkk1oFfYjAmCa9Uv6s5QIdcodU7bfXMj8RLRgO57sojpP/gkb+SflUdyDSR9KNtK76UeSAaTohgrPHBLim/QocgWhAHzOzd8DoElnjLptpT8Z0yu6QY4X0sInESxOwzQY4cppFwKz5ESbBouMqSoPZOKQ8WMQHhz7FgWMmkc+dnQxdJvcyFl9UDoy6z1vxcnMqj9RJyRH+nP8lJBmARVreM5OZIopL1oJlTC8nkhkr6yCOppCROLGefmr/woP+uBnEXGnVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(83380400001)(26005)(478600001)(9686003)(86362001)(38100700002)(186003)(316002)(5660300002)(6916009)(66476007)(8676002)(6486002)(15650500001)(4326008)(85182001)(66556008)(6666004)(66946007)(8936002)(6496006)(956004)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Znc0WHFadWdBdWh1c21Tdk53SlZrWUlmSGo2WnlIYXI2NXhaOFErZTBPY3Uy?=
 =?utf-8?B?Q2tFUTZOcy9tdHRVNGszdjV4b0R5bUpzdGlpUXp5bk4rL05BUlpwOGpGR3Qx?=
 =?utf-8?B?ajlJMlU0R2c5QXlDTXZjZEx5T3hsWis0WXFSVVh3dkgza3FKNURqd1hlVGFl?=
 =?utf-8?B?Skg1bkNSbktubG1BMVpNYS9FM25CUVFpWmZxK2I5VGFCeTRrYzV1RTdCOFRu?=
 =?utf-8?B?V0F6ZWpjcm5jOGs0YUMrR0ZaYWtVVlB5c3hJYXZtVm9KMHBWamVscHpqSDZQ?=
 =?utf-8?B?ekpKKzJwOFZNY2hrYTZtZm9uYUdqNzNqaVFvMmdjaEp0NUZPQ3RCQ2NUTjlJ?=
 =?utf-8?B?VXhyYy9rNGRSNDJBeWR0MGRRbFpKRUJwZXZtT1pza0doWDRNOS9kUkY0MlJu?=
 =?utf-8?B?S0hIcWFJM0lIL1h2WlNPbEpndWZMQkNINDZWTjhYSTN1R1d0Nmk1d1hONnJB?=
 =?utf-8?B?WXJJMWxINEtSL0tmcWxYK0RxeGVwNWdSYkVzRDYra0N1bCt0Nmg5YnBHVDlO?=
 =?utf-8?B?QlRVZUNGbWpJTEFFdjlISlNVTDVCTE9mR2p4dlNtQ0U1TTVQVWJpck1IbFFM?=
 =?utf-8?B?VzJNN2pWM2tTcmhmK0VpUW9rS0MxT0R4V0U5VFNpcmlLTS90RE0zUkFXcmJC?=
 =?utf-8?B?eVVLeXkya2VrN2orbHVBSmt6cmk2YmJyekI4OE1iOVJnY2VjSXovZUhwNjdx?=
 =?utf-8?B?MStPK0swN3d1K0JjSklYVjNwTnBzUDJTU29qenljS21hU2RQTjRKK1pTdSt1?=
 =?utf-8?B?YzV6M0p5NUtCS0poN1NMc0tOTDB5dmZxT2Z2WEFSQTI2dElvMmlaUkk0UUlS?=
 =?utf-8?B?bTh5a05KaEsxbVQ4SFNuUjlQNkcvdXhRc3JCeEl5My9QbGh6eHV5NzBLZi9m?=
 =?utf-8?B?VXFtWFNXWGFubVB3S3ZZMW1qSVJMTGNxZUlTTyswWncxdjcyd3lya1pjb1hj?=
 =?utf-8?B?bHJjZ0Mwc1JjMmZld0tyWFRKRkZCWjNqTkNReWZ5N0J1ZXpqRzA0UUlNRUVi?=
 =?utf-8?B?OGRyTURzWVlRclFzSU10SXZMZmltQ21aOEFZZXk2TmtDalozdDJUSnljWGJj?=
 =?utf-8?B?RUY4am5yRUxLZTlzR2U4b3llbEhCMFZhNVc1cHdzd2JZVVRldmdXdkszMzBz?=
 =?utf-8?B?cHNJRVpHUDd0Sm04TUh4c01ZeWt4dDVET3NvbGI4ZTFWVWZnODhGZlBxYkVI?=
 =?utf-8?B?S2t3Q0RsMFhxL1paOGdyN2w4akRPNmhvUFRwUmFjRkFrd3VEKzhyUlBITTZP?=
 =?utf-8?B?bDV3bHo1dEU5ZHNMT2J6RVFyUDNiVEhacXN1R0JwMy9JVThIZDJlak5WVjN6?=
 =?utf-8?B?NXdQWEdrd2lFZmFvNWVJbFJVS0lZVlBYQzhsZzlLOVM3em52ZzVLN1FacjJV?=
 =?utf-8?B?Wm9QdVNxRldvajVKMFdDaU1zSFJjN3htUTBsYm1Qc1lwWUJKM1BuTTY2V1Vu?=
 =?utf-8?B?MGE5eVBQZTQwNUxxSExqR3BDanN2V29OUlFIRnEyTlh1OHB1VUhKUVdsRW5G?=
 =?utf-8?B?aEFhMmxSTlJhWDV3SDNTNG5vTHRmUjkxamRHZFdZejE1Y01Ha0JXR2s4VWhZ?=
 =?utf-8?B?NWUwazVHbG95cW5FUnVGcHVVZFZiNjFkcmZVMnhtM0FhZCtTSEdxMVhoWFZZ?=
 =?utf-8?B?RWxLTDNWT2lKRXdCQmM4YlFpOExtRXY3NTlXd3RNWUM2ekx3Rktwd05IL1NP?=
 =?utf-8?B?OXRyU1JzK2E4Rm5INmVDN2NGMjZ4b0JRYTRDR0t2L3Eyc1czeGFEWER2UHYz?=
 =?utf-8?Q?YkXh9MG901fFeoHaE9RBpIPaGNkFRZQ65Z3OBoP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3b073d-0636-4e5e-536d-08d977667ece
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:00:35.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vAFlwZdhsbDxnThxK2ZLvMWHLWFvnZsMi0nPIy9wIAX69MKkRQydFnOpHd3fUmWIjtpKI7QVVM/M0uY9p8vQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3484
X-OriginatorOrg: citrix.com

On Mon, Aug 30, 2021 at 03:04:55PM +0200, Jan Beulich wrote:
> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> console) are associated with DomXEN, not Dom0. This means that while
> looking for overlapping BARs such devices cannot be found on Dom0's
> list of devices; DomXEN's list also needs to be scanned.

Thanks for looking into this, I certainly didn't take hidden devices
into account for vPCI dom0.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
>      would make the diff difficult to read. At this point I'd merely
>      like to gather input towards possible better approaches to solve
>      the issue (not the least because quite possibly there are further
>      places needing changing).

I have a couple of questions, AFAICT we currently hide the serial
console and/or the VGA adapter if it's in use by Xen.

I wonder whether we need to add vPCI handlers for those:
setup_one_hwdom_device will attempt to add vPCI handlers to the hidden
device because of the temporary override of pdev->domain done in
_setup_hwdom_pci_devices, but I think that for hidden devices we
shouldn't add vPCI handlers. We should instead block PCI config space
access from dom0 to the device so that it doesn't mess with Xen usage.

It's also not clear why does Xen want to have those hidden devices
partly controlled by dom0, as it would seem to me that dom0 interfering
with hidden devices in use by Xen can only lead to trouble.

Thanks, Roger.

