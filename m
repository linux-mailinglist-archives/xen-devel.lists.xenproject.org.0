Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C347B443F7D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220673.382030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCjo-0001zE-Qe; Wed, 03 Nov 2021 09:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220673.382030; Wed, 03 Nov 2021 09:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCjo-0001xS-Ma; Wed, 03 Nov 2021 09:39:20 +0000
Received: by outflank-mailman (input) for mailman id 220673;
 Wed, 03 Nov 2021 09:39:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+yV=PW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1miCjn-0001xM-6Z
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 09:39:19 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abc83d9c-a535-4eeb-a451-4e82e1293dab;
 Wed, 03 Nov 2021 09:39:16 +0000 (UTC)
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
X-Inumbo-ID: abc83d9c-a535-4eeb-a451-4e82e1293dab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635932356;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=coQj0xLIQGQXzSQ42fasbdr/+h/eBGPlSgEJ/CcXD+A=;
  b=gjItZPSsMoo5Hnw82dIVDy3N2n+zSyx8CCrzwVsdgAxyjl315wVgC7Cr
   1FJETpxbPj8q2u7LdQWurmUf96m5FrZUAmdp2vXbXqQyMva5XyxtTw0bZ
   mP2wIBuFtHDPrzIEAPQkWVJEeUyVskA/XekjtsJ2g7rdDv5DCGAIDv85M
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ztPRnpfTz4zkyCNphdayBXdBXYIDnNHAMrmTMUul6ozTkgOey0G7HI267QfFl2hD/IEpOq15lA
 TDMe+uGkbSffyPYz47liHKGRFybw41bQHDdAEAIxIFTJZWvHvtQz7V/3NeuL55YmXtpx08La64
 CF4+IS1w7quUUIJ5i9V8RFdvbHu8qMLqNY7KikZgvzQ01ohK6I3hyIv5UshtvhVZwYeUohhhyD
 tE+jNpEnk+JCH7cPY4AwwzNDW513LuQerf4ugZYeyaemJkEaD+QGIsLIHc9gX/Fgi7rB7b8FSE
 zYjr8REJBPdeyM+th4b5lNV2
X-SBRS: 5.1
X-MesageID: 56934954
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8wqUQaoRA8sM97nSMfqt3rW5xXBeBmIsYxIvgKrLsJaIsI4StFCzt
 garIBnTO/2PYTH3KN1+bd7npBgPupWEyt9iHQNl/ilnRS9B8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2IDiW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncGrYCcnO5HrocM+Tz9nIzxZOIJPpZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0QTK2CN
 pdFAdZpRCniOR1GMRQSMbkdrL63i3mnKxMCi13A8MLb5ECMlVcsgdABKuH9U8aWSMBiu1eXr
 2PL4Uz0GhgfcteYzFKtzHWogePemDLhb6gbHra46/1CjUWawyoYDxh+fVG2u+Wjg0iyHddWM
 VUJ+zEGpLI3skesS7HVWhyzoHeA+BkGSddUO+Qg7UeGza+8yxyQBnUACCVAbtMmnMYsQHoh0
 Vrht/TtCD90ubuZU0Wh56yUpjO/PysSBWIabCpCRgwAi/HhqowuihPETv54DbW4yNbyHFnY5
 DSHrzM3gbkJuucN27+m5lDMgz+qpZ/hQxY840PcWWfNxhN0YsupapKl7XDf7O1cN8CJQ1+Zp
 n8GlsOCqucUAvmljzeRSe8AGLWo4fetMzDGh1NrWZ47+FyF+WOnfI1WyCFzIgFuKMlsRNPyS
 BaN40ULvsYVZSb0K/8sC26sNyg05fX7PPTrU8zzV/1tfr5ORBKg+Q5nOGfFiggBj3MQua04P
 J6ad+OlAnAbFblrwVKKegsN7VM47ntgnD2OHPgX2zziiOPDPyDNFd/pJXPXNrhhhJ5otjk55
 Dq22yGi7xxEGNPzbSDMmWL4BQBbdCNrbXwaRiE+SwJiHuaEMD1+YxMy6el4E2CAo0izvr2Wl
 p1achUJoGcTfVWddW23holLMdsDp6pXo3MhJjALNl21wXUlaovHxP5BLMZnIul5rLY/naEco
 xw5lyOoWKonptPvoGx1UHUAhNY6KETDafymZnLNjMcDk25IGFWSp46MkvrH/ygSFCun3fbSU
 JX7vj43taErHlw4ZO6PMarH5wro4RA1xbIjN2OVc4I7UBi9r+BXx9nZ06Zfzzckck6YmFN3F
 m++XH8lmAU6i9Rpq4KR1fzf9NrB/ikXNhMyIlQ3JI2ebEHy1mGi3ZVBQKCPezXcX3nz46Kse
 aNeyPSUDRHNtA0iX1NUH+k5wKQgycHoorMGnA1oEG+SNwagC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Ov/47F1r3uX1s972dXEQMYxTV0H5BLKF4OZ8Oy
 Ps6vJJE8BS2jxcna47Uji1d+2mWAGYHVqEr6sMTDIPx01J5wVBee53MTCTx5cjXOdlLN0ArJ
 B6ShbbD2OsAlhaTLSJrGCGUj+RHhJkItBRb93M4JgyEyojfm/s6/BxN6jBrHA5b+QpKjrBoM
 W9xOkwreajXp2V0hNJOVnyHEh1aAEHL4VT4zlYEmTGLT0SsUWCRfmQxNfzUoRIc+mNYODNa4
 KuZ2CDuVjOzJJP92S47WEhErf3/TIMuql2eyZ7/R8nVTYMnZTfFg7O1YTtaohTqNso9mUnbq
 LQ45+13c6D6aXYdrqBT51N2DljMpMRo/FB/fMw=
IronPort-HdrOrdr: A9a23:LG0ZY68YFpQAVkCOurtuk+FCdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8vgdQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXwOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDk1SrsA9ciYhV9MLOA4we7rFNoXze2O4DIuzGyWuKEhVAQOHl3bIiI9FkN1CPqZ4iqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,205,1631592000"; 
   d="scan'208";a="56934954"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxtaiTRpSSwDkRM2kSKsG6fZGsdoDF521WLV/yASqf6j0pG1QLFA+tjeesIS8zBAZjAzhoW+kMia12xkQS7d6aBBIhfNG+nyFbwtg+B47ET4BotZ3JhsdFXqiASbhnJzb443daSsng1Q6A38V3YeovTbOvl7SwVDo0/Stp7xy93ebA7SdNsMVkPb227JK0VJdy0HG/Jh6Aa1pT1fLMhuGCkLY67SceRK9nbCKlOZt+2e7YZwCv23UxT9kXgyR91NV/qggI3ZDVwxvd4ulzcqRnpInP3ZfZvPzIUW0/ftDD2gIbdZX0tfdDEhtaMm4pjGfSsGbTw2Wqj4w0Gz8V3ZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz91ISBCw8rK9WIlOy/RAh/PqrG+0J2bQM03SsiPOxk=;
 b=SNszv9Mo0/W8stZ+Nq9gtz2B8fs0fLuUGrRkaDnOacK/vF1pJ5AF9LJd1CfmuRmejVs6pE7LsEnyv6e60oc87Cx/G58JBiRG249nymhUF/UBui5YR2s1BPsZEWSNe7XqFJMNcIAWxfOnMtzraeWnBZ74YJywXMjyJUQvuPNAsOe5iM+MSUE/FinehHjZUlqVur9XNcKODO6uk9som1VDgaoENeo2P1p4mPRtYq5i2H+A9iu36wZdjeUuw0e/2SM2NtFJtLaA9KH5L3SrAEJj9GOFfXAZOwn/E95KI4OW9G+f3kY2DDFIXuP43XOPvPfxemgHzV5rKkKGGjj+uF0g+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz91ISBCw8rK9WIlOy/RAh/PqrG+0J2bQM03SsiPOxk=;
 b=diZcDDMcMk9smmFR7rgEsVMicGL6azBAPz+HVz2eu3DzsyPC5e1T+vufQEQ8T8Td2Ys4aMqJhiTIRLJmtYKh/CHAmdLMTbyshMpue0moXh+tsxo91Nrd64JjtMJgQ2CHpNReruXjBtD+jQT7KZ5tGVt2zPZZOp23MNMd9QBlEWs=
Date: Wed, 3 Nov 2021 10:39:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Message-ID: <YYJYurhhGGvjRSfH@Air-de-Roger>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
X-ClientProxiedBy: MR2P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee01d3af-e3d5-4ff7-b542-08d99eadcb2f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4540:
X-Microsoft-Antispam-PRVS: <DM6PR03MB45400B2C258D51B7BE23009D8F8C9@DM6PR03MB4540.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IdQpmLx2Spxy2Zm3UUAV/EhZYwWUp3GU5cJyguKysV5AXjoTI9Lpygw/JKSwhIp+TpUj0kbL+5mHdDaB08eG8EsNq3qkRrZ9FSGCCfK7ZDrEkwAs6VbbKRi9s6I2vRiy/52tmhGzKscpHqI8X0yBRixs1yRoQjXwxI8wWPAJxUMIcOMTj/XiIMu7a4EgUEWKADa5JBHXB9sM1h6OggtXKydM04XU3s24JeFnJwIcS4LoQZ6zb8Rsgr6hH0V71CGabFqK+eC95mh8y9XRxrzpfRoNk3n/ybY1ZpwUYRzDPXFUvwfdkHm6W96PUSu/cJZ/epCT5jCvuS5573zABoTtNbYo3ANR/a1q0Y3Byw2AJtgJ+KOu+HgvwRY1on2UKFhBwoTeOg1eFnTCvoNOThZ+TYR/RKQj6bAsnIqyelVBLkgohYm0kVHzS5TPoEl3kTE5433gA4GxwrBsSAikXxsUDFeeSbTFQ44SJLk6k8ZIR2L+lOWmeQ1Q30+5FgbHthCY0JI0BPJFbuyT2eWSw+Jcc6JKX+Y//wzUnIvWRm8yTbHdG0gODwNFcosWkDVdBKRbEnm3vyTtzS7gFeiXf3/YtzJOLlR8CmRvkn19y/YrFSJEgmC6W7wnnqib0Pqinfjc/pAnjhFqwr36W1YmdI6n/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(508600001)(26005)(6496006)(85182001)(5660300002)(2906002)(86362001)(33716001)(53546011)(186003)(6666004)(7416002)(6486002)(66556008)(6916009)(956004)(66946007)(8676002)(8936002)(82960400001)(66476007)(316002)(38100700002)(54906003)(4326008)(9686003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnJGVVlROWtJMG0zWnRmRU5wZnh5RGwzYUdtOWdKZWhINkVJTDZHeC9nV2Er?=
 =?utf-8?B?YTJ6OU00dmorbm5nZXlSaUxubUxGMGZLRFhJbGpmc3A3TUpmUHpha1FzMks2?=
 =?utf-8?B?ZXVMMUNSd1JJRHNiay9CVkZYTldQTFo1ZTYxZmpReEhMRTVldVhneWpqL3ll?=
 =?utf-8?B?NmJTWVJiOGs1dGpGM2ZvajM2VkR6RnVVUGprK1NucDd5OHBSdXc3ZUdYWEUx?=
 =?utf-8?B?ZmVZTHZMSVJvK2RrYWJ0ckZ5VUNaSUdjTXdwMy9WUlgyMWh5QXM0RHJFTUpB?=
 =?utf-8?B?SS9xSnZSRDRNczc0VERRd2NjYWNBM3ZicCtUWXprbXg0RVorRitYT3Jlby9R?=
 =?utf-8?B?WEZHVUtFMHl0eVM1SVhSZ0dmUjhFT1F0cHluRXVaajRFb3o3MW1uQWUzMGdD?=
 =?utf-8?B?SU9uTzlaVGErYzE3SFNvUzkrN1plalRoYjNNVk1RS29TTE5DVUc4NUFJdTZY?=
 =?utf-8?B?YlVDaXU3ZWtIQ3dPUW1WejgxQ3B4SkxmNkUwc0R2ckF6OUJ4dnZMTVpnbzh6?=
 =?utf-8?B?bmtrSUhnYktvdmxJeXlVZTNXZmZXYldHYjU2U0t5UlJzblU0UFNBQ00xRDlV?=
 =?utf-8?B?clhDemJXdHlGYmNLNTd6L0lqenkvUEw5ZVJvODJQdFhSQnFDUHdhZ1RGSS9w?=
 =?utf-8?B?Rlh5ZHFCanRWUDZyUmJoR3JFT3NPUzM0N2lmdzBHc2dMRlpkYzhiQ2tiUFpv?=
 =?utf-8?B?aVFCZjlIOEthdHVXeXZ3MTFVRHgvMlhxVXV2ZjVaclBDeXZWK3c4VUJLdTF0?=
 =?utf-8?B?ZHZGZ1lCSjB5UTFQQXhocmNhTXU0a1JEbWc2aUovWFRZZkllRlBBYWhZVUw4?=
 =?utf-8?B?SnRrVU1jRW1KVjVQbHhxNmRpYTJFRHpQbU5aLzlGYmVaaE5XTnBCTGsxN3Nt?=
 =?utf-8?B?ZnV0ZlQ3L0NiQTE1U0RMS1ArNHBCY1pRQnp4NnFWMTMrMGFwbzVaa2lyczlN?=
 =?utf-8?B?NW1Kb3lnUEFUS0Z6SmhiZ3BBWUMybkh1TGdnUk5GUVRPREpxS2J0ZGRyUGNy?=
 =?utf-8?B?Nk5hblVCc1hYMFVLUUFWd2pVYitVVmhOWW91SzcvNmV0QVNUNERKOWM0aHZk?=
 =?utf-8?B?eDdjMVpmR0pTZTNreUVtOUhsYjYwZWNWM0U1dHg5NGEzYjZtbmtxVnNzVFJa?=
 =?utf-8?B?S1A0SjltTDFaRkQ3Vzk5R3RwMUN2cHF5RHo0Z0VzaWFoamhSMWhERzByYUVv?=
 =?utf-8?B?emFhUDV5b045ZkQ3OTdMZXlFNkhib3FOUE1JL2EyUVI2azh0MkNOUm44K2h4?=
 =?utf-8?B?b0hsL0pWcTlLNER4cmNFYWVWUzU3dGhHZlErcEhXQXFJOXc5OVozVC8vbnBY?=
 =?utf-8?B?cFhoVzZ3a2xCWkthTFVlUiswQ29wOFRCb1FQdXhOUnVCRDk2ejNTR2lIYWRK?=
 =?utf-8?B?UmJtQVdFbWFJOUNWYVVlRTNyc2FIVGpLYkR2bUF1WVVqaFZrdmUxMXRrS0Rn?=
 =?utf-8?B?RVBabU5KM0RNNXBLNFZaMDlQUWtVR1M0MEFVM3NSUjQ3MFFpSGJvSUtYQ21K?=
 =?utf-8?B?Q0xPTEg0TWNTVnJRdFF1SlYrVkpmbGpDQmo2ODE0OXh2OVBSZjlsNGo2cjVV?=
 =?utf-8?B?UE5vQmVaRFY0cTgzS3c5ZGJ6Tjg3UndRZ25TdWlpdHNpaThGdmRjOUJId0c3?=
 =?utf-8?B?S3AySjZqdWROYWEyQS9USW9hNmo4VUFCT0VDTU13aCtacFh6WTgrUVViTi9y?=
 =?utf-8?B?UFhrc2YvU2RQeVJ0YTB2cERZYTcwZlk1QldYdjZwWThUSDJnblJJSjBWdEhG?=
 =?utf-8?B?UW15bzNEV0NEa0wvd05VV3d3K2hRcU0yNy9XWEJOc3VqODQyOHJDUmRCdjNG?=
 =?utf-8?B?TFBLTFlaZGRnV1VVOFl4NHJSbDVZSEdGSGlGLzJWRU9pdCtLQkh3OXJ5bmYv?=
 =?utf-8?B?YmJzaXZOdGZxVVFQMno1QllmbHVLa0hKKzRQdjdEenZ4d2dYWFpSbzM1bnNB?=
 =?utf-8?B?UnJKZ3FQZE1vREJ3UldRdVFvOG1mcVN4bXF2UkFXb0V6d244N1BPZk9oWG5l?=
 =?utf-8?B?Z3MzcU9TM240UDk2OU45dDd4ZVZyL1Z1NW4rb1JTT29iVmlpbHhYYkFPN1Zw?=
 =?utf-8?B?MDlYcHFjY2t1ZXl0d0tQalk4ZU10WjFEaWZMVTdMaVZtcVlSeExubmYxSFdD?=
 =?utf-8?B?QUY0czlCMzkxVENHcnQwLzVnZWpIckp2N1d6dTBEdlhYT2lHNkdJWW1vYkxy?=
 =?utf-8?Q?fmXBa1uCWu3WnzBkrZU6LFA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee01d3af-e3d5-4ff7-b542-08d99eadcb2f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 09:39:12.5974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/WnCDe6YHM9gV6zCdGoqMYMKalqHGFlhWN5pj0YFGdf7IhLrBJ8o0G2JxbJlBApsH0juuzuV6w1qAklob6YVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4540
X-OriginatorOrg: citrix.com

On Wed, Nov 03, 2021 at 09:18:03AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 03.11.21 11:11, Jan Beulich wrote:
> > On 03.11.2021 09:53, Oleksandr Andrushchenko wrote:
> >>
> >> On 02.11.21 16:10, Oleksandr Andrushchenko wrote:
> >>> On 02.11.21 15:54, Jan Beulich wrote:
> >>>> On 02.11.2021 12:50, Roger Pau Monné wrote:
> >>>>> On Tue, Nov 02, 2021 at 12:19:13PM +0100, Jan Beulich wrote:
> >>>>>> On 26.10.2021 12:52, Roger Pau Monné wrote:
> >>>>>>> On Thu, Sep 30, 2021 at 10:52:20AM +0300, Oleksandr Andrushchenko wrote:
> >>>>>>>> --- a/xen/drivers/vpci/header.c
> >>>>>>>> +++ b/xen/drivers/vpci/header.c
> >>>>>>>> @@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>>>>>             pci_conf_write16(pdev->sbdf, reg, cmd);
> >>>>>>>>     }
> >>>>>>>>     
> >>>>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>>>>> +                            uint32_t cmd, void *data)
> >>>>>>>> +{
> >>>>>>>> +    /* TODO: Add proper emulation for all bits of the command register. */
> >>>>>>>> +
> >>>>>>>> +    if ( (cmd & PCI_COMMAND_INTX_DISABLE) == 0 )
> >>>>>>>> +    {
> >>>>>>>> +        /*
> >>>>>>>> +         * Guest wants to enable INTx. It can't be enabled if:
> >>>>>>>> +         *  - host has INTx disabled
> >>>>>>>> +         *  - MSI/MSI-X enabled
> >>>>>>>> +         */
> >>>>>>>> +        if ( pdev->vpci->msi->enabled )
> >>>>>>>> +            cmd |= PCI_COMMAND_INTX_DISABLE;
> >>>>>>>> +        else
> >>>>>>>> +        {
> >>>>>>>> +            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
> >>>>>>>> +
> >>>>>>>> +            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
> >>>>>>>> +                cmd |= PCI_COMMAND_INTX_DISABLE;
> >>>>>>>> +        }
> >>>>>>> This last part should be Arm specific. On other architectures we
> >>>>>>> likely want the guest to modify INTx disable in order to select the
> >>>>>>> interrupt delivery mode for the device.
> >>>>>> We cannot allow a guest to clear the bit when it has MSI / MSI-X
> >>>>>> enabled - only one of the three is supposed to be active at a time.
> >>>>>> (IOW similarly we cannot allow a guest to enable MSI / MSI-X when
> >>>>>> the bit is clear.)
> >>>>> Sure, but this code is making the bit sticky, by not allowing
> >>>>> INTX_DISABLE to be cleared once set. We do not want that behavior on
> >>>>> x86, as a guest can decide to use MSI or INTx. The else branch needs
> >>>>> to be Arm only.
> >>>> Isn't the "else" part questionable even on Arm?
> >>> It is. Once fixed I can't see anything Arm specific here
> >> Well, I have looked at the code one more time and everything seems to
> >> be ok wrt that sticky bit: we have 2 handlers which are cmd_write and
> >> guest_cmd_write. The former is used for the hardware domain and has
> >> *no restrictions* on writing PCI_COMMAND register contents and the later
> >> is only used for guests and which does have restrictions applied in
> >> emulate_cmd_reg function.
> >>
> >> So, for the hardware domain, there is no "sticky" bit possible and for the
> >> guest domains if the physical contents of the PCI_COMMAND register
> >> has PCI_COMMAND_INTX_DISABLE bit set then the guest is enforced to
> >> use PCI_COMMAND_INTX_DISABLE bit set.
> >>
> >> So, from hardware domain POV, this should not be a problem, but from
> >> guests view it can. Let's imagine that the hardware domain can handle
> >> all types of interrupts, e.g. INTx, MSI, MSI-X. In this case the hardware
> >> domain can decide what can be used for the interrupt source (again, no
> >> restriction here) and program PCI_COMMAND accordingly.
> >> Guest domains need to align with this configuration, e.g. if INTx was disabled
> >> by the hardware domain then INTx cannot be enabled for guests
> > Why? It's the DomU that's in control of the device, so it ought to
> > be able to pick any of the three. I don't think Dom0 is involved in
> > handling of interrupts from the device, and hence its own "dislike"
> > of INTx ought to only extend to the period of time where Dom0 is
> > controlling the device. This would be different if Xen's view was
> > different, but as we seem to agree Xen's role here is solely to
> > prevent invalid combinations getting established in hardware.
> On top of a PCI device there is a physical host bridge and
> physical bus topology which may impose restrictions from
> Dom0 POV on that particular device. So, every PCI device
> being passed through to a DomU may have different INTx
> settings which do depend on Dom0 in our case.

Hm, it's kind of weird. What happens if you play with this bit and the
bridge doesn't support it?

Also note that your current code would allow a domU to set the bit if
previously unset, but it then won't allow the domU to clear it, which
doesn't seem to be exactly what you are aiming for.

Thanks, Roger.

