Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E8333EF27
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98628.187158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMTzl-00006Q-1C; Wed, 17 Mar 2021 11:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98628.187158; Wed, 17 Mar 2021 11:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMTzk-00005z-UF; Wed, 17 Mar 2021 11:05:44 +0000
Received: by outflank-mailman (input) for mailman id 98628;
 Wed, 17 Mar 2021 11:05:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSUP=IP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lMTzj-00005D-0w
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:05:43 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 129053de-0480-43bd-888d-03877a60ed45;
 Wed, 17 Mar 2021 11:05:41 +0000 (UTC)
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
X-Inumbo-ID: 129053de-0480-43bd-888d-03877a60ed45
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615979141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JjifyQYBWEZf3votvo8D/SBs1EAoJKrZOarp5mqtzfc=;
  b=eJhQ9hv0d3kuBjJTMNt/bYj/dylP+5BFk8oHGp31s3i/ubvsB/EyCuYI
   MqAhu5gvvVL6nuSq/XmOZi2RURMc13wRuY+dN0cvYkmF13zP3kCOeXz46
   0AZQpIehXLdlq6lEz5HFyTLQU+Ngtq8WNkgb9Ad0mevx5TbovlPsselvs
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q3PJ0H+xSkxicawBPLIxgUufCGJmCyQkQI3Q5pG2O/H4XcawlBv9/Ol0ZFj1fxDkGr0BA0ao6J
 mnaxyS1QbndzfnP30xIun/Jlkd9g+FJ/aVO1HPmKthnB3LWt3FnizXGBS9I8ovFTJNrMCGLB5s
 4oM6DAyi18AHztOuTQLWNl6bEn4Fx2wPN7usb0S1JjxZTFyAGuDFe7RTHfE8Hbomz5a+Ukeaka
 3zdzWPFlZvsHxIy0jaiLstbO67nbPLhhadFQjZJortff5qeRq9fNZE1GqrT9RYaIthDdhf55RT
 ieM=
X-SBRS: 5.2
X-MesageID: 39376917
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4qp65K7UEVhalkalSQPXwU+EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbTqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+Lpf+jvfMk4/rZgNDOg4/5GC1/E+VwZPZMzzd5BcRVDtT3awvmF
 KlryXV7riu2svLsyP0+HTU6/1t6b7c4/tFQPeBk80Ebgjr4zzYHrhJf52nkHQLrPq06FAs+e
 O80CsIG8ho8XveciWUjHLWqnHd+Q0j4XPj1lOU6EGLyaeSKUNYeqgx8L5xSRfX51Etu9txys
 twrh+knqFaEA/am2DF78XIPisa5nacm2YokuIYkhVkIO0jQYJWxLZvmH99IdMrGSL3750fC+
 9+DM3Qz+Y+SyLqU1np+kZo29CiRXI1A1OvRVUDoNWc13xskGl+1FZw/r1Rol4wsLYGD7VU7e
 XNNapl0JlIU88tdKp4QMMMW9G+BGDhSQ/FWVjib2jPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyU1iGM7zM4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqbpekFCMGzYY
 fyBLtmR9vYaUf+E4dA2APzH7NIL2MFbcETstEnH32UpMbmLZDrq/z7fP7fKKGFK0dgZkrPRl
 84GBTjLsRJ6U6mHlXihgLKZn/rckvjubJ8eZKqu9Q7+cwoDMlhowIVgVO26oWgMjtZqJE7e0
 N4PffCmqO/rm+mwHbQ4wxSS11gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCARNjUcXMEk
 p6q05s8ay6a7ycrBpSSu6PAya/tT8+tXiKR5ATlumo/sH+YK41CZ4gRehWDgXEFxt8nC5ws2
 ddYAo4RkvSfwmey5mNvdgxPqXyZtN8iACkLYp/snTEr3iRoskpWz8mRTK0aNWWhgwvXjJQoV
 V0/8Yk8fy9sAfqDVF6rPUzMVVKZmjSJL5dFgyKaL9Zna3RdBhqQX2HgiGbjB8PanPnnn9i9F
 DJHGmxQ7XmE1BdsndX3uLR/FR4en60UmhwZnp52LcNX1juizJW66umd6Cz22yeZh8+2ekbKi
 jCeiZXCBhp3cqL2BmcnyuiGX0qyo41BPHUCK0uftjoqyqQAbzNsZtDM+5f/Z5jOtyrj/QCVv
 iHfRSJaBz/EOEk1mWu1z8YERgxjENht/zm2BfotjflmFE+BOffO1RgSfUwJcqG423tWvaP19
 FYgLsOzJyNG1S0TuTD76fdKwNnAFf0h0WdSukzs5Bava4ortJIbtLmeAqN8EsC5Qk0Kcf/qV
 gXT6t66o3QI4MHRb1nRwtpun4S0OmVJEQlsgbKEvYzUFEkgXjcJc6I6dPz2MwSK3zEgAPxPF
 WFmhcthMvtbm+m1bQADbg3LnkTQE8g6G569OfqTfycNCyaM8VC9kG9KHmzbft0T7WEA6wZql
 Jf78uTl+GaMwr+1wa4h0o2Hot+t0KmS9i1GgSCBKph9MG7I02Fhu+S2/GI5Q2HAQeTWgA/no
 1KdUsZc8RFhH0DteQMo1aPY52yhFkknVtY6SxgjXj31OGdkT/mIX0=
X-IronPort-AV: E=Sophos;i="5.81,256,1610427600"; 
   d="scan'208";a="39376917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gv+Uo4KTSQTAit3Y/Ara4j2Zln5sX5NvhPHSBe0a3rPi1bAeOusVgIeD5dn8JaZs0f2r6QKj64Y8IgRzg/bJ2IqVVURS6ik2RyMUssyN9G9MkCSZfwneQmWpROIdj41YZZ5bI1dF4Jkd7+GVXOYMk9kLK5w39GfjeQM5Bke3Lc3EplV9eZSvxqKP5yz1lyPhqJoNqEFj2FSwDWokqWJqkBcLg/gsergIpBKdCaWMqSpnHZUv2zgdiEIcy5Q1vF7Oe5Q3kg89OOMX/oLmEGTrEW8Z/lQwswBJUJqU/sWIqVCPnrQxkbJxbYvN7atyHjp+rQzMwCYb47mgbx1ar3gvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9NK4I28nJimLBCaFSNjZA+gzCPe3+u58agzQpiG2Co=;
 b=HNwwlyJMswgsdp+et6bRVWZRPehcc0WPIF2MU3tbdrifhdyBxr782ud0coUsr++6NDehK/eY4JOw4gXHkiig3PESP7+u60/7n47/aXd8wqt5O1gx56l9vl5SGCh9GlPP44Tk4VMn7fmBPlM1G0hvnjduxbhtQke5/Loh1VNT/CTlXvD74s+bnPFdqCuwJxjSrhvPPqgwTKlLUbbG3LPUW867KdWvXAPugY1kV/VsWGEAWd4pNE71p3ce2CmNyHEpG8SnEzRo2Nr3pJg/GukX6fI9W0wNt/gwkps+AIn0cg0jKMCVx/goVhyDKH5wxgS1NFknS5gdKgzxC6NVZhMpLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9NK4I28nJimLBCaFSNjZA+gzCPe3+u58agzQpiG2Co=;
 b=JuvPjs1qGxl8+boEJ3ymqFmbXcsiNcsty+sS/sP0tRZMc4dAxo2upNxcxEAQZU7ijAl60JPzqtpYuavV2DuC6w0Dndcchr3mB4rkzs/0wdk0ir1DDhxvOAgFLjNJYeGv3zmYXAG5TPY/HCkHEPUOVPpfCjGmQf8DYjge2cSKIrw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH 2/2] Revert "xen: fix p2m size in dom0 for disabled memory hotplug case"
Date: Wed, 17 Mar 2021 12:04:01 +0100
Message-ID: <20210317110401.46322-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317110401.46322-1-roger.pau@citrix.com>
References: <20210317110401.46322-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53f24b2b-06b5-4f3d-e6cf-08d8e9349889
X-MS-TrafficTypeDiagnostic: DM6PR03MB4137:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB41379A26427327CAC69F9D2D8F6A9@DM6PR03MB4137.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJaaDoqe0+GXF/dWYvL9HSzoSYdxwiFtPmWSEb/RuugAPzPKEqb/AuqiH7qporA/tAmF2TschW5o1gL9MYMdlXLlgWyuT3ldM5YF5r3A6BKqgQcwiristG0Y+kcJvHuvCZlrumRbsGJe+wvalYgpjHAVWOsd8nOeLki6DyTvAFPsd91j5f8jAbWGaCtQEnmCfu1HiFu38tjZNP8H+k0ShjqH3OkZ4mzlyLhGyMD08wETbdhGqi3c06eaRJtjiS0KxqkIUrWT1+CnxAcW7dWjNG/nSK8P6jQPmb9hyAk+EjO6lPkFZ3pPC46fCslcYgaAzzbkqANX9EPjzab0JoDmgbWN6CUzPTlsXrC3sVNwAu0O8C2nx7IadraGxuzJB5hbQTfF8ueMBcWa/sqAYu8Pz0RhSuG+F8xkeM4bBhCqgFg5ibnZ3iMnwFnGCT5n0TQsMXPDPfd6p86fPwR9O+QmUNMpNVCHDGebb+5G1im7LeywBWuRALtqjkMt19d3m+fRZIN1ENvELIIOgbho1kMoYNzNuHvTvmuI9QvT3/Sk4eeUtcs507GsOv/Pzy4tLhoP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(36756003)(4326008)(2616005)(956004)(83380400001)(8676002)(8936002)(86362001)(5660300002)(66946007)(6486002)(66476007)(6496006)(478600001)(26005)(16526019)(186003)(66556008)(1076003)(6916009)(2906002)(6666004)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QnFBYTIvMVB2bHpDbjVlaDk3SDZVODZ0OU1raDhTcGs1ZGVybnkzU3pZdnJy?=
 =?utf-8?B?TG5yQkExTURBdmlsRkI1TVpJb2QvTjRwa2x4M2NkL0I1aHRJS0J3VTVZazVH?=
 =?utf-8?B?WlZheUlqR3Q5cEY4UzZBYXF3THVYQnZlSm1xb1FuM0RLMFhJOEx3ZUR4dGFI?=
 =?utf-8?B?RTREaWVQcVRRemlpM01OTmRUQ3hselFlVitSZTRsWmRxeFo4MjlnbWNJd21x?=
 =?utf-8?B?QnZTSHByelBwZ3lvck83T0x5WlNiRXFJU2d1ZkV3TlFDMjRneHE2L3MxaGpD?=
 =?utf-8?B?OGU3VWVSVlJmVDhuR2xjVWprVllXeE5udXJrNmtlalZPbFo5QXNrWmo5ZSsw?=
 =?utf-8?B?cmdtQXpTeFVXY1RzZFduZ2VWd0t3bjhzY0FxdEI0ZStvdUR0R2dmY0U3UkFQ?=
 =?utf-8?B?eU9BWG1nWjJhMmpEWEhnc0c0RjY2U3JtODIzblBCWXdXczN3aWk2eE1oa1ZG?=
 =?utf-8?B?bytPWEZTeTRia3Z3NnhrOUJQZGt6b2FmZ2tTeHpOdG10d0RsbzIxcy9FUTI5?=
 =?utf-8?B?ZW1vL050bDZSNHpYTzcxODgycVhwZEhFNFZ2Y0VOT0lNb21OZEF2dW5TT0ly?=
 =?utf-8?B?Z2FVeXBRd21CMEtwdVFsQ2VwRnRYdXNacmM2NkY1Zlh5WGROc0hReUNHQTN1?=
 =?utf-8?B?Y0xuc01zMGhzdUYyL0YzbWRyTnFRTjZmOFVvVzh0U2dLaTZnMW9XbjdZTUpL?=
 =?utf-8?B?TUtMaUJJV2J1K3FJN0o0b3pSUzZST1pST0svYjhldzhhTWR0cnEyaHFDUGFi?=
 =?utf-8?B?MXhuMDdkcGVzTkd2NWpucE5PRGVIN0NzWUgxcEtRUjcvK2tEUDJVTFU2VENZ?=
 =?utf-8?B?Z0JlU01tWnRDR3dWWmtZaHFZNHZ0NlpLc0ErSmUvSnprY0MzbTlmRHJvdTBF?=
 =?utf-8?B?S1o3Z2NhbWlLZEorMmNvTm5SQkxJeVcyY21wNEF4Z05ocFliaisra213by81?=
 =?utf-8?B?M25nT1NYMGcxYXNnSERmSzhLWWI4eHhnZ1p2a1JBVVUxeUJTQU8xS3hoVmNB?=
 =?utf-8?B?Z3lOeWRvNmY5d2dlRDlQeS9WcU5lMjRuN24xWjIrVVhVVzdBUTVlaFJoSTBH?=
 =?utf-8?B?U2Q2SG42d0JZQVM3NkJUU0N1QXplZEJkZi9VdFdrZmYvc3ZFTjF2OXdRTkMx?=
 =?utf-8?B?dklidmpHbjlVaWFtSi9XMGxsdnFNeHdnQUNqYlphT25kNVpPaUpQYnAzOVo5?=
 =?utf-8?B?MWcwYlArWUpFaTFmTWtua0ZxS0lhM2UxWXN0T0o4MENQa0t0eVFlMjBJbW5u?=
 =?utf-8?B?MkRudDhLNEhUZ0lDQW1yRUpESm1yNHVjT0lwdkdMUXVoMHVXRmVNZnFDR215?=
 =?utf-8?B?Y3VqeEZKQy9GRDQwWkxUY1FZR05aLzV3L3krQ2JFYXNrd0ZIZTVJZnVkbVVi?=
 =?utf-8?B?UE1HQlhXT1hVamF2c1pzV3F3WmJFVFRDTzYyK2VtTnRwQ05oeGlMQmJobVY0?=
 =?utf-8?B?bzU2eGNVZmd6OTZIVzlSOFNrbFVpNTNlZDF1NFVpMW4zbUxIT2p4ZFNxMTVy?=
 =?utf-8?B?aC9GMzR4UHhJL1I5NDZSS0F3Zk5TQnpuZ1k1WEJYSzRiK0xrN3YxN3lIdW01?=
 =?utf-8?B?SmFqMnYxcmNOdGhnSGhyOEJDNVhpQTVHRjJONVBpRFFPenNaOXEwa2VYeERk?=
 =?utf-8?B?aHV6S2ZZWStxdlpWYStrZVVuZ0twY0Rxb3VPTUQrTE4wWiswcU5uaThjZnRh?=
 =?utf-8?B?eW5naUczYmd5NklMK0VFWmZGMnNVYmNBQTJPZld4Q0RUWWIzL3I1YzdhZE5n?=
 =?utf-8?Q?R5gB3gQBaIJvTW+GV6tzakGgipKPD4WoQmPFfRO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f24b2b-06b5-4f3d-e6cf-08d8e9349889
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 11:05:38.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14FtMN1D3ZYvIY54wPQHWG7Pi1hKZ8fqLXK/+0K1WLCYVPXCay0OADwfDl7BdmLj+BWuMFyjzrAl3RTONVZ97Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4137
X-OriginatorOrg: citrix.com

This partially reverts commit 882213990d32fd224340a4533f6318dd152be4b2.

There's no need to special case XEN_UNPOPULATED_ALLOC anymore in order
to correctly size the p2m. The generic memory hotplug option has
already been tied together with the Xen hotplug limit, so enabling
memory hotplug should already trigger a properly sized p2m on Xen PV.

Leave the check added to __set_phys_to_machine.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
---
 arch/x86/include/asm/xen/page.h | 12 ------------
 arch/x86/xen/p2m.c              |  3 ---
 arch/x86/xen/setup.c            | 25 ++++++++++++++++++++++---
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index 7068e4bb057d..1a162e559753 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -86,18 +86,6 @@ clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
 }
 #endif
 
-/*
- * The maximum amount of extra memory compared to the base size.  The
- * main scaling factor is the size of struct page.  At extreme ratios
- * of base:extra, all the base memory can be filled with page
- * structures for the extra memory, leaving no space for anything
- * else.
- *
- * 10x seems like a reasonable balance between scaling flexibility and
- * leaving a practically usable system.
- */
-#define XEN_EXTRA_MEM_RATIO	(10)
-
 /*
  * Helper functions to write or read unsigned long values to/from
  * memory, when the access may fault.
diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index a33902d05e45..ac06ca32e9ef 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -416,9 +416,6 @@ void __init xen_vmalloc_p2m_tree(void)
 	xen_p2m_last_pfn = xen_max_p2m_pfn;
 
 	p2m_limit = (phys_addr_t)P2M_LIMIT * 1024 * 1024 * 1024 / PAGE_SIZE;
-	if (!p2m_limit && IS_ENABLED(CONFIG_XEN_UNPOPULATED_ALLOC))
-		p2m_limit = xen_start_info->nr_pages * XEN_EXTRA_MEM_RATIO;
-
 	vm.flags = VM_ALLOC;
 	vm.size = ALIGN(sizeof(unsigned long) * max(xen_max_p2m_pfn, p2m_limit),
 			PMD_SIZE * PMDS_PER_MID_PAGE);
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 1a3b75652fa4..7eab14d56369 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -59,6 +59,18 @@ static struct {
 } xen_remap_buf __initdata __aligned(PAGE_SIZE);
 static unsigned long xen_remap_mfn __initdata = INVALID_P2M_ENTRY;
 
+/* 
+ * The maximum amount of extra memory compared to the base size.  The
+ * main scaling factor is the size of struct page.  At extreme ratios
+ * of base:extra, all the base memory can be filled with page
+ * structures for the extra memory, leaving no space for anything
+ * else.
+ * 
+ * 10x seems like a reasonable balance between scaling flexibility and
+ * leaving a practically usable system.
+ */
+#define EXTRA_MEM_RATIO		(10)
+
 static bool xen_512gb_limit __initdata = IS_ENABLED(CONFIG_XEN_512GB);
 
 static void __init xen_parse_512gb(void)
@@ -778,13 +790,20 @@ char * __init xen_memory_setup(void)
 		extra_pages += max_pages - max_pfn;
 
 	/*
-	 * Clamp the amount of extra memory to a XEN_EXTRA_MEM_RATIO
-	 * factor the base size.
+	 * Clamp the amount of extra memory to a EXTRA_MEM_RATIO
+	 * factor the base size.  On non-highmem systems, the base
+	 * size is the full initial memory allocation; on highmem it
+	 * is limited to the max size of lowmem, so that it doesn't
+	 * get completely filled.
 	 *
 	 * Make sure we have no memory above max_pages, as this area
 	 * isn't handled by the p2m management.
+	 *
+	 * In principle there could be a problem in lowmem systems if
+	 * the initial memory is also very large with respect to
+	 * lowmem, but we won't try to deal with that here.
 	 */
-	extra_pages = min3(XEN_EXTRA_MEM_RATIO * min(max_pfn, PFN_DOWN(MAXMEM)),
+	extra_pages = min3(EXTRA_MEM_RATIO * min(max_pfn, PFN_DOWN(MAXMEM)),
 			   extra_pages, max_pages - max_pfn);
 	i = 0;
 	addr = xen_e820_table.entries[0].addr;
-- 
2.30.1


