Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6EA44307D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220305.381520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhurk-0007sA-Gj; Tue, 02 Nov 2021 14:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220305.381520; Tue, 02 Nov 2021 14:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhurk-0007oz-Cy; Tue, 02 Nov 2021 14:34:20 +0000
Received: by outflank-mailman (input) for mailman id 220305;
 Tue, 02 Nov 2021 14:34:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JXc=PV=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mhuri-0007ot-Oh
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:34:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4fe847e-3be9-11ec-8557-12813bfff9fa;
 Tue, 02 Nov 2021 14:34:17 +0000 (UTC)
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
X-Inumbo-ID: f4fe847e-3be9-11ec-8557-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635863656;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wm/mwjcyrrwyBd4nOy23/P9ZEHxcoSu2UYdvnDyCLu4=;
  b=dUyU/YUywpgX4BcvUj6IzgjYVFCrY+tckKPa2AgMueskCJVlxwGh/74U
   D1oB8R4HNl/wj38GBNJV05/EaA3aXu6kEkLq9Z6mCL2krR1TEERtWKBoM
   GHWPakycs+Kto/ihZ/wNkpOT+y541vlR3k1rOm/bUlUQXQteFGicZnD9C
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pdSWqZbmATiU1DTXYQ6r0DnkSl+j9duvBdLKBC2ImZ2DE46vaehsWVfKardIeXxwrWJBZ8dCVX
 6vYmBjiDNVvoQqRFUw+4GzRYNM/nEvQJ97ZXkG/7MBq0K+bLZYnYoxfqSH7B57HVfEDEGd8FwO
 O4zKTnIsjGijn1xBTKG3ABlduf0Ie8kvHfoFq2N4SDdvFWAhGFiUkilpeIBminVV2NHV6h7Yx6
 K1SwnS/uzcPW4ZaLvQMHhIW54mnUYuPLc467m92ysXASFdVkzG9PkRTrxwiDNC5GuO80rcXbx9
 3c6xGOoJv15D8WbHysohNLXc
X-SBRS: 5.1
X-MesageID: 56862984
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EuVWEaIj6Wj3ofdJFE+RjZMlxSXFcZb7ZxGr2PjKsXjdYENSg2FUm
 GAaWTuHbKrZamL9KY1+O4u3oE1VsJbSzt5mQARlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es7wbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2ltd1z9
 NtcuqWRWEQJIurOpeYZSwJHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpu1p4UTKaCD
 yYfQRNuUjTPRUBNBk9US5kXlru0mV7eVzIN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKhMHMN2SzxKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 1MQ0jojq+417kPDZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8yzieAm8IXztQcusMvcU9RSEp/
 lKRltavDjtq2JWUVnC15rqStSm1OyUeMSkFfyBsZQkK+d74u6kokwnCCN1kFcadgtTrFBnqz
 juNrSx4gK8c5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8CtVToOnW4K55mH6/LVgMMGbc1uFp
 GMbzp32AP81MbmBkymEQeMoFb6v5uqYPDC0vWODD6XN5Bz2pSf9INk4DCVWYR4wb51aIWOBj
 Fr74FsJvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmBwwcnT2
 r/BKK5A6Er274w9lVJaoM9GidcWKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 Y0CaJrQk0oFCrSiCsUyzWL1BQpTRZTcLcuuw/G7i8bZelY2cI3fI6aJqV/eR2CVt/sMzbqZl
 p1MckRZ1ED+lRX6xfaiMRhehEfUdc8n9xoTZHV0VX7xgiRLSdv/vc83KspsFZF6pbML8BKBZ
 6RcEyl2Kq8UEWqvFvV0RcSVkbGOgzzy3l/TZHX5OGBXklwJb1Whx+IItzDHrUEmJiG2qdE/s
 /un0AbaSoAEXANsEIDdb/fH8r97lSF1dDtaUxSaL99NVl/r9YQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbi/ucIzgltEHjRQU6sD7dsfiuP0cVV7/Ufzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4K1sckvg5SJx8L6WamloPkGB2H5HMb94EII52
 uN96sQY3BOy10gxOdGcgyEKq2nVdi4cU78qv40xCZPwjlZ50UlLZJHRB3Ok4JyLbNkQYEAmL
 iXN2fjHjrVYgEHDb2AyBT7G2u8E3cYCvxVDzVkjIVWVm4Wa2q9rjUMJqTlnHB5Iyhhn0v5oP
 jk5PkJ4EqyC4jN0iZURRGurAQxAWEWU90GZJ4HlT4EFo51EjlDwEVA=
IronPort-HdrOrdr: A9a23:44jaNqm6M6zPTGbDCrH0kEIurmrpDfO+imdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPpICPoqTMmftW7dyRSVxeBZnPffKljbehEWmdQtrp
 uIH5IObuEYSGIK8PoSgzPIYOrIouP3iJxA7N22pxwGIHAIGsMQnTuRSDzrdXGeLDM2dabRf6
 Dsn/avyQDQHEj/Iv7LfEXsCIP41qz2fd/dEFI7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+k3bnpiHuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy6IiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/MMZFjZIxSGqT12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsLi4co/j9ieLpbTIUUgZ0U/UtTHptFNjn98pobHO
 5nC9yZzOpKcGmdc2vSsgBUsZyRt0wIb1K7q3U5y4ioO2A8pgE/86JY/r1fop44zuN+d3EejN
 60dJiBl9l1P4crhOxGdb48qPCMexjwqCT3QSuvyGTcZdQ60k322unKCZUOlauXkc8zvdYPcK
 qoaiIviYd1QTO3NfGz
X-IronPort-AV: E=Sophos;i="5.87,203,1631592000"; 
   d="scan'208";a="56862984"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwyQqLcQAud0M31EwGrVJP1g0yhFEaNBNcFNEiLLf756f549aShu5f7nF2+upkxm4imn8FScQpBxSpzMYVh6s7k8wxS+3DTL5dE1ATgPyrt1nu5S5fmGE5mFwsMNQFV7pWC8bkHDkvoqcK8sa2sgA4FoqNDph47qujo0Il6zRIbspu6DiVwCnfHoYC2pFTpGMeIXPB3FQ1Xj+75iP+yVdSePyw/QPUBmRlcZeBdzJqU1ftC31iwtgO4lvKa4eksq94nEehjbgD+hOwJJS96MOwSb58HsWNbZUxj8xxwyXVJlbZm1iUzI51aI2H2VnhrLZXY1Ij9Do3bmUf6k+pTCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaIzeyu+kLBhuCcTqcHDkZrfoofYpBkvSxGOooWlK/Q=;
 b=FwEiDOcULQWSSeuDSRRr4Of+72DPeVnSaqCuB4bqgv5Fg19YqsaCugMmBaWn3FLNlx6LgLKOraTd2PzYdCnrd/kDV8RfmZONmUSTHgEDt/Rbmxoqkb7kNyH2Im0AxTNbFiyYcXWaZhiJ2tMp5VkGFlaHMpBQ6rmdOvCoF8VtG0XOWr7x5dG1EZ3XpZy0A1xAF7/7USmxgwrtI4zncECiigLUwJtYAfYQODVd117vSSVSQpexpCMhwMVN/fMa6ri5UeGUK/k1/mz3piXjJA2ZV9H/QAoovb2IiLowAEN6eRgLFbgJ2PaaJmz1Znq0nmZBqU8EpqzVvF+V6e7hG27W9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaIzeyu+kLBhuCcTqcHDkZrfoofYpBkvSxGOooWlK/Q=;
 b=W6tYOFtRL1gGs0eeErUU78rHGwE7r9gtwM1ztL2WfoX325/pXY1j55G38+nRpyI/ontrnIt3QZhv3RgJjPXk3t8egMHtL2Pyzftg3Os/rCPw/UMyeS12HDyXrvTpNgnF/2qBGkDv+k6kc75xuehhNMbXfo68WobQPz2/Kb31JiY=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
References: <20211029075956.1260-1-roger.pau@citrix.com>
 <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
 <YXz579WNpHe7aO91@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
Message-ID: <3715026d-b8e4-9940-6cfe-0ccf042cd07c@citrix.com>
Date: Tue, 2 Nov 2021 14:34:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YXz579WNpHe7aO91@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0228.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f6cf36-a0d7-4524-0942-08d99e0dd5e7
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5695:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56950D7992E7DDCB10A8C840BA8B9@SJ0PR03MB5695.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jGGa9x5fxHOYwcIk0Hvmu70gECaXYaf3I/5vufFSEAMWUpS0K192a4G5/qKPiDdiHqENwpTrjol6EVpUr7Ww5ofnA+qysM/2rVe9c3XyhymIVaRlbpoSWlNhc3EB/ljByjfph8r1foPoTST/xSCthixw8MHN8rsUHb7x7ZINv2E1xNXcQEVl8HhU7p1cDg5AKC7riQ8absTpXGZl1Osu7+ewfIegRn3gIQaxnvMkMNW+88jjfLVsUts4zbrkWi4UCYiLOq9ulbbtMqnF8FMfNY8NbjX2GvncPzeSrJvLokOgbIhoMDQucmV86oOeiLw46LCFHK51LSct8hS5h9p7fcn/n+2M7mBc4jpAfez0IcwyRzpEdVQaWM8DCS08nrM3yv9lER7k8wXbYwQ23ThWIQ8vf7aswW/gCZZrLiGybnGJcqSaZlHmg+l2NqT5iaQPOz7xRS6sZiZ1lssoEmIxTB5ItRoJo18oFOKRE/M1MNozNbgMA7NOze+8iun+l1Wxh7/6Pv0uAnkr2ErrG3mjUgMnvvXkfo1J8zZ6ozcf/1X3B+QVGQwrqM0PEaBe3PbTJSkZzjmFUl7IXlLuZDtdeyKLg4uU9180EQDjFhrpb7ID9Ktd33Qw8p7BYi1e7Y5FNFyvMZ28xa6Z+B4AKu/EZSxFa/kBErzrrHQmrYQYRHsMlzhJV+o6IqfB+ONoVGqeiyONjRUonf9WOXjvihpUayf3woehWl7XTQGEm93l08n28B5SEwAYd9+rOBLahnAc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(508600001)(66946007)(86362001)(66476007)(66556008)(5660300002)(53546011)(316002)(38100700002)(82960400001)(31686004)(83380400001)(36756003)(16576012)(186003)(4326008)(26005)(6862004)(31696002)(956004)(2616005)(8936002)(54906003)(37006003)(6636002)(6666004)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEsyeHZoUE5QOWZRRkhIbCtzVHNlRFdqOHZpaitRMFlvTWQwT2NlRlhZYXV0?=
 =?utf-8?B?bXVvTHVSQ01KblprTCtuazkrWFBvYzlhVFdpWnd1WHE5eFF1QVFWUUY1ZWNB?=
 =?utf-8?B?SmlOMzl4WXcxMFp0bjAzTFZ5QmpidWRzMHZOZnl5T3hlcllaQThWdXFJRlYy?=
 =?utf-8?B?TGZRakdVeWNhemRCbVU5VGhhWkRFdUIxb0l6L012MThBQ3VEcnZGblU4L2M3?=
 =?utf-8?B?dFRRenYvdStKK1hoeld6MDlwa0xTdFBqSGRBYVhUNUlUNjJ5WHc2S0RMaHJx?=
 =?utf-8?B?dEdRT0lhUE9HQVBIMUNvQVZIUE9QUGJvZjd0cDNFSC9VWmYvWWgxYnpLanNJ?=
 =?utf-8?B?ZlB5Zmk2cENlaUZEeUprby9wRjlrcWk1M1plKzJGR2NrSTY2MWJwUERDZE5n?=
 =?utf-8?B?UGlER1krVWVaQ01wR3lPQ0c0azRzRmpMQ1hDcUJYRVpTRjBGWGRIZ3pkMlk3?=
 =?utf-8?B?R1k5R3JURjROOW1nY2o0QXIvdDNTVloyaEtXbVJoZzFjbFV3UUJwcVpRTDU3?=
 =?utf-8?B?ak9VNmZuQWtURzdsK2Y2dDlycVQzQi96cU5oQ3dQTklkYUhXVG9nbEdsM0Uw?=
 =?utf-8?B?NkpHaTlYSS9PVGhEQVpjZDdsS2RpRVJtZUsvYXR3WHducWNqaUV5aS9HNXZJ?=
 =?utf-8?B?UDZNc2lKSlc1MXgrSVBIRkdUTjNsTjd4RFBIL1Z1MVB0Q2NFQW8zajM1elVu?=
 =?utf-8?B?aE5hRm95Q1RVbHFMVTVWaVZHb0J4Mk1EaXV2dWNYSmZTL09VTThZWnQ5ZzIx?=
 =?utf-8?B?R0FvV3c4eFRZVmpMYmJjUzZyTnJVdUhlVlBJUUF6V0ZBVml1cjlOMStOeVVF?=
 =?utf-8?B?NjI0SFdRd2Y1OUUxUGNST25wL3g3SmprNVc4QjRwbGRxZzlLU05PckU2L1hO?=
 =?utf-8?B?UFM1TndBOUhQYzhHMXN4YUlIQzBhWFdaaVBpNGdJenpmd0htUElOaVg2UTB1?=
 =?utf-8?B?cGFweUp2MzJES0VGcVVkNmYxcG02NjFNSWJSK3d1SWoxZUFlWWJHYWpmNG02?=
 =?utf-8?B?VVRXRnVOLys5Q1RPZEZlSkp3SHpaN1prbGxXdHZCVDI4Uytra0pPUGRaazVw?=
 =?utf-8?B?clJGZzFadWVTdjFubnhJeFN1Si9yK1ZxNkJhM2d1RkQ5SXNhSTVoWHRhVzdE?=
 =?utf-8?B?MzQ5dXBIeDlJMk1saXFPTUFFcHhlQU1HTTR5RWgvTlRLQm1NUy8weEd1WmJQ?=
 =?utf-8?B?KzVkZTBzR0UyMTdrcy9WQXM0ZFhONFduSEdua1lRaXBSUE53SDhmWHhVMGpq?=
 =?utf-8?B?RTM4STZ5NExRU1FZb1puM1oxMXBlazlWSllRTHBST3JJR3hxOEV2QktCTGN3?=
 =?utf-8?B?czU1VjF6V1VLK2wzNnF3NERxOFRRZWxsdm5lQlF4VTM0ZzlIamJlOXRQN1Qx?=
 =?utf-8?B?WXFJSUpTejdhNEpscGJxWXNORG5LbGZrQU5HcWc3bkMrd2toandneFczMUdF?=
 =?utf-8?B?eHZ1emw4Rng2N3VFMldLdTNXenZFaUVaWHlvRHNsM0tGM1J1cmJ0bVcvQ2R3?=
 =?utf-8?B?am1NNVJyNm1iNDZabzhUdVpJY1lXZGMrRXAxdFY3Tmx4ZHpBWUE0YU9qbjhC?=
 =?utf-8?B?dDB4UVBSYmZqMC9rY2MrMHE1RUx2Wk41Yy84UFk1SHZTMWxOZkU5MVltRWVG?=
 =?utf-8?B?TmxSMERPd3p5VlhTRXN5dkdnTWVXT3doZTcrVVp5Yzh5QTg4dEROL2x0MGFl?=
 =?utf-8?B?bE5yYUFjWEFnZTdhQ1NzN05USnJVZDNJbDVpTGpINHBMTXp6ZG5CUW5NRkZZ?=
 =?utf-8?B?SmcyQkZSQUxaZXNtL3JjdWlDTUpLNWRSQlArc1ZYTWc0WkI3MFZ5NU1MNyt6?=
 =?utf-8?B?WnIxKzh1bG9nNU5mb3VodnVSUWEwb1REN2tIUjRubWx3dVl4Nnp2dUVaUUFU?=
 =?utf-8?B?dEI5d0RGSFFwclhJQzVIMkx2ZnA2d0F1VjhZbHNPb0l3T2FtKzNvZjVyQnNU?=
 =?utf-8?B?Q09IR282Z2JNODZGZk5Cc25MdXdDSnJVSjZQSjI3QzlYbEwyaGVBV1krQVR1?=
 =?utf-8?B?UGxnWGlKdHNFNHV6ZUF3emxzd2VSWkx6MnZlbUFmUE5uZWNYaTFYWDFIOGVo?=
 =?utf-8?B?VE43S2ZMeGRaelJnZkRsNmtBQUJLdGRvUGlFVnBWNEpFcmlEUEcybCtpd3Rp?=
 =?utf-8?B?RzNhdlJLRXdrNzRubmJvSENoRUJOWlNHZW1xUi9mYk5pQS9FaXJoeWNNRjAx?=
 =?utf-8?B?Ny8zb2hOcm9sK3luelBsOUxZRWxML3poQ29aZFNxendLZktKdC9DNlJ0Tkpa?=
 =?utf-8?B?MXplRDM3SmFseTNlT1lWUjlIMmxnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f6cf36-a0d7-4524-0942-08d99e0dd5e7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 14:34:11.1976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLqMmUJqIHrc663/3n8LUcoUxXyi2pt/JRIVrGxeMLnNP5/mGzDCXx1KtGP3zBCt0BubgZA/QTB3wv/avcyr8UHauCiwTpw5sfysa0MV3cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5695
X-OriginatorOrg: citrix.com

On 30/10/2021 08:53, Roger Pau Monn=C3=A9 wrote:
> On Fri, Oct 29, 2021 at 05:39:52PM +0100, Andrew Cooper wrote:
>> On 29/10/2021 08:59, Roger Pau Monne wrote:
>>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>>> index e510395d08..f94f0f272c 100644
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -1917,11 +1918,33 @@ active_alloc_failed:
>>>  }
>>> =20
>>>  int grant_table_init(struct domain *d, int max_grant_frames,
>>> -                     int max_maptrack_frames)
>>> +                     int max_maptrack_frames, unsigned int options)
>>>  {
>>>      struct grant_table *gt;
>>> +    unsigned int max_grant_version =3D options & XEN_DOMCTL_GRANT_vers=
ion_mask;
>>>      int ret =3D -ENOMEM;
>>> =20
>>> +    if ( max_grant_version =3D=3D XEN_DOMCTL_GRANT_version_default )
>>> +        max_grant_version =3D opt_gnttab_max_version;
>>> +    if ( !max_grant_version )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 reque=
sted\n",
>>> +                d);
>>> +        return -EINVAL;
>>> +    }
>>> +    if ( max_grant_version > opt_gnttab_max_version )
>>> +    {
>>> +        dprintk(XENLOG_INFO,
>>> +                "%pd: requested grant version (%u) greater than suppor=
ted (%u)\n",
>>> +                d, max_grant_version, opt_gnttab_max_version);
>>> +        return -EINVAL;
>>> +    }
>> I think this wants to live in sanitise_domain_config() along with all
>> the other auditing of flags and settings.
> The reason to place those there is that the sanity checks for the
> other grant table related parameters (max_grant_frames and
> max_maptrack_frames) are performed in this function also. I think it's
> better to keep the checks together.
>
> We should consider exporting the relevant values from grant table
> code and then moving all the checks to sanitise_domain_config, but
> likely a follow up work given the current point in the release.
>
>> Also, it can be simplified:
>>
>> if ( max_grant_version < 1 ||
>> =C2=A0=C2=A0=C2=A0 max_grant_version > opt_gnttab_max_version )
>> {
>> =C2=A0=C2=A0=C2=A0 dprintk(XENLOG_INFO, "Requested gnttab max version %u=
 outside of
>> supported range [%u, %u]\n", ...);
>> }
> It was originally done this way so that the first check
> (!max_grant_version) could be adjusted when support for
> max_grant_version =3D=3D 0 was introduced [0] in order to signal the
> disabling of grant tables altogether.
>
>>
>>> +    if ( unlikely(max_page >=3D PFN_DOWN(TB(16))) && is_pv_domain(d) &=
&
>>> +         max_grant_version < 2 )
>>> +        dprintk(XENLOG_INFO,
>>> +                "%pd: host memory above 16Tb and grant table v2 disabl=
ed\n",
>>> +                d);
>> This is rather more complicated.
>>
>> For PV, this going wrong in the first place is conditional on CONFIG_BIG=
MEM.
>> For HVM, it the guest address size, not the host.
>> For ARM, I don't even know, because I've lost track of which bits of the
>> ABI are directmap in an otherwise translated domain.
> This was only aiming to cover the PV case, which I think it's the more
> likely one. It's possible there's people attempting to create PV
> guests on a 16TB machine, but I think it's more unlikely that the
> guest itself will have 16TB of RAM.
>
>> I think it is probably useful to do something about it, but probably not
>> in this patch.
> I'm fine with this, we had no warning at all before, so I don't think
> it should be a hard requirement to add one now. It would be nice if
> there's consensus, but otherwise let's just skip it.
>
>> Perhaps modify domain_set_alloc_bitsize() to impose an upper limit for
>> the "host memory size matters" cases?
>>
>> For the guest address size cases, this possibly wants to feed in to the
>> max policy calculations in the same way that shadow kinda does.
> So grant table version will basically clamp the amount of memory a
> guest can use?
>
> What about guests that doesn't use grant tables at all, do we expect
> those to set the future max_grant_version to 0 in order to avoid the
> clamping without having to expose grant v2?
>
>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>> index 51017b47bc..0ec57614bd 100644
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -89,14 +89,20 @@ struct xen_domctl_createdomain {
>>>      /*
>>>       * Various domain limits, which impact the quantity of resources
>>>       * (global mapping space, xenheap, etc) a guest may consume.  For
>>> -     * max_grant_frames and max_maptrack_frames, < 0 means "use the
>>> -     * default maximum value in the hypervisor".
>>> +     * max_grant_frames, max_maptrack_frames and max_gnttab_version < =
0
>>> +     * means "use the default maximum value in the hypervisor".
>>>       */
>>>      uint32_t max_vcpus;
>>>      uint32_t max_evtchn_port;
>>>      int32_t max_grant_frames;
>>>      int32_t max_maptrack_frames;
>>> =20
>>> +/* Grant version, use low 4 bits. */
>>> +#define XEN_DOMCTL_GRANT_version_mask    0xf
>>> +#define XEN_DOMCTL_GRANT_version_default 0xf
>> This needs to be a toolstack decision, not something in Xen.=C2=A0 This
>> doesn't fix the case where VMs can't cope with change underfoot.
>>
>> It is fine for the user say "use the default", but this must be turned
>> into an explicit 1 or 2 by the toolstack, so that the version(s) visible
>> to the guest remains invariant while it is booted.
> Please bear with me, as I'm afraid I don't understand why this is
> relevant. Allowed max grant version can only change as a result of a
> migration

No.=C2=A0 Allowed max grant version is (well - needs to be) a fixed propert=
y
of the VM, even across migration.

It was a fundamentally mistake to ever have gnttab v2 active by default,
without an enumeration, and with no way of turning it off.=C2=A0 Same too f=
or
evtchn, but we've already taken a patch to knobble fifo support.


The toolstack needs to explicitly select v1 or v2.=C2=A0 It's fine to pick =
a
default on behalf a user which doesn't care, but what moves in the
migrate stream must an explicit, unambiguous value, so the destination
Xen and toolstack can reconstruct the VM exactly.

"default" is ambiguous, and cannot be recovered after the fact.=C2=A0 In
particular, a vm with no explicit configuration, when booted on a Xen
with gnttab limited to v1 on the command line, should not have v2 become
accessible by migrating to a second Xen with no command line limit.=C2=A0 I=
t
is fine, if that VM subsequently reboots, to find that v2 is now available.

~Andrew


