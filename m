Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7504D020C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286145.485529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREjO-0008SO-Pm; Mon, 07 Mar 2022 14:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286145.485529; Mon, 07 Mar 2022 14:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREjO-0008PB-Lz; Mon, 07 Mar 2022 14:53:02 +0000
Received: by outflank-mailman (input) for mailman id 286145;
 Mon, 07 Mar 2022 14:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nREjM-0008P5-Qm
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:53:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46d35838-9e26-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 15:52:59 +0100 (CET)
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
X-Inumbo-ID: 46d35838-9e26-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646664779;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ltg0mwKBQkFH4KWst5CWdgvnBrZ7YydBF5TsFQq2Hx0=;
  b=aPXuuCM/tb060Dcsahkdlam9Y+vBMf4BbzJlgEkq/AFAkVG1BhiSUVmG
   eau637F8NrSzdA8AKzPI/zeZpbQvzVvCW61O9odP1YN7fyGXy4nt5DpRG
   EK5yNaI8FdLsKgXdrhsfZC+HCQfNso7c6q7q4lEduMvVTbmlDpMXzid4q
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65095192
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TNY946lUdkduikbjzcWzlQHo5gyuJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbUG6Gb/qIZzamL4ojPoq/8kMO7JLWnYJmS1dk+y42ESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1zV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYWC4kMq7XquIhAxB3NXE5DZdD2oLmGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6uGN
 pdAOGAHgBLoOAxCCnRKEJECgP6DgVPDbWAfoljMnP9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcJ0WPK218LhtmlL77mUVBAcbXB2gvfSng0i3R9V3M
 EUS5iMoq6Eq9VeiCNjhNzW6qXiIpA8BWPJfFuQ77EeGza+83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LS1GvbGWUkCbyuedghXifhgvKE0/RBZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2KBjrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuqzt3N702wcH83wdG9OFoSLLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp2k/WxS4y6DaCEMrKih6SdkyfdoElTibO4hTixwCDAb4llU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI9QDBxU6KKmOh5E2Gn9owM/tr1E
 riGchYw4HL0hGHdKBXMbXZmabj1Wo14o259NispVWtEEVB6CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:CZzNqqv/TGh2Ndy/D8PoYW6m7skDctV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urtBEDtexzhHP1OgbX5X43NYOCOggLBRuxfBODZogHIKmnT8fNcyL
 clU4UWMqyUMbGit7eY3OBvKadD/OW6
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65095192"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fn+lNGxfpJrkpZZc+62PZAOz8tGLdXl7MVMjBJ1z55lgfJYszqRwnJk4ZzxtUnlEawi/EPZRVV+Axw6m4nAB2GX7kExqB+UvM2ZxmFDnPpvAc89c39NBvWk0P24Mqvs8ZHWTO5a6pll4Dh2AdHN/MyR7gN7Wvrxy11zM5iV7qPg9ozonGL1qTPFmBLDsMFwyqJuuHpZpN7iODB3u6KbmRpi1OZfwJoMKfrg32hTfGCj/4PuRaPnr1ijkzTrZu4SLRfp7qNxxxV/hMd4L2GNDj1+/5DM8hwB2to4KoR3SwrR7QczZEY475KKaFWK7WUBPxG8AG6VpbelY5qtHaZ5YZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kICYxlHhD0Z4fIu/g+eTvrum3uMuVKuRJuqM117DqPM=;
 b=bw/vNOeQV7ouYKuyunphuCHL2Idn3mYqc4OdJggja9OitlonPOYF2SXdTzgFj2Me88UU+MsZvY7t/5cv6OwDBVQlsG2QRE0soxWTf62t5FH95414hpP+UMSuN8tT3T8KX6lPw4P1oqiL86cQyE6AtBMEnx+VIsR6pORDNX0VIlainLmUjHlRhEXtEBcfq6kprzOjkW2mOB8jEwdTAcJbPJHJ+Oiu63UFYRsgz1/diK0eQLtUfp2j64FhejJurqVfThNwrdU6GPdRgVClqPqdfophIGNQoWT1rOhZDLT9Ya3+FHFClj8NpYdF1bLGNX5y6OYQYsglq6NyGqXJqwnmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kICYxlHhD0Z4fIu/g+eTvrum3uMuVKuRJuqM117DqPM=;
 b=IU/g/0LV8aLBM4PoA6qUJ9aFZh1Pl5nfSwfxLox4LjDeEtSLT4ZrHoaSeqUANDTtJVAPaSBQ0EJG/teNsMfNI2UfVQMEAtaKUXplU0NXDxYGqGhhmf6NwksrtW0e2B1+2fSoUH+uyrqpyEEY67C3of/3i7uMUmNYB1KjsDjUZGE=
Date: Mon, 7 Mar 2022 15:52:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrea Stevanato <andrea.stevanato@santannapisa.it>
CC: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "wl@xen.org" <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: Network driver domain broken
Message-ID: <YiYcPgVTpA8//ojA@Air-de-Roger>
References: <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger>
 <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
X-ClientProxiedBy: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aab801dd-2275-408b-ee57-08da004a26dd
X-MS-TrafficTypeDiagnostic: BYAPR03MB3718:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB37188B95751A1271BD77DE508F089@BYAPR03MB3718.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0lrRNzN3qSIH8bnLm/95H7+z3sWHbXVrFduU3FLQ3a0kelLS45DImlpW711uWETRgbrKlwg/rkFBU5wROdsc6jvnC+9Z9PDooVROfu4Ajj+2aCpy7sflQ5ChBfTg7ysWMjb5IfJ2jg4jNg1wtsqxOLKjUft2+n8wUfi12Tr1eDst4tDGw+9nXKT91ixORTmOYvSqTFN9T9p2k3UFlNWjOfd7yg+uqDZRFlUO+CWFip+C69S+jmm8fe/TfRGHoDtoCtDT0FCNDEnA0RcktHTkla0+JAghDOjgg0JDmg+Tx0YQh246YmWK3u2rw5kTMdCsHnYSn3aP+L1Vm3HarOt0UIp7Vc0jawSWcnA6vCPWJP+74qN/YLsk0fN4PiGKfNJ9hmQXUQuf49HUDYcBKAnAs09aJKuy+4HjR6o1FFtwOOwCNsbiv1P5/3jinV/5awKtU2V1t+TLte+1WAbHD2IBD+EUmLGccTzk+0+SwRidxmOL4N1zY/g+xSWfT+lZXKem1zOefMS1pY2nQaPQT4lIYwy1T5VazZdFDdujqMzlUtAmCDc+UsApxTkTcCGWhro/2ofXbLGNCrqENPwWqlpliYcikqhUyDcKgOuMdslE0e8RfLOJmfmzTyDWCVvKaDof+It9AKIz9w0cpWOfQz3xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(9686003)(83380400001)(53546011)(6666004)(107886003)(26005)(186003)(86362001)(2906002)(8936002)(5660300002)(33716001)(38100700002)(6506007)(82960400001)(85182001)(3480700007)(6916009)(54906003)(508600001)(4326008)(8676002)(66556008)(66476007)(6486002)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0NVSG4raEtwNi82akcvR2V1TE1QczRQdTFSRk1tNTd4ZUZGVGwzaVgyM24w?=
 =?utf-8?B?MWFwbmZ4aWhydnN2UzhiS1dHNVBBMTB1VmN6M2VFZG40WkRlYWdFaldIVzUr?=
 =?utf-8?B?YzFVNFNKUUREeGtRaVdjUkVaaTN1b3BWRHNDNzdpWTJCZUxRZldneXBVYnVh?=
 =?utf-8?B?OStmNGpJOVVOa28relYwazE0bkZSTGpTbVVzQm5WSTUzUUxLbXhJOG9ISnRZ?=
 =?utf-8?B?UklTa0s1bURXL2xQL2lNY1pXUjMvaGFVTG9VSFVlTUc2d0xsRjRvK2V2cHo0?=
 =?utf-8?B?S0lGRVJ4WE50RmllWXhRT240MDU4UzRJRHlMQ3pwckpaeUdJV1lzeXZ5NmIx?=
 =?utf-8?B?U0kwNGpoTjNlL3pibG1uSE1CbGc3ZWVzcEw1aDRNYXBxNnE0WkpPWXg1NjFJ?=
 =?utf-8?B?a0xhSng2V2FqV0pnN1FkN1ZiRncwRjJSR2NIMTNacVVrWHhUMVZYWkhtekJZ?=
 =?utf-8?B?bTlUclJ4bGFSdUU0K1BMRDNKa0hyUnVBNmdGaStKOVFMTlEyWUlUb2F1VFl5?=
 =?utf-8?B?d0luRkRhcGo2anJMVDFpZW1KUHpKdkR5YnJ4QXREMW5DMjNsSEZMKzZTdlVF?=
 =?utf-8?B?SnpDSFJxT25jZEdYbUFScEY0MDZxczZuSzR4ZmtWKzNDYllDeVByUklQYytW?=
 =?utf-8?B?c1NyWkZaL0JJMll6TnNqdVY3dlJDdWVTT2M4VENoVXpjVUhzdHp1TXVhNVdK?=
 =?utf-8?B?WjlQVUJsNXA3dnRKT2NsOXRGNWswVUlPc2N5eCt1WDhhUUtuV0IzYzNNYXVu?=
 =?utf-8?B?c0ZOamNiUDBrQlF5N29GcDRoMFBVSTMrWXhpOHVMVHJBemQzOE94YWozTG5p?=
 =?utf-8?B?bC8zclM1d2Zaak5DM0x5bWdMME1peDNIUmR2SmZRQXJGMVZraDQzR3ZoMVFV?=
 =?utf-8?B?QTN4ZzVBYWVncWxsUGpNNEpLMEtiZ3hqZGVYUUFTYVBEVUJHa01xRGZRQk1R?=
 =?utf-8?B?MzBTT3p5MjhZeW5xV0xBc3VuK3BTY0FuenIzWGtVV2RuMzRVVmxFM291RHVM?=
 =?utf-8?B?QWpzQTdqckkzRmhQTEZPN3VaOFE5bGNNU2dZazlEc0lYeHVJYzVKOHJub3k0?=
 =?utf-8?B?SXp1eUpIY1VCaGFVNXBCWEYxRmk4MVJDTDVxK1FveUZtWG1lNnFCYlBRN2Yx?=
 =?utf-8?B?bE1NbnNhVVJzRGRDM0dBY2NqWm5ybFNnZTVxTGxBUlVwaFpoNFpDblRNVlF1?=
 =?utf-8?B?QUwzNUMyYlBITUljWnZGaVVMK05qV015SFVwSmNxckZmS3NVYVExTXAydGtl?=
 =?utf-8?B?ZG53ZkoxYjNPY3hyU2JVbGVQWmxRbTd2VGpWUENnOUFBcHFvdFBEWm9tV2dL?=
 =?utf-8?B?SWZHbmhqZHhUMWlUdUdFdVdoSDVXQ3huWFM5aUdHVDB3bHdjR3pObjgrd3Yr?=
 =?utf-8?B?T0g0SWJoQXlSRmFtbUFSekxKcGhOeUpOL0V5ckZ5NjZXU3ArRzlzamZCalg0?=
 =?utf-8?B?L3Z5WUZjb0M0dW9kR09Neko1Z2NTbzY1d1IvUnJpYzZJbzFxQzV4eFM4aURa?=
 =?utf-8?B?VEJWSmxsZ3BxeVBaTm5xTTkvbVY4Vm10L1hKMVJEck02OTdEOFBTRUVmVC90?=
 =?utf-8?B?Nm1talgvRHhmcGVGZXdZVkNxVW1GU3cwRGc5bVNqUXgwVG9sbXdab29Pa1FQ?=
 =?utf-8?B?Vmh1bFRNTmRyWVZweDFSVkhXSmdTRFV4bVNSRFp5RVF0R2M1KzNaZE9VZ3lF?=
 =?utf-8?B?WWprdnYxSWF3SDh0bWxhandpWDBsKzdOWVhRVk94SHg5aE15U1dQblkvNC9F?=
 =?utf-8?B?RWsvLzFqRDE3dHBiRmpYeVdLMExuM2ZJdXM5YXB6dTN2UVRwMjlRU0t2OVho?=
 =?utf-8?B?WlhPcTMxOW5NVjhZQXRtS0ZKbGpVYytjTDFhWGxRbXAwdGRlbmNQMTk3MXJl?=
 =?utf-8?B?bTlKa2hMNEZ6SkVjbUZ4V2tvRjJERXZIR29EUk0zZHZEd0F4bUJEZmErT2JC?=
 =?utf-8?B?Nk43Qkwxc0J5UVV1eEJ1MFBwb1FoMlZkdGJkTGxJb1VqaTN0aU5uT05jSkZz?=
 =?utf-8?B?TUhhV3F0TFV5TFZTK0c2N2ZxaFRoTEVUZVY2bzcyVEZmdFFWa0hSV0xNR3Ax?=
 =?utf-8?B?dFUrV3luNzJJRkN1N2tWeThVNDZrUXlBTUtQR0psQzVNNnp6aWZmVVNLekY0?=
 =?utf-8?B?QjVHNDFCem5hWXZDZEdldmovaHpRNlZoenJLazFuNDk0RTBKaVJWSkp5QU54?=
 =?utf-8?Q?VS9m0OrF8POx2+Z3Tkb7WKg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aab801dd-2275-408b-ee57-08da004a26dd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:52:50.7098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cz5u+mkZA47U7klKpoBrSC6Rc7laWxdfyfozDZuv3oaxJL2W9DU6LADpDNE92Ki9qV+eiM8HaMHJIrSbyfiTfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3718
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 03:20:22PM +0100, Andrea Stevanato wrote:
> On 3/7/2022 12:46 PM, Roger Pau Monné wrote:
> > On Mon, Mar 07, 2022 at 12:39:22PM +0100, Andrea Stevanato wrote:
> >> /local/domain/2 = ""   (n0,r2)
> >> /local/domain/2/vm = "/vm/f6dca20a-54bb-43af-9a62-67c55cb75708"   (n0,r2)
> >> /local/domain/2/name = "guest1"   (n0,r2)
> >> /local/domain/2/cpu = ""   (n0,r2)
> >> /local/domain/2/cpu/0 = ""   (n0,r2)
> >> /local/domain/2/cpu/0/availability = "online"   (n0,r2)
> >> /local/domain/2/cpu/1 = ""   (n0,r2)
> >> /local/domain/2/cpu/1/availability = "online"   (n0,r2)
> >> /local/domain/2/memory = ""   (n0,r2)
> >> /local/domain/2/memory/static-max = "1048576"   (n0,r2)
> >> /local/domain/2/memory/target = "1048577"   (n0,r2)
> >> /local/domain/2/memory/videoram = "-1"   (n0,r2)
> >> /local/domain/2/device = ""   (n0,r2)
> >> /local/domain/2/device/suspend = ""   (n0,r2)
> >> /local/domain/2/device/suspend/event-channel = ""   (n2)
> >> /local/domain/2/device/vif = ""   (n0,r2)
> >> /local/domain/2/device/vif/0 = ""   (n2,r1)
> >> /local/domain/2/device/vif/0/backend = "/local/domain/1/backend/vif/2/0"
> >> (n2,r1)
> >> /local/domain/2/device/vif/0/backend-id = "1"   (n2,r1)
> >> /local/domain/2/device/vif/0/state = "6"   (n2,r1)
> >> /local/domain/2/device/vif/0/handle = "0"   (n2,r1)
> >> /local/domain/2/device/vif/0/mac = "00:16:3e:07:df:91"   (n2,r1)
> >> /local/domain/2/device/vif/0/xdp-headroom = "0"   (n2,r1)
> >> /local/domain/2/control = ""   (n0,r2)
> >> /local/domain/2/control/shutdown = ""   (n2)
> >> /local/domain/2/control/feature-poweroff = "1"   (n2)
> >> /local/domain/2/control/feature-reboot = "1"   (n2)
> >> /local/domain/2/control/feature-suspend = ""   (n2)
> >> /local/domain/2/control/sysrq = ""   (n2)
> >> /local/domain/2/control/platform-feature-multiprocessor-suspend = "1"
> >> (n0,r2)
> >> /local/domain/2/control/platform-feature-xs_reset_watches = "1"   (n0,r2)
> >> /local/domain/2/data = ""   (n2)
> >> /local/domain/2/drivers = ""   (n2)
> >> /local/domain/2/feature = ""   (n2)
> >> /local/domain/2/attr = ""   (n2)
> >> /local/domain/2/error = ""   (n2)
> >> /local/domain/2/error/device = ""   (n2)
> >> /local/domain/2/error/device/vif = ""   (n2)
> >> /local/domain/2/error/device/vif/0 = ""   (n2)
> >> /local/domain/2/error/device/vif/0/error = "1 allocating event channel"
> >> (n2)
> > 
> > That's the real error. Your guest netfront fails to allocate the event
> > channel. Do you get any messages in the guest dmesg after trying to
> > attach the network interface?
> 
> Just these two lines:
> 
> [  389.453390] vif vif-0: 1 allocating event channel
> [  389.804135] vif vif-0: 1 allocating event channel

Are you perhaps using some kind flask/xsm policy different from the
defaults?

Regards, Roger.

