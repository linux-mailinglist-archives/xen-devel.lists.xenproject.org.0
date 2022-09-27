Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B95EC73A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412751.656180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCBh-0005V3-1g; Tue, 27 Sep 2022 15:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412751.656180; Tue, 27 Sep 2022 15:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCBg-0005S0-Uk; Tue, 27 Sep 2022 15:07:56 +0000
Received: by outflank-mailman (input) for mailman id 412751;
 Tue, 27 Sep 2022 15:07:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEHl=Z6=citrix.com=prvs=262470e07=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odCBf-0005Ru-Qd
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:07:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 288cb6d3-3e76-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 17:07:54 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 11:07:50 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB4948.namprd03.prod.outlook.com (2603:10b6:408:de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 15:07:48 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 15:07:48 +0000
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
X-Inumbo-ID: 288cb6d3-3e76-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664291274;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5+fHJk6tIT3fkB8+FHsYCgc7qWBK8EBs8eLiFNc6+mA=;
  b=JIXdJCjPsbK+V8RIa0WzUFUwSIcwGXcAWOF2lIH6J352kMAVS9ujItwy
   Lk65HPMAf7QP93uvoJtCi0XH94H/c8Yk6PMCSprMUPSKkC2N4ozLyqJot
   G/2RJkJgkKQuCVZd491qZHNbVlhGky07n4XKPcOTDNDCich0OWqVFkX7+
   k=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 81876203
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:p2lvl6kSWZ/48xlyYQOU3jro5gx/J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcW2mFM66JN2D2edtwYNu//R4A6MfUxtdhSlQ6/n03FiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS83uDgNyo4GlC5g1kOqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfMTlH1
 eJAEyg0NT+Dp7+wnqKCW9JTiZF2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PkGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL11rCRx3ugMG4UPK2ErvxNh3qL/WcoL0Q2RWqQr767kFHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+8ry62OCUTBX8PY2kDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihDY5g7IfnMsazZKx9FrMgy+vjpXRRwtz7QLSNkqv4xllfoeja8qt4ELC8PdbBI+DSx+Ku
 31spiSFxOUHDJXIkTPXRuwIReut/6zdbGGahkNzFZ488Tjr42SkYY1b/DB5IgFuL9oAfjjqJ
 kTUvGu9+aNuAZdjVocvC6rZNijg5fGI+QjNPhwMUudzXw==
IronPort-HdrOrdr: A9a23:G74NsK05BQ0pHpgoMhZCMAqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81876203"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMQ3jb9u/eMgjvU8bZ8PoPn/6c7egQ0By1PKa/QGgbSDvARsuVeXnDibm4Vq1m3jN3m0cYBzsqgcWm3VnyslFBOr7GzhYYRJ3fjITFx2deZuOzNQ9ASA5qNB4ZqwLTCmvrt1rkBkJLsZy9ginhjX04wagIVkcCCY0g8Lk1LZvHzN1Cfvc/FbbP7llLmb/66G9Kgl9kEBidHZvKQwWlQiw80vnvc6WlsbzsP2SkNE/BY2VAWIxSjFicHG9sSi7RbsGiwB4ENVdpo5nlXKhi0zJwL5u1I1LdBrbryl/W4wefZrv0QlD5WYWjPwuV4h8lNxpL0e2yeWHCtHbVxiiWZyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8NygkjANRAItthHsLMhTFtd9ouVqP19cXkomjrGyf4=;
 b=JmKpPQ5BTlj9BzFH+4EK+AepdnhIGhWnxo2Y37q4i+dp6n0BRGjiRY5V9JeXt+xzssEDGviZKi5a4mKYfakjPA13F8qA61rRrt8ocbhViYjis1UvFSC/NuoSFEEDLAn1UcPQDAnahyCqdtR5ThlQWb5uY98MA4oMD2FMNthpl0xP5p7IKAq3ODI7+yWenXRZlhR00ztCVEi0YsK2YMryST6HNMvGEEqmv1mPAgJidT4PoJ6QP6j/RnY5RIjAinpcu9XvpK1UBJzNoX8WzezlobfvdrJ2xghh8jdbdIb7ke2qlW2jxhWTEykxXK9oEVrMZjWPL9fRGEohwgnmHqNZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8NygkjANRAItthHsLMhTFtd9ouVqP19cXkomjrGyf4=;
 b=ufpGj9+86qIlg1YkJHbshhLJajno5pCrDTfjd9c1PCcVlX0edaCg5l6XuT9OxYfh2/HQCEOPczji367KZj2d75ck4Lw6PRYHwnGTeGxqyVCuP5/pmn0Kxr1KmzrIxuJHW7nQRFj/UNLwLJzZvymebDvnpeVdFlidfNcjktH7rlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 27 Sep 2022 17:07:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] zap linking-only option from EMBEDDED_EXTRA_CFLAGS
Message-ID: <YzMRv67Bf9QJt+Ha@MacBook-Air-de-Roger.local>
References: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
 <YzMFLffjWLzz4nW6@MacBook-Air-de-Roger.local>
 <bb89a942-3d34-b290-3977-3165f71a737c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb89a942-3d34-b290-3977-3165f71a737c@suse.com>
X-ClientProxiedBy: LO4P123CA0094.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: 721e71e3-7e80-4a69-90ae-08daa09a09dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KF5f6CJZjqYU2dD7xCnhVyF3v/mK9n6tJqUeC22Fs9N3o5EPTIJgyHbfKdTh3rVs6qzeddUF6HFBjJ/NW9UShMUfOV9Ee4K7401CTMNt2cBr239TFa6hFS2N2TmI+7++sb2seCaD2tLPFRiHW7l06/h+obArHE7HHcUHDpwYhlyb9g2PPMWvY4/p0bt7lttVEXvP28j1j6Bcjt7Tk3i/rsUjlqKcdSbOF3tL1ybtNp1IZIMn8WHhZeeq6QZLimD6Tbmubl/TTfTBvBa663AOzQV0NrfdVLZJX9nGfu1xokLjg08mkGyGZuov+G12pXojwHkOANN2euIRauGbfrFBBEaNOjkpgJDZ6dSdGvWHCxi4la1gZeQQ2tdtjaklDZFBjNzHF+GnwxKY9ErDJiE9BKn7nrR2am0e60xgaemZbu6gaaYZJk2HA18t0Q/hYxPfY6h7pDUlJwUEtn9583vfWoaknGC5G0RSfSC1KYg3z9Kkd6ZSAs+R4xJIxV4ti0y0KWyKMEmGaxM4tbcsC9MYtLIU84s4NkMsGqOrkAH00pnVcCtdmpvy/lRisFgfB9juOYkRKLdDjWDcPQN9S9yUon9oIRRpp1DHgvK9pmQTlU2BXjVfDBNzqBUu8144ZXHQsr1pphP79tNcylTWxZmcSR/9cjyN6r8B+nTTEry6uz1Is2iHVgBuPaZBs3vB4bJ66V8tT1NuGDUoutLdhhYgVZjIHVO8n1MfF8lN8kF7MoXaUygys0lus7NlYEy5f7cd46FEdiXslaJ9f6kKjCzePw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199015)(66476007)(66556008)(186003)(6506007)(4326008)(8676002)(6512007)(53546011)(85182001)(107886003)(6666004)(26005)(54906003)(316002)(5660300002)(9686003)(6916009)(2906002)(82960400001)(8936002)(38100700002)(41300700001)(86362001)(83380400001)(66946007)(478600001)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUduUGNnc1pUTElHdnR2Y2t2UXJpdHlGdDh2WFBCZUY1ZnBvUUVIUlhXcmNq?=
 =?utf-8?B?KzlYRm9sWlZLSnErM2x1Wk05TkRIUU9YZFNOMXpPU1c5UmVmenpaK040TEN0?=
 =?utf-8?B?RUtLWjIwRTR4R3dUMzhqUHJaYXc1Sit2SzBNQ01xYk4wWFNXbUIwejRLS1BP?=
 =?utf-8?B?R3U4c2JaRStYYnVnRzdJZXhqUWhNOTdQQkpmNkg1UTdvMkNwamQzaFhLNUFS?=
 =?utf-8?B?NEJWZyt6YUVsemFWWjlNcE5Bb0hkUjJ2bmFuYU9VT01nRHJUN0pVeWtXSVZX?=
 =?utf-8?B?V0s2YkgyMWtsb3hIYzluTk0vdUU5SE1UVWJLK0lIYmNEQUV6STF6RXNkMkVZ?=
 =?utf-8?B?Q3V3elpPMzJSa1ZWTGI2VElMb3QwVERENUs0a1Z6U0JhYTNLU0t3MUduYU13?=
 =?utf-8?B?TlZuQnpYVm1naXArR25sR3FFVmdoT01iQmpuMENGMEh0cTRJRWNTQTc1bHBE?=
 =?utf-8?B?Sy9wajhZZmR4VHQybTltZzJLbE1GNFppVjdSZEUvUnZIdTQ0VXhnMVpwYWFQ?=
 =?utf-8?B?bU82aXJZMVhZMnN5OEwxdFpSZDhmaUlQdmZMRU5PMWpQNmdYUDJRK3hrZ2NT?=
 =?utf-8?B?cVlHVHNHTXVUTmlrNlVvU0JZNFlBTDY3c20vMzN1QnZON2s1VlF2NkdmQXgw?=
 =?utf-8?B?THAwLzZvajl2VW5YZnB5bUlVMmh6SGF3dzh2d1IzK2huc3BWeDMzbXdNWXA3?=
 =?utf-8?B?SjBtekdMOWxueTBObWJCdTlHdCsrSWh6QlFuczY3ZG1hTEpTcldNeVhJYUdI?=
 =?utf-8?B?NFVzZWl5azVSU0NyMzJIcE1MbUFyVDcvM0V5UllmOFZlMTNUcGl4RnFsTmJx?=
 =?utf-8?B?TWZ4ZU1SNDhVYVRDbW9MWUlCcmhGOVVTV0FrZUlGdldqV1ltR1Zsbm5aTmJp?=
 =?utf-8?B?NC9GQ3BwdWxqVkdaVTUrWlVtdGF1RW5aK3ljWlhiaGJkUTduamJJWGJvdzl5?=
 =?utf-8?B?UFVISnVEUTFkcFc2bTZNdHpuZkxlVGY5UjVkVXhTQnl2YXpQdkhtRlNzc3Fk?=
 =?utf-8?B?endWcjFYTXY0MEJjWWd6cUJxL0x3bkk0TjJYaGRVTHlrNFdyMjRmd2Y3elFO?=
 =?utf-8?B?MkFqSWJEeHluQ3lEdEtsTmFjNTNWdVlJdllMWG9zSS8zb3E1a3FPMDVTUWI2?=
 =?utf-8?B?ek8wa20vcmZPZ3JaT0lpems5bEtBc25hcmZkeVc2Znl5K2pnM3VycHI3MEZz?=
 =?utf-8?B?Z1QyNlBQVTZqQkoxSklud24rR0ZOamphdjVhVlRWQ2NoNURZL09oZkxiVTNv?=
 =?utf-8?B?MWM3TFFZNE5YQ0RzNU5QZzNTNHF0VE9reEpBZFEzOTl5d2Y5TDRPYndxMlEz?=
 =?utf-8?B?NFlXR1FzMkhDV3owN0VlWFNTVlp0aFk1WG1LYUsrWTJDM0lZYUZIWXpjWWla?=
 =?utf-8?B?YkVEeVkxUWcyNm9xYUtTQjljYXM2bW85SnJtM1VZWVp6VmNzTUdnT2hXbG1S?=
 =?utf-8?B?Mjc1ZWJyVGVrVnVpdDE2WVpQNDQwRjk3R1E2ZDVUeElzbDAreGpDVDB2aXJP?=
 =?utf-8?B?RFppV0t2Zk5Vek10MmFtdzZ5MXF5QldIcmhtMXlKZnNYTmhaanNlL0Y3RGhE?=
 =?utf-8?B?WVJaQm9wSEVtK28xN3FwV09jTkhXUEo1UVZyV0ZSdVJQSjFJUktOUFVhWFli?=
 =?utf-8?B?ZDFZZzRTd0ZEY0hLVVFRb3BCY3VNaFdHQzNKazgrUUw0anN2NFIzZ0RCY0pv?=
 =?utf-8?B?MTRzeHpwQW9BMXJVdGN5LzdCdU5TYzZlOE95SnhocFlGSkp3Nk9mQXFydjJa?=
 =?utf-8?B?RFF1R0lITnF2REdDMk1FdkNEK2xvMHMvUm9SV0FrQmZ6SzRueHdtQkU1UkhW?=
 =?utf-8?B?TW9SblROb2ZNVWpwOXFyeGN4L3ZoWS9Ld1RVMjFGTVN6WldGeUZtZ1o0bFZv?=
 =?utf-8?B?aVZMdFBoMkR3WldvUnRGTkhHR0JpQnNqUUNnbk1CWGluWWZvOUliT1dqLzZO?=
 =?utf-8?B?UWpIWWpJVlY2cHhXWG1VMDRJSm94OFVDRlNwZmJPMzZPblQ4aUJIbVo3TTcv?=
 =?utf-8?B?OWwyTWhkblJhVEpNY09lUGx0ZjIydFMyZGZPRS8xUHJRN2hWY3RVVTRybmVX?=
 =?utf-8?B?Nk9Mak4vR3NZUWJ0SDNHR2xQMUM5RE5VQUNWSXFqL0hXcEw0Z1BzejNzNDVW?=
 =?utf-8?B?YXdHK0N0NHZiTXVjOWZUVytIVDVQQzRQaXFTMzZhV3dQTEd4MkN4TFNUSlRp?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721e71e3-7e80-4a69-90ae-08daa09a09dc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 15:07:48.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKzr7P+sib9F7Fu0qbowxXuckNwSotmELGnTUeaK+iCIsOaE9RaDA/kIXuyzdE4+VxQAgKQzaN6nW5lpw0VH1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4948

On Tue, Sep 27, 2022 at 04:32:27PM +0200, Jan Beulich wrote:
> On 27.09.2022 16:14, Roger Pau Monné wrote:
> > On Fri, Sep 09, 2022 at 09:22:52AM +0200, Jan Beulich wrote:
> >> While I was suspicious of the compiler issuing a diagnostic about an
> >> unused linking-only option when not doing any linking, I did check this
> >> with a couple of gcc versions only, but not with Clang. (Oddly enough at
> >> least older Clang versions complain about the use of '-nopie' now that
> >> we actually use '-no-pie'.) Filter out the problematic option in all
> >> cases where the variable is consumed for compilation only (which right
> >> now is everywhere).
> >>
> >> Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
> >> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Arguably with all users of EMBEDDED_EXTRA_CFLAGS using these just for
> >> compiling, the option could be omitted from that variable right away.
> >> But if any compile-and-link-in-one-go use appeared, there would be an
> >> issue.
> > 
> > Is it feasible to have compile-and-link-in-one-go in one use feasible
> > with what we consider embedded (firmware or kernel like binaries).  I
> > would expect those to always require a linker script and a separate
> > linking step.
> 
> A separate linking step doesn't mean this needs doing via $(LD) - it
> could also be done via $(CC). There's also no connection between using
> a separate linking step and using a linker script - aiui the linker
> script could also be handed to $(CC) for it to pass on the option to
> the linker.

There's one thing that puzzles me, if we already pass -fno-pie for
code generation, do we also need the -no-pie linker option explicitly
added?  I would expect the compiler to be clever enough to
automatically pass -no-pie to the linker if -fno-pie is used,
otherwise the code won't be correctly linked?

I would rather prefer to remove the -no-pie option from
EMBEDDED_EXTRA_CFLAGS and just add a note that users wanting to
link-in-place need to review the set of options used.

> >> --- a/tools/tests/x86_emulator/testcase.mk
> >> +++ b/tools/tests/x86_emulator/testcase.mk
> >> @@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
> >>  CFLAGS :=
> >>  include $(XEN_ROOT)/tools/Rules.mk
> >>  
> >> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> >> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
> > 
> > Is the x86 emulator harness correct in using EMBEDDED_EXTRA_CFLAGS?
> 
> Yes, I think it is (here): This is the script to build the blobs we
> then have the emulator process. Of course it wouldn't be right to
> use for building the actual harness executable.

Oh, OK, didn't gasp it was building blobs of code to pass to the
instruction emulator.

> > TBH I'm not sure the naming and usage of the variable is very
> > helpful, maybe it would better be STANDALONE_EXTRA_CFLAGS, and drop
> > it's usage from the x86 emulator test harness, open code the needed
> > flags for that use-case.
> 
> I agree the naming is, well, odd. I would be okay with the proposed
> alternative name, but I also don't view that as all-so-much-better.

Anyway, it's clearer for me, but I agree it's not much better.  Let's
leave the naming discussion for another time if you don't think it's
much better.

Thanks, Roger.

