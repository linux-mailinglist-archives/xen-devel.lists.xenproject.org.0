Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5314B23C8
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 11:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270337.464590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITdB-0004Y0-Qw; Fri, 11 Feb 2022 10:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270337.464590; Fri, 11 Feb 2022 10:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITdB-0004VD-Mk; Fri, 11 Feb 2022 10:58:25 +0000
Received: by outflank-mailman (input) for mailman id 270337;
 Fri, 11 Feb 2022 10:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nITdA-0004V7-IK
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 10:58:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86f4544c-8b29-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 11:58:23 +0100 (CET)
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
X-Inumbo-ID: 86f4544c-8b29-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644577103;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LAEMfu8n54iOxG/eCkkoBZkOUxGOxN0Zn7OnGAgWokc=;
  b=T0wGAX6CKlSJCAm3iKBXBo7Y9NInCcSppd5N3XkHgWnz7GijYjXdUDQk
   mi3n7YKHrk0+S1Wd6WEACesTdZiwEqhBsFbJvcuS0ihMCk4aWb2vUgbT9
   teTqVYSkhLzd0yJl2o//gspSBz4l0yS8uBW+nSulYtCmTYoIPIajgzOHy
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TNa7oPwQa454r2nP3RT3bUfsiYmqTRXgQeTLgbxmY6Ek+tFaZSvej+EboXwH9H1ETJc7uCF/Cy
 E7jSQt3ZtqbLDCKaC0E0KALlpD6IJmtikgCxjgzsahxXtb+/kDTBqGv6cdYYoFfLU0friyhpqV
 DRgSluSQrw9CUah8bgmPAX5SpNZW7XSsltz+5j5oPYgkh/yYNwoTYz5gVuC375+QZMijGnluv6
 AOMgD5vnj+Y8zqVVBRIYq29Hi82Fg6hlWbgryH0Ff6rQ30USNx1C+/4azsHh50qcaEC5isgh3n
 GGYlF5NYRS9zQrbPuGoNe+Nm
X-SBRS: 5.1
X-MesageID: 63910987
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HA6mUqL111I2bOM3FE+RA5IlxSXFcZb7ZxGr2PjKsXjdYENS0TFSz
 mIWWj+BMvvcYmOmfYp3aNng90IH7cPWyNA1HQRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2wueFx7
 PoRu6a+RCciDIfUybs4eTZxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uvo4BhGZg2aiiG97dX
 40LRgp9My/jfiZFM0UdN5BmssG30yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdySekX6gkUISYdRdM+YIwhnclY/+zC/MUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb7zt6cowGGxFAfpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpyP5IN8PumwnfC+F1/ronxezM
 Sc/XisLuvdu0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ba5XUm08CDIUToED/qOYuELzDFlBibbjeoM1LbO+TZA1gHWAqEfjKxr09PYdimsxoei3gp
 xlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:A5/LT6jYpND+PvJqaK9HPbQXO3BQX0B13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKOzOWxFdATbsSl7cKpgeAJ8SQzJ856U
 4NSdkbNDS0NykEsS+Y2njJLz9D+qj+zEnAv463pB0BPGIaCZ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqL+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+memsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lodFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNyN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wuJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tAB2nhkjizypSKeGXLzYO9k/seDlGhiXV6UkYoJlB9TpZ+CRF9U1wsK7USPF/lp
 L52+pT5fZzp/QtHNBA7dE6MLyK41z2MGHx2V2pUCHa/YE8SjrwQs3Mkf4IDN/DQu198HJ1ou
 WGbG9l
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="63910987"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=at3+zOGEq5vlzTFTmHR6wnBX4/2ktG4q7VaRRD2HGpEAANfd9zNVgTuPHzQgjUBljfZtalPDBztkXyzUgQXrKx4mlVJUv6BYLIcAdp+/753Kexva42e+PLKeAU0fUUslv1A9jHdc/eKWPQOrVuwY4n9dAYGQ0x2Epoz3PFMMPI4THtjBdFQ2VT0zTI5FEvFJAzF4THuM/We93+POcuXFeBzM17Sl5u8gFz5AdCM/rT95F7IZLyY8XB0ybtO5C8WGhqzpVmTl+dCBDwWQDijE/00TNMLe/4uqpkB7lLHKCwHUABkDjLvihAe1h9q6BbrqgC64TTIXTFgdNErl2pFk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFKd2TXUXKVQldH4H3LFexBdjNxq6wIR2a2fM1vQX10=;
 b=jZv9bs+0P2ShKm6XZqw7Vl0EBHLlCR01XpiBH49oRMwwkDoSekk/6g8bel+1jStJ4vfTG+jh7IsKvE0luqum5GLFt1Bk3GPF43R/qp5ZF9/nJl5lfya9FT+3FUyt0vkq0Q/9vV73MznpDIN9rPo8RcONrjX4kKrzLY3oxSaYdrZjzgMqCloVKnHGNfKY9MTJnamis7uVTNi1O6E+NToEKIs1OPY2r9iaPc2OQllvixLdAZSmFsHlfn9aG5EvoxeV8q5kfFxL1YimP8FRdJxS/ps+2tQc5otiwn/5ip0yQC78yBXFGIN2ecp6BU0UUkwioC8dZe6fP+umcx3AKirbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFKd2TXUXKVQldH4H3LFexBdjNxq6wIR2a2fM1vQX10=;
 b=j6itnMF0PVjfurTmvJ4D8h3wE359nKmOSgXiIyw/BFPSySQGNQxBEXO67+MVStpIK3olHIoYU0+YtInU5nDcXmR1JsjYCJ5uLGg0Md2H/swJvUfsYMS0urXaMm6X/jyId+yfn7wrPOO6VkS81wjDNkNpF0kJoYNlH270iXUebSE=
Date: Fri, 11 Feb 2022 11:58:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] x86/Intel: skip CORE_THREAD_COUNT read on family 0xf
Message-ID: <YgZBQQFxx5dSZQfg@Air-de-Roger>
References: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
 <1c16c2c4-0943-1db5-e22d-a6e1ffe5d00e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c16c2c4-0943-1db5-e22d-a6e1ffe5d00e@suse.com>
X-ClientProxiedBy: LO2P265CA0104.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c19536ff-6ac3-4db7-2a6f-08d9ed4d66dc
X-MS-TrafficTypeDiagnostic: BN7PR03MB3938:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3938848AB5861B06B7200FAB8F309@BN7PR03MB3938.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOTihgLKvZwFDeqdjC8jLdKSqY/PNsMnK9piC1U3shWtS3MfyiEBlUvkDZ5qcOv8jMn8eZsjrRDO2AAD9jF9mWT7vLFDB3GPxvTy1J6KbTIRxAkGmymsKel78pOeStGuwlkR13t7w5NZ4DBMzbjg461OOXHPP5UgpjB70q92ugZcqgi76TbvY/GNzuDvIW43S2Mwl55K5Ef/H4L7Dv4oBj60UZJ0n5+uXw4stmcYGqzLnLKyrrWBbi/7L2lt1c4f3vcgCRx7Wy3P/7Hz3ie8N4kfLnevNaCXPSP0CZvYYeq/VOT3bew2LNbXCUDgfySTofnWyACO523W8xBIQuPehYLpl8qUTEkI/S+5gWJ8OvUkqTjQbCN10brUbGBLtPHtiwgQNo3u5EAjdq6+BmkgcNMalwIUemAc+i9Vf4pWuf09blRNt5zA2rQ7UZf73u/miAZ8h/Fcqm/sJgAtFzbKnBaUV27dzdVqsBOHYqzW7WekybYFUYdOOQ9f8b1MroXSZOB8IsVzyvsNxLfVLxzvOu82W4U2dHPZrpWfI6TE4h6ctrDRJM2DixVAchqLAKEUJuwXakp295Ia30Hipl7fbz/rcCgeT6CNJO1FSitcifqph8QcaL8EkM0YTaxk5BVTh+6pmXEWMKBLGUs+sdFpRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(6666004)(6506007)(54906003)(4744005)(6916009)(83380400001)(186003)(26005)(4326008)(8936002)(33716001)(38100700002)(9686003)(66476007)(508600001)(8676002)(66556008)(66946007)(85182001)(2906002)(5660300002)(82960400001)(86362001)(6512007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTc5dDlYSFVFM0UxTVlZeThUbWRZd2FkalZwQXpzMmVEcnU3NTI2dklsb1F1?=
 =?utf-8?B?OWhIOU5iUmdEcVdIVVA3TmVyNGR5UFBjdkVGMzFnMEdJTjZKUmh0aWdOQjk5?=
 =?utf-8?B?bDJKVWkxTmdWcVU3cjBrNmtxUFdINnYzOEN5OVFMbkNNSEZEYVdwMXNJbUVB?=
 =?utf-8?B?R21nMHY2MGFHS3A0cFVGbHZMUVFmR09IQlpxU2xpeTYzSnhxT2dUd1NCTkNk?=
 =?utf-8?B?clU2UjVRY1Zpem1xRndwYjgxMEUydjZHVjY4TDdERmxsVDBjZUsxdVU2ZTU4?=
 =?utf-8?B?aE8rZW55WVVGM3RTcWVaY0lOR2h0NEUzaVg5TU4yYmdjYi9EUVR6SW1MaU1R?=
 =?utf-8?B?RTRNMFlNZmdzQVRhWUtsbkpnaHN0NlZBSFhOUFdwL0g4ZDAxMkorODhudXFI?=
 =?utf-8?B?TUU0cXFpRDhONGMvZkxvTS9oaTVMaHdqenVZS3F3d3dObkFUQjJiUkoyakFI?=
 =?utf-8?B?cENkUUtaRlpvekpiNitycVl4NFdwa084YkswdmZhdmthU0ZFM1lhWUVVL29P?=
 =?utf-8?B?QWUxVXRFOHBHY2RCeU91WTdFbUQvKzBlbVZUbi9EM2JNWVU0d0lCRFdvenlh?=
 =?utf-8?B?b3Y0R1g3ZituQ3hWYU9LeHhoVWd3TE9CUXEvZi9LbUpmcWRqc1FhSjBISnZz?=
 =?utf-8?B?NjU4T2JHNnFRakNYZmsvL2xPZW5waGRIUTZJbXYvaFlNM2t6cnhjREJqdjRF?=
 =?utf-8?B?eHA2dGcza3krNkRsYjBKTll6YXRGSUcxOXVXaURrSDJYcnBwcDBHNHZKRTA5?=
 =?utf-8?B?UmtoQisyRi9mcDlHeDdLcExTMjg3b2RTdWo1NGFlaFYxaVhZODdnOHp2aXhl?=
 =?utf-8?B?TGFvcXpKaVVaUkdVYXFFUDVxSWNoRTN3SnlKL3c1bTBIUFdVM2lVWUlwKzBR?=
 =?utf-8?B?MHFXL0RXMFE1a2o0OVJ3YWd3alJhMEtnaytkYW9VeVl0cHp0T0FDUEFTZnZr?=
 =?utf-8?B?cXEzUWYrWExtd3ZyZlRmZEhJZWluWm5Sc3EyVER0Sm05aFMrLzJyYjRRTFBD?=
 =?utf-8?B?M09jL29vMno3TjcvZkFCMm9CWlBDNVlud3JEVEVXRkk5czRqSFd3c0cvbWRk?=
 =?utf-8?B?YkFjdk42d05hM0lERUZkM3pzZnlhdnpzUnlUL28xSlkwUHd1bDI2Q09scWpu?=
 =?utf-8?B?ZWhwbmlNNzVYQ3Vud3kwUGZaSFNMYVI2cWUvcUk5Kyt0NjUweXByeW4ydG9p?=
 =?utf-8?B?aEhwcmFvTzhiQWxvSitGZnhSSGNhVW1VYjVuK09zZkNMajZzTFFiOGhIVjFH?=
 =?utf-8?B?Q0VYalVvTGxZZEFOaWpjSGhabXViWkg4MDltT1RVd2k4VS8rL2dGWnhJL1Fq?=
 =?utf-8?B?VFNoQmo2VWhodC9kSlA5TkZNZmV1M3pwNXpWeFQ2UXUza2ZERVd4UHhjZVY0?=
 =?utf-8?B?TTNZYWg5aWF2YW1lZHlZQ3ZmcXJGb1paSzUwVUI2MGtQbE1sREwreGtESFdo?=
 =?utf-8?B?dHRhSlBWaTllRzFUaXVZYUFNdEVSSzdhRitmSlB6TjR2L3h1bTJYMWRLV05P?=
 =?utf-8?B?WFlOTEdadE9DaVFmck11b1ZtR0VkSVFkUmUxRWpJTFVXOUx5clhYWEM1emNn?=
 =?utf-8?B?ZmtsVnR6b2ovd0pLUG9IdHNkSXNDQ3NQRUE0UGJKMlFYVEtMcHhuMEFFUEZS?=
 =?utf-8?B?QTN5cmxMQm1RZ3pESTJGRXQ2SXl2TVBGUzNZYTROM3JZenN6MHBRTUJxMFV6?=
 =?utf-8?B?SU9xREdaL0p6QmFrUmRJWHZueXJHbzhzRW9ZS2NPNUNmTnpidnZEN1dXNTkr?=
 =?utf-8?B?U3ZDcFFPc2JnVDVLeXBTT2tIMGVIRFlZRjhKQThyVFJSb1crZEJMdXphUWdw?=
 =?utf-8?B?dnBWbU1TYjFVa2xKaUJvNnp2KzRBTU83NkZlS1htcjdjUXkrdnhDM1pkdHdF?=
 =?utf-8?B?R1NhWHBsaS9TTXVCNHpneXI3SFhWSUlESDFhOVNOTjZIdUYzb2FBSWF6SFZG?=
 =?utf-8?B?RCtpYkpTaHhYdzVYcmlyZGZ6RFlIUXc4WDVMcHFsNjY4OGs4UHM3SERhcFhx?=
 =?utf-8?B?WHZkRXR4dVVid0s5MlFHOGxMYzJiQ0ZkdXVRZEcwc0FpN21MMmdsNUh4aHFp?=
 =?utf-8?B?NE9kUG9TQzMwVExTQVI2ZThDV0hpNjVCZEkwdXljTENWYmtiZ0g2Z0grVDFr?=
 =?utf-8?B?NGtSa2IvMndjMDRXRDRmVGlEK2hIajdLaGtNZjVnWUlxTUY5bzZ6V09SWVdW?=
 =?utf-8?Q?M0nMVyJ1BTiUOGLrOBt5hbc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c19536ff-6ac3-4db7-2a6f-08d9ed4d66dc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 10:58:14.4855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twsySJ7pFBZv4J0d2wJ3SR9lTbzzLbKL4F9U9nGoa93Njmov+EwkHtm0i5uKD2GLXetTjyhRjMUGT7ms5mqE8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3938
X-OriginatorOrg: citrix.com

On Thu, Feb 10, 2022 at 03:56:12PM +0100, Jan Beulich wrote:
> This avoids an unnecessary (and always somewhat scary) log message for
> the recovered from #GP(0).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Perhaps even use "== 6" in the family check?

I think it's best as is. Even on family 6 this seems to be supported
only on model 3f? (Haswell Xeon E5 v3 and E7 v3?)

The comment also seems to note this is mostly undocumented.

Thanks, Roger.

