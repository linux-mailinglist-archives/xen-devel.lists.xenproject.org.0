Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33C532F34
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 18:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336689.561068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntXgZ-0005WY-Ic; Tue, 24 May 2022 16:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336689.561068; Tue, 24 May 2022 16:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntXgZ-0005Tk-FQ; Tue, 24 May 2022 16:47:07 +0000
Received: by outflank-mailman (input) for mailman id 336689;
 Tue, 24 May 2022 16:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpOU=WA=citrix.com=prvs=1362cb858=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntXgX-0004yH-UE
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 16:47:06 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2349336e-db81-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 18:47:04 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 12:46:58 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2980.namprd03.prod.outlook.com (2603:10b6:404:10f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 16:46:56 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 16:46:56 +0000
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
X-Inumbo-ID: 2349336e-db81-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653410824;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GCMfGFX18MxrK68W+4tBrU5JqQ72zQrhqRF/3YxJ0Q4=;
  b=FuJSkybD0N9OnnwyOeM/VtAg45r/loFTZL5inWh9gwDxK3878l9mRwNe
   mmnNANFC10q8BrBT3s493YURq49nxln4a8DKKCF6a3kfC6QHNyu3O4wy5
   b57PNBiG0ew3+HBPR0D75IdNL4IIIzipNmulqVDwDJuX1hwtFbaU8h1S6
   s=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 71441734
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jqgqNq1qzhWdBTpVnvbD5adwkn2cJEfYwER7XKvMYLTBsI5bpzcCy
 WofXDqEP/vfYzbzfIh0btvn8E0Au5XSmNI1HgFppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMy3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1ViraeTBo0P5bnv9svfSN0I2JcEq5JreqvzXiX6aR/zmXgWl61m7BLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82eBfyStLe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutriamL2EB9wnJzUYxy1KM6g11+eGqCuv+JuyMGZx6nxi8i
 kuTqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqEKX7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXYht8F4FuQ77ESI1fDS6gPAXmwcFGcZOZohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:MCLJP64lb6GVeCs7kgPXwVSBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJYq
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWySw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLbhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnzd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7k16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXavoJBiKprzPLd
 MeTf01vJ1tABOnhjHizyNSKeWXLzsO9kzseDlAhiSXuwIm7kyRgXFohvD3pU1wiq7Ve6M0mN
 gsDZ4Y5Y2mbvVmGZ6VV91xNvdeNAT2MGLxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.91,248,1647316800"; 
   d="scan'208";a="71441734"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cY1kC9EuCMMeHiVuuAmCzphQilkkwtm/yKsJyx7NIT2Q9IfBnpIc4AJegOwW4TyI/GHcTZkI/I0hOjZ3QaM8zAaiiKGwaAr1Wtv2dh0JK9ocA+jBy1pmjxYKYPPviB7PjG9B6AQN2IgL+HiIPIqAQEDQkl3r0AYNuGk6weHAaVwJz6Nn15475gF+u2sJbvjfkRmA3Fw5qS9nenPvc60qmPKaGsPKewLZkwM02kV5Yypp/Y7vNDiLfRU6Rc2hoPHi1EWiGVrhwuTqRN///d8VgABnRD3PJ9xe4CVI+XK020VyjtIcYcU8IrEjDgIEH4tJ5sNpk4u4+7qDBMIBSfu00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdmlYp/o88PZafQydtFsxqPmm47chu1blBI1ttF7+q8=;
 b=h6kMtHpEdJGmXbConJurJrZkbnmJ/TUYLMm5Qm8wWo9S3sXcq7mIeKap1sEWPont/+mIS5G+VZMVPB7TBoGelSoNg/3BuHmU81ukYmr68zIg0qaC6aj8VmT/T3wps/hF8qACNCQFWBrVMkaMDVZtu7bypSzVOyxESldLBlPPNwUKYijXtvFCoKdRy6nFFOatbeAix4qRLIo2CvYSc6K/WqKb+ewY+9nDRDIlpIVr/K46jpqrxZIzjpaOiPNstZxDtcah3rTDG1kwQPSb15W/D8UI2ECTFMmIlFHDzC7D6NvVRO8e9RkrNv354AFAUeGr6uaFLN613z0KmnUuOJ7nxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdmlYp/o88PZafQydtFsxqPmm47chu1blBI1ttF7+q8=;
 b=FkC5J8+LWtUS266GHYR8m7PdXg457QLInnvHsGDbHarSqdG5D1EfMm5Ctf10cly/l6FwbpHS9PV9uOs972Wku/eJO6dpTlDv3IkxoO19z/8fCn7WbxjCVUdEEG+c6EENnVZnlFT/aCyBk4QYfStSBGyRuQRv1ts8/GjacjYdUX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 May 2022 18:46:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/flushtlb: remove flush_area check on system state
Message-ID: <Yo0L+mp5kP1zMU/d@Air-de-Roger>
References: <20220524105052.5210-1-roger.pau@citrix.com>
 <1b0b643b-a906-13ba-d414-feedc98428d3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b0b643b-a906-13ba-d414-feedc98428d3@suse.com>
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23869fdf-1835-4ec4-1db9-08da3da5034d
X-MS-TrafficTypeDiagnostic: BN6PR03MB2980:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB29806775B0827C71D63FC7128FD79@BN6PR03MB2980.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bajMHMf1Gl0cTMVyvGIdTsGTJDYP4M6fbOmwADMGXucWGCJe2ugOszcvMq9jCatUMpnoqasPcD+b38kOdbTVA3PX9kwqHvsuFpeQrjGoLKVE8X1yGsQyXs5ykKDrV3+2YTOaH+Qh30Gxcc+tz0gDyYn9TubKojMlMyPgdP5KCnSBrEVLYp2qCY00Q+Q6L+psMu8Qzxv/AHSbXOSjUieY6z+zDeSzfLbmn6fXp4Y3jHfsuUJTnr5UFH1nLWAQ/tEeiH8wpVT7OrpsDARSQdlQhKG9UX7PduQjSq4bL35KnQ/4tUgxICIn7xViVTAmDiJRHuesHlnmxGShP7KM81brI+IUlLKwJX99mzncbIpD2Vwii/Lm9EEY7ue7UAYKRb0UQfg+iTBa9XulBw28NeOxKKvJdMfXcBd0Auf8GNvLWDMN12QX1bTyn2tnkXm1scX37T2RcTv2gADWEC+2PGhEFjtupC6+PzE8iR2DV9l5B4AEZptF2K+ICTznKXNPG5HBvt2MJgTpOouUvAc8puB5o2EpT/V2Q6oo2ssxfwngNo0Vj9RSOgfdURFW1wbbYMYrikVmZe8jK+GYcr/EB7KvrQ8tUpDn4KoPUMtXXw+cV/OF5hySRcYh8zlb2xP08sxBOKLzZ7SLlS7PXaUgcb0jSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66946007)(316002)(4326008)(6486002)(9686003)(8936002)(83380400001)(8676002)(66556008)(66476007)(53546011)(38100700002)(54906003)(6666004)(26005)(6506007)(6512007)(6916009)(82960400001)(86362001)(508600001)(85182001)(186003)(33716001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1pJWi9aNlF2eUFXcGZEL2dUajJCbWx2d0VQK0ZLTGxoVHlCU2hMdk5LRTMr?=
 =?utf-8?B?QlBWczAzLzE3WUZyVVVoSWNBa3hXc09YKzBBQ3ZKSWJ0ZGk1N1hiVUdESjRl?=
 =?utf-8?B?ZkwxbTlyNEJKck9OdWdVOW80SHVrb3lIaWRqVHg5QnZIM3FEK09VYjErM2w3?=
 =?utf-8?B?NDhEWE9maml6TnByRU0raEhoQU51NS93TnBrcUJuMWpQUnRUVFRWelpkZFB4?=
 =?utf-8?B?N3FqcmlJNnJSM2R3QTRFWk4wNmdsUnBmQWl0UStYOGsxdUY0eEs3ZlhWaVd2?=
 =?utf-8?B?N3pTcjZwSTZhaXR5UER1OThZbXNabWhHMk9IcUpYYm1MVFdrbjNzNFlrd0J5?=
 =?utf-8?B?dmpROUFGV0pCUFo3MUtsbUJ2RzVuSnlIYjltU1hPck12Mkc0TmdZWFgybTZU?=
 =?utf-8?B?VE5Ecm85QXZncFpYbC9obnlTa1QxNndKc09tWWl5eG1Pa0F0YXF6OXVTUzNZ?=
 =?utf-8?B?VHA0VmFtRFQ0bFJsR3I1TldyNW4vWW9VOEFmZ1ltNUYxdHhXQ0F1TTQ4WXRF?=
 =?utf-8?B?cVVCc2FYV1o0NHJsR01ZbGNUOVVaZ1VYN1hKMjY0YzRrYWVNVVk3ZzdRZUFR?=
 =?utf-8?B?Wm1nYm92TEZPVE9zT0tUTGg2Z201TjVzUjlROEdlcVNGNWIvSWtEdFhYazNN?=
 =?utf-8?B?QS9icVZVVUVwR1hHeUJId01hZkkramVXYlJHbWgxN0NDR05yQzkxK3IySVE4?=
 =?utf-8?B?eFBvU3hBUmg1TVg2N0JKaVVCalAzaGFQL0h6VjkzSU1KdnlxcGRoZjk3cUZr?=
 =?utf-8?B?STBkVUsrM1MxUldlWVpQeUVaZ2RDV0dISVpJZERvZnU2aHhNalFsOTNzZG90?=
 =?utf-8?B?SmRRaXdoUXJ6cUhacDl3bW44WTF5SGpkVVd2dzkyWEdsYjNrZ0lkT1FUMXpD?=
 =?utf-8?B?OE84VE4yWVlzektKV05ldWVGd0VoMlBnVE9KMGJROEJ3U2ZUY1pla0oxSWNE?=
 =?utf-8?B?SWxKZ1gyeGhOMmhZVlh0WTlYWjQyR3VKWWVzNkFoSXZWYmxWZWtVTTJGU1dJ?=
 =?utf-8?B?OVhjWE9ZR1dNY0duZ3liazJSSW9FL2J3ZzZpMFN3emp6UFFJdFU5dzFpeHZp?=
 =?utf-8?B?SDJWVzl3UGlFK3dMREpFWUI1NmtFamtRMmZLS2ZoYTdVbVVkYWZEa3ZmZXVQ?=
 =?utf-8?B?M1JiVGtIbDZhNWNYRVVBVy83aEtjQWlLRE5pTEtXeWVHaGVCZDVxRmg5dWpR?=
 =?utf-8?B?TDl1cDlBdTZDUzkwWmorVzlJenlTSVR1NmVSaG5DZlMwNXpKSGJZWEt2KzBj?=
 =?utf-8?B?bzRJelpiWUJpbTdYUlpqd0M5WTBTYXFtakx5OEhCMElXb3BkNzNnYXN0OGRw?=
 =?utf-8?B?THJIMU5xbGJubUlrVC8xNWZ0Z29mMWpJbjlWOHkyTk4rY09DajV4U0pzMHpZ?=
 =?utf-8?B?bFc0U2drS0x1MTdZU0JVeW5BeFZ0c0xNT01WNE9wNVVQcldKallwYmo5QndH?=
 =?utf-8?B?TWd6Q1ZDYkpvNVdRaUhvT3ltaHpKaGZGWjNJMGRhUno1d016U1NVMFV4eTFm?=
 =?utf-8?B?d01VYzJ6UDh6MTd3NWRNS002L0tTNWhvSDFQNzlrUGcrcVpOMnpGVjBkUWMy?=
 =?utf-8?B?bHNZWHEvQ25xWTVLcmZYa1hidWtidUI3a3lpRmJ4T0FlMzZXNmpUbE96QUhX?=
 =?utf-8?B?Sjg5TWRlZlNyeFdxTXpteTl2TCsrU3VBSXBWVmRSMUQ0cVpXMEFQM0IyN1pL?=
 =?utf-8?B?K2hXQm1SbU9OWnJnVGM3Qm44Qit5K3N6QUdaWExvTGtWMzhpb2EyMkx5ZHdt?=
 =?utf-8?B?ckxSOS9rVmZ2end2ek5mL0hybGo2a2JFcmxleUVkUXYydDEzaUdnNmE4SXBW?=
 =?utf-8?B?VkpRd1Y1R3JUY2lqMnl1UXMwVEk2NysxdEtySTFYdkt3RHRSajNZRU9UbHJR?=
 =?utf-8?B?d3dGSXBpTGQzYm5yVFhxZ1VveXRKdG1CeFovV3dqb2pqd2h4Tit3L1lSRjhP?=
 =?utf-8?B?TWRRRDhMRC9zS2lzL2M4aytGUm0xNWltTjBCMVRTMHFVU0F4cVA1Mnl1VUdv?=
 =?utf-8?B?UkV3STNyNzZHdlVoUEdhMDJSS1VqbTVjYy83NjMyRit0Y3JOSTBraHVJTGZX?=
 =?utf-8?B?eVFaYUNGMUZJTUVqOE01NEhmVGY0NktsdDQrVjhrcTQwRDZwWFRhYUYwWnFo?=
 =?utf-8?B?THNnVFFLN2UwaVplVHJkYU5Lb2MwVDdTcGVTYlE2eTZuaTBqcFJQbFo5a29r?=
 =?utf-8?B?TzMzYjlVUHdKZm9IeXZ5S1BGQjFoK3QxbUVOLzR0Q2U2TUNDYjliZURXREg0?=
 =?utf-8?B?bVN5NFNHeWdJa2F6dUpHMzgrLzEyVS8vUmU3NHpqRklqeFZmd1VUL3RkcVNt?=
 =?utf-8?B?TGdJZUV4aDNzQUVhdUxXSWt0bzVhemRyT09mam5nNm9sYTU3cXQrTmxHM0xa?=
 =?utf-8?Q?w5Uh5M0tdWmDKNuo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23869fdf-1835-4ec4-1db9-08da3da5034d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 16:46:56.1879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OneHY/Fe5qqfFJAmLHOzcB/5x/5EuGYUezcSk0HAfukkPhxO+cqYeLL9Oen8vSJzhtRZHUODU5LY3qA6NPD0bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2980

On Tue, May 24, 2022 at 05:27:35PM +0200, Jan Beulich wrote:
> On 24.05.2022 12:50, Roger Pau Monne wrote:
> > Booting with Shadow Stacks leads to the following assert on a debug
> > hypervisor:
> > 
> > Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
> > ----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
> > CPU:    0
> > RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
> > [...]
> > Xen call trace:
> >    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
> >    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
> >    [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
> >    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
> >    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
> >    [<ffff82d040203344>] F __high_start+0x94/0xa0
> > 
> > 
> > This is due to SYS_STATE_smp_boot being set before calling
> > alternative_branches(), and the flush in modify_xen_mappings() then
> > using flush_area_all() with interrupts disabled.  Note that
> > alternative_branches() is called before APs are started, so the flush
> > must be a local one (and indeed the cpumask passed to
> > flush_area_mask() just contains one CPU).
> > 
> > Take the opportunity to simplify a bit the logic and intorduce
> > flush_area_all() as an alias for flush_area_mask(&cpu_online_map...),
> 
> This is now stale - you don't introduce flush_area_all() here.
> Sadly nothing is said to justify the addition of a cast there,
> which - as said before - I think is a little risky (as many
> casts are), and hence would imo better be avoided.

So prior to this change there are no direct callers to
flush_area_all(), and hence all callers use flush_area() which has the
cast.  Now that I remove flush_area() and modify callers to use
flush_area_all() directly it seems natural to also move the cast
there.  While I agree that having casts is not desirable, I wouldn't
consider this change as adding them.  Merely moving them but the
result is that the callers get the cast like they used to do.

> 
> > --- a/xen/arch/x86/smp.c
> > +++ b/xen/arch/x86/smp.c
> > @@ -262,7 +262,10 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
> >  {
> >      unsigned int cpu = smp_processor_id();
> >  
> > -    ASSERT(local_irq_is_enabled());
> > +    /* Local flushes can be performed with interrupts disabled. */
> > +    ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu)));
> > +    /* Exclude use of FLUSH_VCPU_STATE for the local CPU. */
> > +    ASSERT(!cpumask_test_cpu(cpu, mask) || !(flags & FLUSH_VCPU_STATE));
> 
> What about FLUSH_FORCE_IPI? This won't work either with IRQs off,
> I'm afraid. Or wait - that flag's name doesn't really look to
> force the use of an IPI, it's still constrained to remote
> requests. I think this wants mentioning in one of the comments,
> not the least to also have grep match there then (right now grep
> output gives the impression as if the flag wasn't consumed
> anywhere).

Would you be fine with adding:

Note that FLUSH_FORCE_IPI doesn't need to be handled explicitly, as
it's main purpose is to prevent the usage of the hypervisor assisted
flush if available, not to force the sending of an IPI even for cases
where it won't be sent.

Thanks, Roger.

