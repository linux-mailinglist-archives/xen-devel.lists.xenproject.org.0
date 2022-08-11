Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438058FED5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 17:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384676.620102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9oZ-0003pr-0j; Thu, 11 Aug 2022 15:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384676.620102; Thu, 11 Aug 2022 15:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9oY-0003n2-Tv; Thu, 11 Aug 2022 15:09:38 +0000
Received: by outflank-mailman (input) for mailman id 384676;
 Thu, 11 Aug 2022 15:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oM9oX-0003mw-8n
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 15:09:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b8465fa-1987-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 17:09:35 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 11:09:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5476.namprd03.prod.outlook.com (2603:10b6:208:29b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 15:09:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 15:09:30 +0000
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
X-Inumbo-ID: 9b8465fa-1987-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660230575;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TLGp5dnrcZ7yzcqXuBT5hQELMhz0zQwP28EYOVgCd/g=;
  b=GfvTaJ9Zlybc9i/DkJLQHZxcR38YzIQQWZQ407b0H7BOnSAyzvSOcPue
   SASzcvy8rQVA0qhsihkTv3uTrm1o4QWOljW2Fq33vCkRy0ZPeoqbgpHVk
   bRjrxIZNl0JNftMkkLI4SHKwEdv+ZPoUDmT+FeW5zU14VlkpzJeUHoXHR
   A=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 77888654
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A58hZEagft0NUloxe5CQQrWTDX17brhtdy17au?=
 =?us-ascii?q?qucoGZSiukq9fiXu46NDXwAis6AHD0hfc/YAPTNSyQyA8LJJEL3rvfrMoZWl?=
 =?us-ascii?q?SefGamrltzVA/lty2FL4rKfkbqDghGdupkEbhOKjuz0mppihBhyhfuZ13IRF?=
 =?us-ascii?q?kq8pmhrMcdmY/9c8rC9xhlUixnb2S6fJ8T9dpL8qtFwLguguK16qsFnh1yxq?=
 =?us-ascii?q?qHu78hRSwn8HiOS6eh9msV3+AjQqaRQu1L8zyKVWIt/AG45AnH5gCLE6EIEP?=
 =?us-ascii?q?LJY/KgSzISlH0uv58JfWcqeSLjrLeSUWrWfNHdG8jYddPrj4XtApIqe0FMLU?=
 =?us-ascii?q?SqkSA9qs0HhHGvrs7LmRTwbXuKZ6a5QHAgGfWEFwroSAOJsTcPWB+snAlr6v?=
 =?us-ascii?q?4S/OHIZ22unxzpHUeVlM9rT4E74apjlRfM1f2W+hNnss+vMxWEM63LzEw8Tx?=
 =?us-ascii?q?nroaCP+iU3hoAWmb4Uwat7yQXYmWOsQndJKBug3kt/9p0qpCVH8SlwMSet+u?=
 =?us-ascii?q?QRFBmvMnhKD3J8b4gILuMiLhbRTvHOfeuxUzCZnihNP1K6rYKoh7RkGI+FDT?=
 =?us-ascii?q?9m0Um6rfzoOcRLlCIutRtzoJ+YuKFkXegCd/IgZ4T2S/htvLKmytPOf0eF98?=
 =?us-ascii?q?BD2Yx4urPdk2e96u10PrIy/IKmr3MwiSHJRx2+B+68ajsv7CcuEv2hezuEdU?=
 =?us-ascii?q?oAU3DDL+JGeIyu2l8yeE1CXOPXZsSWTiOaqlxptprQSQ+mOZUy+FF9k6RFSA?=
 =?us-ascii?q?2fN0xmj5VvPuhUPCerC1N5b0PyYlPZL7EAu9cFXKYIZHe9NiKyIhplaY1UHl?=
 =?us-ascii?q?1Git6JtPMa4hT+dI5lYJXS3xbZ4qy8OBPOmKVOKA8FVlP3T8epmCea5o7vNR?=
 =?us-ascii?q?Gjh/FDDjNs9SLTmauTJvk1G8MFaatj/Qo61ZyQqrr1H+dVyeu7Wi7Xp/K/hu?=
 =?us-ascii?q?sFGHQzYXmDiS1SxQ6/sXQWMnSVEvd8rqFFiu5iD9BdavY8LjriTvz6ldTGzj?=
 =?us-ascii?q?MWeTJFIA64qV/cMouxscT6rZrx84NLtzio+vqx5lwkO5OHY/n45rUWbtSTHr?=
 =?us-ascii?q?797/a/QujGfN7aaiMMx5azZ/HmQeaRQvL2J0WSBzNujeOMBgPFCFCCCGwwvO?=
 =?us-ascii?q?EDzlsdhpikjGvZkRCnvl0mMM9NGSeYqQrRzy8rDebdURRSzddeOXbaGK0Yxm?=
 =?us-ascii?q?qWOIJlMjjYjI8+dSg1CZjK4zI+nTgNzVrV9w4v+9hHUjUoSnOUwNHIf0jJTh?=
 =?us-ascii?q?ovESKnW8DOnaBQB3W0GhyhLGGyoYtGNaLsqtBEyCVh/DO+MBof7UEHIxkxVt?=
 =?us-ascii?q?H5mSGcl+meM7NLYqdFv2XnfRIIpgRRNYci0eTDLVF03iqC/V4QyOZJb7e5hk?=
 =?us-ascii?q?wVZXUBp2UzAibiDFSumZFMLhlBr4q/URX023CaX3MaE+zvvFm9xbmttm6PzW?=
 =?us-ascii?q?b/9O7/Jhl4E/Z7Dgu4V53766jFC/xKNWxdsKoe94lGOhBm1bhReowTyswdR9?=
 =?us-ascii?q?BxhEqbnDZNPFfQ/10hgztugdDcEWVq6yyL2Qx5/3j/YycJluMIpadkQ0umnw?=
 =?us-ascii?q?yWMs88b2rL6SAklP15NV8xz1BHb/xvCQmlpCzGjIt2IyZc7pTQjW5y7QqoOb?=
 =?us-ascii?q?8IMIMKQbBI0cpXHFaE5j6deTWEOF9V4Ll85CZtltMbDHKJ6mPxnkYA1Z9bUM?=
 =?us-ascii?q?3JlNni0F+np+ImvXI9V3gEbW/ASuMBjrxSayw6gooC9XUeYvnZclhfGKI2iy?=
 =?us-ascii?q?FgmNNk9DoS7fOhdE8+7hOWi7Xpjuss8Bj7u6OGPuvowCJVqylh9m9wGKq1PJ?=
 =?us-ascii?q?x86i9LMb86axBb6OMOHLLGFwx/c/mQrXyR24oU8FikjFG5GaR21QtGS8T0fR?=
 =?us-ascii?q?+Z3YswodKROawRRscf0WptH+Z7PsCUIp63NSQW1xcwfOo/YIwPovmlK6xktp?=
 =?us-ascii?q?FTx6LypRR9vHSBSjGUNMX6P8RlrHGn5jVTww51VTHkS+7FC8rOORiQkBNWyH?=
 =?us-ascii?q?shZ3zL4r6SxmDGcjC6dXwD6Sh+4J2z8n376+tGZAahEJJbxt1OAEShD5bFIO?=
 =?us-ascii?q?7AzYSmN/XYioAYeW9phBGuqYhBSh3O1uVd7JSch7UEb582hSGWA60hLtkcA3?=
 =?us-ascii?q?3z0vQFbiDfB1KpkhnegZXBxxzsDV2fAaIASXkVogPYISI0Kee1ouI+5/Y+ZH?=
 =?us-ascii?q?Cf664BJHdB6+qJix7IwXPVcHzRwEhB2qhMEwJ3R7tFC8pmFgX08od759NeUJ?=
 =?us-ascii?q?MAT/UoYvwcsMRihrw51oKSGbcxi3A99zL5WGp6bT5IfZyLs0fhXUsHbpwPbc?=
 =?us-ascii?q?BnLPprxejpX2fXivqOMs+1tG9umSsBDPvRcVdGvepufUA5SEgWhnRbjHrHtr?=
 =?us-ascii?q?qwhbdSn7bWynRdDMYbMGcmFu9/WfTRNWB4md7TD6nXLIbGgS8ELcjEqIffgu?=
 =?us-ascii?q?G8feZPCnWRBkU7DG5zOG6Gj+uWzQy7Qt0p7Ex4OuSoSiBfZEZRL/QW8KHywi?=
 =?us-ascii?q?gOgkG6vpG6Ids4Nk2kIs83TBVk6nzmWGQufgpe87cttCdZcu5HgJ/EEjV5wZ?=
 =?us-ascii?q?RRnGXBb8bPu5zUldx9ABr9NB9gEXZNG64AUcnP7zPiio80G6yhPBcxPaonlE?=
 =?us-ascii?q?81feJ9xA3EAnfnUTl8TrZV/HXtYj6OGjImUAIU3/XVx1A=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77888654"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRgacQU6fB3PlBx9JD/fRwD46UBc6e1l4uRh321E/r+5OIb/819mxOCqbxKTC6bWC11Um/aXRzOTbaNZClDsK8OihJEZobI6oJ0HuIz0V2wpyf3uSumi3hb96GQgMlIvDu53je76jiHDA41iHNd4slkpLIEd6Y7oXVGcRcRJTIDfnk2BnYu3QABZSfbj+oJUnqmixtw9YAv+x9a5RCnnyzBvS/gC1pbdro+AjTXDzefo5ziDtacBCDoXvzQVGaakrH1XKhiM2PC91zEYDnpEsp/zFe33uCB96NB3eEWFZ8Xvx0Exi0H11BxfdIN0sQSgUtR29vx02LqmJmFHSLWExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLGp5dnrcZ7yzcqXuBT5hQELMhz0zQwP28EYOVgCd/g=;
 b=WxKveXxv9hVmIdQRCAVseSCwZDfhaSg4riaCZ5nIl12KtEzYQJmtIKZJaWdjZlm8yhIyvWI8FysppqW2OISbkpV4ezPDyRdi1A6TZOa7ZkTrbDsPHbNAAmwjFFB+S8E68iIxCmRxvUS31e2mdt+ziz08TUYs2pt0wct3ONkb2ci/oX7mBopMlQ2Wigt0dvrYnTrhRHr8A4E/u7ppWIcg41lFst+tU1kQfYi3ay4SrTfHbAfGVDloSRXAy3wulrbN90RS/gBBLMLKwZagoLzLCpNQ68+mkwjeQuOKLkE1ymrOW/lzlOznM1xOjL4l10V6+ygb2kC/nqKxJIT7SZ866A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLGp5dnrcZ7yzcqXuBT5hQELMhz0zQwP28EYOVgCd/g=;
 b=FgoqGSLC2w7vUM0ANRSaQDUgWdWPt+sKbEpB1UNDhxUlUwnVeX7Otv4TghZB4Ete/YGcvVNTIklYKT+V5H42y0+YhpM/QPV0NIgXGTQp6xRu2wQPz9QvTl9T1eCQchH+KjKu0faehZ/p0XEApwt5xyFjv5pJ2qC4hYYpqoeRC/M=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Rahul
 Singh <Rahul.Singh@arm.com>, George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/3] PCI: fold pci_get_pdev{,_by_domain}()
Thread-Topic: [PATCH v2 2/3] PCI: fold pci_get_pdev{,_by_domain}()
Thread-Index: AQHYrXBuhfhLVAQnY0WV4dbewZaCI62pr6eAgAABgwCAABypgA==
Date: Thu, 11 Aug 2022 15:09:30 +0000
Message-ID: <5b11f7b9-7264-0797-0aa5-20a988a04bc8@citrix.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <0bdd4f3f-965a-fe39-f7af-d8a40b7a68c6@suse.com>
 <48eee228-f7fa-5932-ac93-03cf70de01e8@citrix.com>
 <2ab93940-89c3-1316-a1a4-22daa09f96fd@suse.com>
In-Reply-To: <2ab93940-89c3-1316-a1a4-22daa09f96fd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e3f5951-8b69-40b7-21f2-08da7bab7d73
x-ms-traffictypediagnostic: BLAPR03MB5476:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WUgOiFAyew0RU4QO+Lpxy9AnseQe8Kl90O2Ikf5x9Nd6j0WVBcjN54Yc3GfLtnbwBp/p5/kq5eGYc0vGqPkvVK/gc6UprBkrU/J/oGlxitkT2nLF8XmqXe4Dj2HKZLID/vd5tXx8w1fN65xvTw92M3KhkGcuCwps2cbHrWmHF4E6O69pF/L9tZ84S01A99PRsJb02oWjc6zDT0+HGj5RNFGgfez3GeiF7I1euXza51Yk2v83mH5W0Nbm7nmtRLzPrkmzwSgySfCfaO2MsLa9W6NY4+gv9FuxWwJIx1lJPsQ8v7mRdKUuQnl2g9N75x2fUHbD7tx8GDQb+2ovxweH4LEVST+n27e0ftHaCqEl703g8WxU4W6AzP9WS+krtE0/Av5BXKKNPJHCDBPoa+Bk9hy452KxT6oJl7vf3sLPfiaQAP7XBu2EbcTjXk3Gox9BbLcdqQ7TOx1ei7rqx/gYgFDZnkK3oKLLcooKoIi4zGZiIQnhxXC05wQiXSDd2gDsPty7u60mySi8/GxpN1Wx7RWaRUj8UNV+ZnsRX0ZmM7cN8Jb9WANg6cAcpDx7Iq/dQEISrCkiw9RPSXo13c7X7A8ZB2xkgpRbdDLmUieJ30XBIkYHQHMY18bg8DcDhSlLgueGtt1twvYAFom3bNuH726gJ4mAWkZIujxE6r1ejnN7gUREm2+0FwDj0f6xxE8aYkc9bseqCYDA1deRiamor6mlqKibHdFn5a4tknjAMHk0bTmAZFwgdOyR3vbzvMILmgkQnDhKMGK3MjD4AyGkigslLWhpBwBSiJnw20jtkgPvCA66Qc/+8SZE73NDmxzjpSKMPYGUsDA5biOaCqed15MunvfOQnsNisDLL5nwko8qrQw1v7J1tLsQF2hXlXHt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(36756003)(2906002)(186003)(2616005)(54906003)(8936002)(31686004)(86362001)(6916009)(5660300002)(4326008)(38070700005)(66446008)(53546011)(8676002)(66556008)(64756008)(66946007)(76116006)(91956017)(122000001)(6512007)(38100700002)(31696002)(26005)(66476007)(316002)(41300700001)(6506007)(478600001)(6486002)(71200400001)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWJtbTlRNzcxWnc5SlZMdUdXNHVSMDJrbHUxdjFDc1JIKytPU2VycGxORUtr?=
 =?utf-8?B?Zk5IZHVqOTNYdThlQ3c2azdBdnR4WGpjL09Ca29JRlJaWUhGdU1mbFJZTFhq?=
 =?utf-8?B?QzFaNURmZE5vOThJbFEvbGQwNzVFbStpOHgvdXc4ZUkrMWhTbVdpbkNMNmlK?=
 =?utf-8?B?N2d4Zjd0Vks0eTJEUXhNR0NtUVVnT3NWUDJEWVhZMGJsMG80UVJUWXZKd2lM?=
 =?utf-8?B?RFpCaEdPZkM1TEkyRzgzRVFvL2ZrdHp6cG1ZUHBLWkZqMld5UnNQVTk2UVhK?=
 =?utf-8?B?eTRUbkZURW5yaUc3Mk8zb0FxZ21PQU9HdG1EZTRwQ0hsY0x2S0NLeEY3U1lo?=
 =?utf-8?B?blhwR1pWczdEUXVtb1pBeGR0OTRWVXlGZTZjblNhT202Smd4NDFvSXRNT01O?=
 =?utf-8?B?TFBpQ0xidmFnTCtMM0hEbnh1K0h1NUsxTUNQVTdIUTVQN2s0RllDWmhLYmNQ?=
 =?utf-8?B?Wk1SMjlZZXo3Y3cvTm80U1hsYVQ3dFlDVCsvVEl0dmhLcGJiZ245R1RBUy9T?=
 =?utf-8?B?eGVyQjNNWitGN2ZocjRqNFpzZHBJdXo3SEZpNkFobHBheDFIbEZNSU5URkdO?=
 =?utf-8?B?b3ZLb25DTWVyc3BIclAxWkJKK0Y4L0IwdDVQejVWL0RhbGJYb05xTGp1czZK?=
 =?utf-8?B?Z3NYRDl4THAxNU80a25PZHNkUnM1Z1ErYkhSYTEwblJma2I1eVJDb2VRQTQw?=
 =?utf-8?B?T2U4UXZLb2tLelg0MGJDUzRTN2lEYjJnaGFRSkJ6WHVZcmkvUnZ1NzI1NFpB?=
 =?utf-8?B?cDlheldmcE4vWlVjMHNuMHJxTDI0YXRFNG9tT3dTSWoyWHg1SU9xZW53RzJG?=
 =?utf-8?B?MDA3VGJvanhhSStnMm0rUmFkdk9hallzQjUxUjM1TlhFOHZDZ3IwNWhJcHda?=
 =?utf-8?B?d21CRVBqUjFuTWxnSTdIYm1mTlJKSHR0ZHNNS2dvSSt5WTY1MG9LdEFCQ3ZO?=
 =?utf-8?B?UTR0VWdXUEpjeDRqMGFhYzhXWjh6Y2tUR0pRc2UyaFlTV05xcFBkTVhITDNN?=
 =?utf-8?B?TThzYmFQdkhTQ1BuZGVCa2ZpWnhsRm9pUmVYbDk5MTIvM2JhRU9WQ3NqNDVl?=
 =?utf-8?B?Q0RWUHN2NjdRT0QzRXlTbmxRR1ZKaEV1V2J0U3hhZU9SUlNjeEFOWWRBbjJx?=
 =?utf-8?B?NmJlZWZBZ25WKzV6ZW4yOVVDS0x0VkFhS3NiZDF6dEx4Z1RjMjA2d21iY29i?=
 =?utf-8?B?UFZCblZyS2dXWG9wOUJrMXV6Q2plNVplTE5hZ2tuWXNsYlVhYVd2SUxVSjlq?=
 =?utf-8?B?NFA4ZnhVbU9zVHdxdFFPdEdmRkRSZFVaK2JrVlRwN0RTYjJRVHNkRGJ3dEpa?=
 =?utf-8?B?MGFQQWVuT3RuekpkTnFOT210UVR0cW9LdE5xdTdrVitnblo4azBrMklJcWRk?=
 =?utf-8?B?L3ZUYTRiWW11WHBRK2gxSExGUU55cXd2V1JBT2dOWlR6WnV0YzFQYm9KT3Ax?=
 =?utf-8?B?Um9BcTJYdmVvRDAybTRKeDQzSkJITmlTRUI5TGE0RVZCSGlJNHhENUVWUTFy?=
 =?utf-8?B?T0hqQ3RDOWtMUU42NnlpZDUyREIySFRWTmFwSWlGTVNnOVNUaGRvUFhUd1Rk?=
 =?utf-8?B?a1JQaVUzSVVHWnYwSndzS2I4YUI2cGd1ZGRWeVovUFgvWVkzd2FaazkxMmxC?=
 =?utf-8?B?SHpkYVllcEZWQWdjRHF5bHhxTGlZcU9KTHVPRzdPTnlHVVIxSFFzOENDOXNr?=
 =?utf-8?B?dlVobFIreHVlUGo2S0xTeElqNkw2dVp1WnoyaURuaWNrelhuYXh0Vk5heUY4?=
 =?utf-8?B?VGRtSFZ1T1NBekxaeU1nbGRvQmdubjZpRGppd1FCb2lNc1NZaUlGSHFjZ3dx?=
 =?utf-8?B?OWdnMlhwTmF0S3RhcUxTRUU3dDhXWlZza1dUQTRXQ05DZHhqY1hXWUlDRGs4?=
 =?utf-8?B?NFFqV1NIenJtMXZBNkpRZ3hxNlk0aGNIWUJrTVRxaHQ4Wm9wcU1HdkJyL3h1?=
 =?utf-8?B?aDdIeUMrZW9VK0hjbXZmZ2VKNmZyYWtzemMrbFJYSEJTTkxPMXoxYi9QVkI1?=
 =?utf-8?B?YjluVEFKRDZiOWQ5TVJxTFA1b2h5dGozZUVkU2NnVG9TbzNUaFI0MG1pU2R6?=
 =?utf-8?B?K3dhb2JzYkEzYkpuSXo5SVlnZkFUdzlCcy95QjlMb3ZKNWVZSnJiTCtuWDIx?=
 =?utf-8?B?d0ZwdHI3cy9ZWUZDaFZGaEhjaXVvd3VSWGliZDh0cVNmeTQ0VWVydksxTk9U?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <369544CBF05EAC4B9F2DC181DCE5590D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?elVSN3p5cUU2NnJBUGRqbDFLWFZjMFJ4NzhCcG1yS2xVaTU3MHdUOS8wc0Rt?=
 =?utf-8?B?aGs5c05QU3dtVWJEZG1iRlBrZy8yVXlHUGFMVy9FZjFOMG50M1lOUVBGUzFp?=
 =?utf-8?B?emFBYnFEZUNEU1VZNmg0bDdMM3VLNVlsR2Z4Wjlrb3Jkb3Y3RzQ0Nk82bFd6?=
 =?utf-8?B?OThLV1F2THZFRFgvcm9EWUQxWk9vMEc0Zm1UVU1kOG5tdml0T1FvNEJxcnBw?=
 =?utf-8?B?RnRsYnUzWFlDSUxTMTE1Z3lNK09kbHdDN2czbnVGcjZWK1QyNkUrcW9Ka1M3?=
 =?utf-8?B?dHJCTWxFdXphKzBFRkRUV1dKb05KR3E3UFFlM0swS3FzOExDcStnNVFpNW55?=
 =?utf-8?B?ci9oYmlqTFhxMkp0NnRlMGgxRWxLWXFaTElaLzIxUEVEamcva0lVenAvb25u?=
 =?utf-8?B?TUJKQThiNXN2Yk5FTkw0cUJNby9ncHFSSmNSd2NRbUpTcW5sdHVGVjBLNWFz?=
 =?utf-8?B?RmY5bzY5Y3VFaVJNcVhhbFFZTFJXVTZZbTRJc2R6SHBtcnZnQnc2NU8ybGFs?=
 =?utf-8?B?YmdwTGZTVDVFTDNBdjRvbWtudFZweVR2WTNNd1FLNVFaNnhFdlRCSGRweDFz?=
 =?utf-8?B?UlhoMlBFd29KbmdNWmZjdS8vOEl0Z3Vka1d0aTdzMW82QkVxL3lwQmh1SVlV?=
 =?utf-8?B?TGJJRUZndGxEWXBYbi9ZMVdkM0dWVnFmem92TXBFT2Ricys4ME5UKzE0bHpz?=
 =?utf-8?B?dmtrWEhsYWdVZ3pUOVpIdW1TVUtGeVpkbGROYWpUMS9wcm9vRFBlSHMzZkh5?=
 =?utf-8?B?a1BwMGl6OWs0NE5NSk1Ec09wMy9kY1k3VVIwWG1MUnh0aHJ5M0hkQXB0a0tn?=
 =?utf-8?B?bUQ1WW9ZTW5ZUmgva3hnczNWRE9aNk44WEdONXFuaVBDbTdGTjl1ZlNUK0RB?=
 =?utf-8?B?VzI3bUNBejJYTmlnQktkQlFYbEw3TGQ4UHFmRnFISzJNR2tjVVVhQmxTREpC?=
 =?utf-8?B?NUtzb1dqbHNka0kzaWFvYlgwTjMwaHBzV2krVXpiNFFCanlCdnNqR245ZUJm?=
 =?utf-8?B?ck1yaWNGNXBqN2pKOGhIMi9KbWt2QnRGOWI0eW9qaDI1WU9SWHl5YTFtZGYx?=
 =?utf-8?B?S3JuM3E2YlVmSHlGNmdpUlBEbjNHOWJlK2ZjWVlKeUVpTC9GYTllaGVSZW4x?=
 =?utf-8?B?a0tkYjlGRkJFSktSNjJ5SGk4UytnR2hjM1R3TlB0Y014VG1aMFZ1ejNjQ0hI?=
 =?utf-8?B?ZDZaZ0Y1WGUvYmMyZ0pFeFZzOXVaUWpxNEdtOEx5bzkwWXdLSEQ1WmpMSXEz?=
 =?utf-8?B?bEMwVFhabnNNenphOHBrUXFoQjJ3cWdvZmZCVmo5aGJVelpUTGw1Qy9hVnY4?=
 =?utf-8?Q?+WiPIZVV9HMpuN095qlJa/Ny+h0HBz89in?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3f5951-8b69-40b7-21f2-08da7bab7d73
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 15:09:30.0511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UTKW3Pi+dugS1ARZCQNdl8T2YSwZJszD/e373DL1ZVsx82BkBGLCCLHc4g2BAhneVtO8D9wbGGwV1y3K7d6PZfMPwps4dGTimbwlLRLm4Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5476

T24gMTEvMDgvMjAyMiAxNDoyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDExLjA4LjIwMjIg
MTU6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxMS8wOC8yMDIyIDExOjUyLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMNCj4+PiArKysgYi94
ZW4vYXJjaC94ODYvaXJxLmMNCj4+PiBAQCAtMjE2Miw3ICsyMTYyLDcgQEAgaW50IG1hcF9kb21h
aW5fcGlycSgNCj4+PiAgICAgICAgICBpZiAoICFjcHVfaGFzX2FwaWMgKQ0KPj4+ICAgICAgICAg
ICAgICBnb3RvIGRvbmU7DQo+Pj4gIA0KPj4+IC0gICAgICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZf
YnlfZG9tYWluKGQsIG1zaS0+c2VnLCBtc2ktPmJ1cywgbXNpLT5kZXZmbik7DQo+Pj4gKyAgICAg
ICAgcGRldiA9IHBjaV9nZXRfcGRldihkLCBQQ0lfU0JERihtc2ktPnNlZywgbXNpLT5idXMsIG1z
aS0+ZGV2Zm4pKTsNCj4+IE9oLCBJIHNob3VsZCByZWFsbHkgaGF2ZSByZWFkIHRoaXMgcGF0Y2gg
YmVmb3JlIHRyeWluZyB0byBkbyB0aGUgc2JkZg0KPj4gY29udmVyc2lvbiBpbiBwYXRjaCAxLg0K
Pj4NCj4+IEhvd2V2ZXIsIGl0IG9jY3VycyB0byBtZSB0aGF0IHRoaXM6DQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc2kuaCBiL3hlbi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9tc2kuaA0KPj4gaW5kZXggMTE3Mzc5MzE4ZjJjLi42ZjBhYjg0NTAxN2MgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNpLmgNCj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9tc2kuaA0KPj4gQEAgLTU5LDkgKzU5LDE0IEBADQo+PiDCoCNk
ZWZpbmUgRklYX01TSVhfTUFYX1BBR0VTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNTEyDQo+
PiDCoA0KPj4gwqBzdHJ1Y3QgbXNpX2luZm8gew0KPj4gLcKgwqDCoCB1MTYgc2VnOw0KPj4gLcKg
wqDCoCB1OCBidXM7DQo+PiAtwqDCoMKgIHU4IGRldmZuOw0KPj4gK8KgwqDCoCB1bmlvbiB7DQo+
PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU4
IGRldmZuOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTggYnVzOw0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdTE2IHNlZzsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9Ow0KPj4gK8KgwqDC
oMKgwqDCoMKgIHBjaV9zYmRmX3Qgc2JkZjsNCj4+ICvCoMKgwqAgfTsNCj4+IMKgwqDCoMKgIGlu
dCBpcnE7DQo+PiDCoMKgwqDCoCBpbnQgZW50cnlfbnI7DQo+PiDCoMKgwqDCoCB1aW50NjRfdCB0
YWJsZV9iYXNlOw0KPj4NCj4+IHdpbGwgc2ltcGxpZnkgc2V2ZXJhbCBodW5rcyBpbiB0aGlzIHBh
dGNoLCBiZWNhdXNlIHlvdSBjYW4ganVzdCBwYXNzDQo+PiBtc2ktPnNiZGYgcmF0aGVyIHRoYW4g
cmVjb25zdHJ1Y3RpbmcgaXQgYnkgcmV2ZXJzaW5nIDMyIGJpdHMgd29ydGggb2YNCj4+IGRhdGEg
ZnJvbSB0aGVpciBpbi1tZW1vcnkgcmVwcmVzZW50YXRpb24uDQo+IE5vLCBJJ20gc3RyaWN0bHkg
YWdhaW5zdCBpbnRyb2R1Y2luZyBhIDJuZCBpbnN0YW5jZSBvZiBzdWNoIGFsaWFzaW5nDQo+ICh3
ZSBhbHJlYWR5IGhhdmUgb25lIGluIHN0cnVjdCBwY2lfZGV2LCBhbmQgdGhhdCdzIGJhZCBlbm91
Z2gpLiBUaGVyZQ0KPiBjb3VsZCBiZSBfb25seV8gYW4gInNiZGYiIGZpZWxkIGhlcmUsIHllcywg
YnV0IHRoYXQnbGwgaGF2ZSBrbm9jay1vbg0KPiBlZmZlY3RzIGVsc2V3aGVyZSwgc28gd2FudHMg
dG8gYmUgYSBzZXBhcmF0ZSBjaGFuZ2UuIEFuZCB0aGVyZSBhcmUgZmFyDQo+IG1vcmUgcGxhY2Vz
IHdoZXJlIGltbyB3ZSdsbCB3YW50IHRvIHVzZSBwY2lfc2JkZl90Lg0KDQpXaGF0J3MgdGhlIGxp
a2VsaWhvb2Qgb2YgZ2V0dGluZyB0byB0aGF0IGJlZm9yZSA0LjE3IGdvZXMgb3V0Pw0KDQpJJ2Qg
cHJlZmVyIHRvIHNlZSBpdCBmaXhlZCwgYW5kIG9idmlvdXNseSBldmVuIG1vcmUgY29udmVyc2lv
biB0byBzYmRmX3QNCmlzIGJldHRlci4NCg0KQmFzaWNhbGx5LCBJJ20gaGFwcHkgZm9yIHRoZSBj
b252ZXJzaW9uIHRvIG5vdCBiZSBpbiB0aGlzIHBhdGNoLCBhcyBsb25nDQppdCdzIG5vdCBnb2lu
ZyB0byBnZXQgZm9yZ290dGVuLg0KDQp+QW5kcmV3DQo=

