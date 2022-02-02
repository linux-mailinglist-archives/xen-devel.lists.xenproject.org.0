Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213014A6E04
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263919.456801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCCV-0005J8-8s; Wed, 02 Feb 2022 09:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263919.456801; Wed, 02 Feb 2022 09:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCCV-0005Fy-4U; Wed, 02 Feb 2022 09:45:19 +0000
Received: by outflank-mailman (input) for mailman id 263919;
 Wed, 02 Feb 2022 09:45:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFCCT-0005Fs-RM
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:45:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d19be293-840c-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 10:45:15 +0100 (CET)
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
X-Inumbo-ID: d19be293-840c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643795115;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qy4CHoMERCfhJBZVO4KXL3yj+XIpuSQO1pU/ZWIsUcs=;
  b=Q1iM/RK4hpjjR9h42D30thBzC8A47qcHXpvZLkrPu/+g80O1pMTyFW6R
   OrLQMt3laAnlfiuHNzNvoW1sCX8aU6cn9xSiDb90PE5Xpe3XOvkS58yYm
   vk5oIrn6FhZfPyQAi3z4zQmIYm+ZAqlm54W63TPlIU5vMw+F3vi2ly9X7
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lNZrdtPnl3IxEKApYEvHBGFKJJmh43hGDiHONqY2da/qJ2gVnrYf3Bg0OG4x17hOuW9D0s1eiH
 FudRBRRf97zNeC+qn+ADK1DanHzQVQ+VWssvl0wQcJmlELUAJkzcuZdon5wVHG23kRrtAfiPjW
 8IZ2IDBa9nkpYoxRH+5ahVvp7OsVTuHHGgqbVeoXTSI6/8mIw0mhYPyaXUd9BtnTQ7qv2kJc4a
 o5FgDEVkDCXpZDA3t3xVZIIqat10gfROguI6yca4PfV1fVJ74lmJkI4vq0ZWkbLg/oo2m7SUAn
 CH3c2E+EHemvUgJRdTP7bnef
X-SBRS: 5.2
X-MesageID: 62766875
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Dip8R6KMCS8fUcXUFE+R7ZMlxSXFcZb7ZxGr2PjKsXjdYENS1GQBx
 zFLW2mBb/bYYjaje9wjOo3noU8DucSGyNMySwFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7wbZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB22k48rz
 ox9i6ePTAoGZPHHneNDTBtxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uv4AGgmdv26iiG978Z
 vs+Wyd+Mi/jeiJNK0cuFcoYrLqR0yyXnzpw9wvO+PtfD3Lo5BR4zbzFINfTPNuQSq19nEyVu
 2bH9GTRGQwBOZqUzj/t2lu2muLKqgbqV4sTGaOQ++ZjhRuYwWl7IBoSWFigqP+1kHm3Xd5FN
 lcU8Sojq6s13EGzR9y7VBq9yFaetx4BX5xLEus16CmE0K+S6AGcbkAOQyRdctUguIkzTCYzy
 16St9rzAHpkt7j9YXCA8raZqxuiNC5TKnUNDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWr7wVgdRRj/3j1V/CijOo4JPOS2Yd+ALTWW606xJjU4SsbYeo9Fvz4O5JKcCSSVzpl
 H8AlsuF5eYCF6aRhTeNS+UAGrKuz/udOTiaillqd7E67Cik8XOneYFW4Rl9KV1vP8JCfiXmC
 HI/oisIusUVZiHzK/YqPcThUKzG0JQMC/zaWq+OaIN+XKNOcQKopn1lYEnOwGLExR1Efb4EB
 b+XdsOlDHA/AKthzSarS+p17YLH1hzS1kuIG8mlkk3PPa62ISfMFOxbaAfmgvURsfvcyDg55
 eqzICdjJ/93dOTlKhfa/ocIRbzhBShqXMumwyC7mwPqH+aHJI3DI6OAqV/CU9Y890iwqgsv1
 irlMnK0MHKl2RX6xfyiMxiPko/HU5dltm4cNicxJ1uu0HVLSd/xsPxAK8JmLOR+qrwLIRtIo
 x4tIJ3oPxiyYm6fp2R1gWfV8OSOiyhHdSrRZnH4MVDTjrZrRhDT+8+MQ+cc3HJmM8ZDjuNn+
 +fI/lqCGfIrHl0+ZO6LNq7H5w7v7BA1xbIjN2OVc4I7UBi9r+BXx9nZ06Vfzzckc0uTn1N3F
 m++XH8lmAU6i9RkrYCU1f3Y9NrB/ikXNhMyIlQ3JI2ebEHy1mGi3ZVBQKCPezXcX3nz46Kse
 aNeyPSUDRHNtA8iX1NUH+k5wKQgycHoorMGnA1oEG+SNwagC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Ov/47F1r3uX1s972dXEQMYxTV0H5BLKF4OZ8Oy
 Ps6vJJE8BS2jxcna47Uji1d+2mWAGYHVqEr6sMTDIPx01J5wVBee53MTCTx5cjXOdlLN0ArJ
 B6ShbbD2OsAlhaTLSJrGCGUj+RHhJkItBRb93M4JgyEyojfm/s6/BxN6jBrHA5b+QpKjrBoM
 W9xOkwreajXp2V0hNJOVnyHEh1aAEHL4VT4zlYEmTGLT0SsUWCRfmQxNfzUoRIc+mNYODNa4
 KuZ2CDuVjOzJJP92S47WEhErf3/TIMuql2eyZ7/R8nVTYMnZTfFg7O1YTtaohTqNso9mUnbq
 LQ45+13c6D6aXYdrqBT51N2DljMpMRo/FB/fMw=
IronPort-HdrOrdr: A9a23:6p0YS6rMMiCaQ9+ON/hwT3YaV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,336,1635220800"; 
   d="scan'208";a="62766875"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SP9OYwr9XzMRDEH3zZoDT4YA0X6D+t2eFE20aZgS7B4Nqq/B0Ho+lxojp3ZjGwLw0coLJVF5gq3LtuFQE7rAuvTC1ycIR+ZUOBdK/diKPfi4+Jmo0tfc9LGOIPB84ANobaPWF2Uwia+h5S4N9IwV54mYW2sTuhfQkUyE/32Mut8CGdnk8td49GWDhvKklZQ6PtNxviemWwWHspDj4tzwLHDkA00CT7iXNnAwiW81CfuZmDBnqRwqEBFKh+xLH5ejKPmXXy6xjFBnYO1UP1AbaOKV/0ya3SHtWuAzcBKzDjGbfEoJWjvzUJQg2NMcVUCaUMhbBc37Zg9wu55tkwVtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiuF1apECAnbhAM7S6UWj9N5RR/vCYnE9hCPsKt8K+Q=;
 b=IhTbqLMj7kc2t9dpKPQci2MCuEaKGJYsXDjgKfvUWCeZt2n3vFhWBVOmtinB/QgsqaNltidSIm2HFJ5BlsIy2i+UPzjAEKihXeM2UtaB9PUaMaCi7hKEiyLbg0thRjGProtW5iMMMrzV2N/f0wrATeRdyiYyuPNyAEFEmHMY++RccNNoULNOizUgcpOms81XKUb+g4qxexXacrKQSJKopu4oyGhFhdjEa2AublGVqQGJDTMgae+a3wJOBnZplCcrygsIc0oNpRkNg4n0wZFWEAZSi0NtMbIKw/L0aekBEpb3pEIDLbtvo+hjc51pWIkxk23ZWUKQC7qPM1t5MQf9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiuF1apECAnbhAM7S6UWj9N5RR/vCYnE9hCPsKt8K+Q=;
 b=OxQxPUDjUrk6piNA0yDd/0fzfDD55eEqmSnXgbrQgtxwDJmEJqZoBuU8jHkqw5VqqfaHXXmAL5zmfXeJ4kANPqHDTsqnkd4M9nySCBtSt/nUITysSVGVWKuNZIwu8fcZtQF6jaYjOknCN1K6VDXZVU0rK4Q3w3X2r3aTAtQmP2I=
Date: Wed, 2 Feb 2022 10:45:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 4/4] vpci: move lock outside of struct vpci
Message-ID: <YfpSnTrh6dcbrNNX@Air-de-Roger>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-5-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220201162508.417008-5-andr2000@gmail.com>
X-ClientProxiedBy: MR1P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 390b6aa3-9358-4940-4d0c-08d9e630b1e6
X-MS-TrafficTypeDiagnostic: MN2PR03MB4911:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB49110029DF32A81739500F6A8F279@MN2PR03MB4911.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJffYKopixjmvQQJDEkj8ErMB0BdPyD5h7jwOW2g69FY+sAHKQlI4oVlWsNqT+1kyanKhIMtHSynrlhTJy/t3px1sm+7A7WTts3M8iDoA7Yb0N2olWEoFaaT/s7yauRpTc9RsipPq5XPcg62gLzegMOnYmtsT6IiMKF0XriueBfQBz4UQps0SxuEFf8ZSKpMuX7qgKzg09/fUsc6yxqGp7AM98e4JGDMcoDQLnwq/y+QR9g6Th+kn1GjZYl1Nx1tss70WypEhYxPNbz35YomVM6iLFdipbgk7zATXDz1zxmNNhLLRwfnI+11j1RlJzH150+F9ycy1CM1/ME5+XKIoSBjZqbZhacpvIfkRnKAXpHJnLRF5/2PjOzFh7Ng7FPF4xDgvjCgePKQFWfCmErAC8i/ONo7b7Gz7ZKk3tEkmHvLYgs6I6C4w+NZkML1W6yYcXyNqg0NQl9SD+bUdY5TY2BGqtiB8D1t9BTHjADE+8MZPO5wgQMkTOa885KPHzS25xCq/DyGRJ+Upo8iV2N/pb7U4zELVA2q5xZ1zZIs41xBp+cn92IWbahf/aCGkQNx2KOUwAI4t66TruWWzgbE90gtOULF1x3TQQbYSJXjNP7zHcvedcUE5/MHH3Bl8EUh7pZG3Vn0Eu6sVbiZfoW8s6+LRHn1v/E90y6VstfiEsMOwjX1n8I8roEn/BG8piP5jxXnxw5q9kDJsyMvB4Et1MJ++1RF7dgkHORat68b3B8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(5660300002)(8676002)(6512007)(86362001)(7416002)(6666004)(4326008)(85182001)(9686003)(66946007)(26005)(186003)(8936002)(6506007)(66476007)(2906002)(66556008)(6486002)(966005)(38100700002)(82960400001)(33716001)(508600001)(83380400001)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHFwY1JSN293WUFsckVwWDhLWW41OS9pcmJ5YkJ2Q2swZFE1OUJlMDZxUndw?=
 =?utf-8?B?WEl2UFhjdWVzOTNvTnJPMGQyeDN0VGU4NFFHWlRYZXU1a1NGcEZ5emM5MzBZ?=
 =?utf-8?B?cU5WVnRDZzlRQTNGRVlSOTZZWXdxQ1RodWxGVnM3N04zTHBKMmRaaXg4bWo4?=
 =?utf-8?B?SWxBREhveU1QSjNXZlpiTnNPbzZrUW1XR0I5S05aZ1F1MldoM3l3aG1kU0F2?=
 =?utf-8?B?K1I4SWZwWmp6OHJ6T25UMUJaNVVYcDR2cnV4N0VoQndXMk8xTklYaGFvbjEx?=
 =?utf-8?B?ME1PT0FxUjBCYmNyaG5DUjkrVU51L05OOUpHS2JWakRnK0lsYTg1YWoydExn?=
 =?utf-8?B?K1VMbi9MRDRxRFlLREZ3YUlFL1RFYllCdS80eUMvbW1oYmJDazJXcGV3bVhP?=
 =?utf-8?B?MHlaOHVwTCt0OXFnWTBMUjJVRmNmRnlTa2FyblVoLytsZmxNeXBTb2JGODl5?=
 =?utf-8?B?U0NjODVhaUVNaTlBZXdDMkRPZC9TTHRWNzcvbGdCREVHMzl6R1BPTHZJOHAx?=
 =?utf-8?B?bzBLUnRtNm1FcWdMalVFN3hXYjdCa3B1ZStBMHhFTDg5SC9XWVZ4dWdwNFIr?=
 =?utf-8?B?ZXRVSWlON3IvblVNWU5QM1AwVzY1dFd4S2RkelM2NzFmZDJIUXVTY0JZQ2Z5?=
 =?utf-8?B?NWpSQjBsb2RVK05zRFdJUS9uMkcySzMvK2gvYUxyTjhrUUMxUkl4WTRnRy9D?=
 =?utf-8?B?MXhUcStZM3Nqa201UkRBQlQ0MEFkeEFGMUVlSXlwN1NzQnY5d015elhOSzAy?=
 =?utf-8?B?RDJNWUVnci9oZWRPTndNRFcxQTJWN3NROWw5cng2YUhDbnpsQncyVlZ5Nm5a?=
 =?utf-8?B?Vlhab1FRdWpRVE1PaWlsNEUwTFkxYTh5OVhKc055bUFaYjV4anBLelpLOUM0?=
 =?utf-8?B?YXROUmFKS2ZEaTN1WFlZQkQzcVdVdkxMZmc5aGJzS3hzL2Q5Wm9yR2Jsa1Jk?=
 =?utf-8?B?T201UzEyL1U3SmYvdzlvSlBDNngvN28zcVdnUy9sQ3JtMi9TSVBNNnh4dmJD?=
 =?utf-8?B?UlVaNk1TbUhhbmxUT0ZqU0F2T1FuSzlVTm9ud3FvcFNGSEIzRWxMd0RwalhM?=
 =?utf-8?B?N2x5OG1rWERZS3V0UzU1eDE5eFZzbTVScXZ3aXkybVFCcVpTVUN6S3FUSUdy?=
 =?utf-8?B?L2pPWEEvL1V1S0RWMDhXR0ZIalpCLzZ3M29haTBRZDVpWERwcXM0cVlockpz?=
 =?utf-8?B?TS93Qmx5K0pHSVBVR2ZaNUVyNVRKS2k2M2RONzduUWJMMS9hQlFEV3pPbVVL?=
 =?utf-8?B?SmpXMnJPN0RaLyttNEFNekZhYlRQSzFjMGIvN3Vubmpobm90R3krb2ZuN0k3?=
 =?utf-8?B?Z1ZVVEMxYkVEM0pVUjdQemNpR1l3QWhmMXJJZ0JrZ1VrOUxiQlQxOS9MSHBP?=
 =?utf-8?B?NVVnZE5oWm81S2p5SG5VNEl6VHJqVFFLZWl5UXlHUjB6VE96TFBtTU1yWFFR?=
 =?utf-8?B?YmNaNW5taExJdXMrK0s1NFAwTXdUcWJKYngwWWJoZGxzSmppSkpkMnB3c3dj?=
 =?utf-8?B?UWZlQmdIa1RGZGhFMFAyRDB4am1IMjc0RHRxNlUvQlBMMFpwcmk2bmZiamVj?=
 =?utf-8?B?Wks3MVdhOEJ3d2ZEb1FFVHkxZlJnUHl1NzQzKzBvdkN1SmV4TXFITHJGck9s?=
 =?utf-8?B?M0tLSTJrZW13Y0oxRHg0ZGZGSXUzbUVCb0k0ck55VzFQTEM2OXRSdmhWTWJD?=
 =?utf-8?B?aFQ5V2g5dEtEV3U4MndYSEFqNTJYd2xSTGozdFNqd0hXeHVVVy9jRWE0TDZU?=
 =?utf-8?B?M09CWnlRcXh2ZnIyUHpNMWxvNFBHYWdkdzZXbm94RG9ZVFZPSjNJQWhuTTdT?=
 =?utf-8?B?WnNybEc1bHBUNWdyeUdBZGlZOG8wQWN4NVFSNmRvcWR3c0pCaVpLdWRvK2cr?=
 =?utf-8?B?ajdwY21nWlNrOG9uUzJ2S0s5Z0d6UmZnbngzYit3ZlNQU3pMYjZaQ2FUcWpt?=
 =?utf-8?B?eXkwTGJzVUYzamJZQzFsTWtUVXBIWEdRa2NxaHdoaVZRNk5MWEZUSW1YMExK?=
 =?utf-8?B?cDl5NHZrQ0pRM1dNK0lmMng0SW9CM2tZS05USUY2K2pIT09IWTEza1pOSkVR?=
 =?utf-8?B?dDc5bkZEU3duLzhnR2xzY3BJdGY3Um9MOGFrRjJFR3JJY1lPdEZYd1QvTHJN?=
 =?utf-8?B?QTBSMEJaMDA3d2NoTThjSGU5Rm9vTnlKb09LalAzbXlNR3hWOEZCUFBqeWxu?=
 =?utf-8?Q?x5JVMsaXwuZx8E061wRvo8I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 390b6aa3-9358-4940-4d0c-08d9e630b1e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 09:45:06.8364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAn8tXkdYcaECT6ykbst5PqcKBv4/zjFQwBtCBBoj5645ZIi14ExAByyVXUmG62T7RJpBqmrmePTlwfNpNnDbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4911
X-OriginatorOrg: citrix.com

On Tue, Feb 01, 2022 at 06:25:08PM +0200, Oleksandr Andrushchenko wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> This way the lock can be used to check whether vpci is present, and
> removal can be performed while holding the lock, in order to make
> sure there are no accesses to the contents of the vpci struct.
> Previously removal could race with vpci_read for example, since the
> lock was dropped prior to freeing pdev->vpci.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
> New in v5 of this series: this is an updated version of the patch published at
> https://lore.kernel.org/xen-devel/20180717094830.54806-2-roger.pau@citrix.com/
> 
> Changes since v5:
>  - do not split code into vpci_remove_device_handlers_locked yet
>  - move INIT_LIST_HEAD outside the locked region (Jan)
>  - stripped out locking optimizations for vpci_{read|write} into a
>    dedicated patch
> Changes since v2:
>  - fixed pdev->vpci = xzalloc(struct vpci); under spin_lock (Jan)
> Changes since v1:
>  - Assert that vpci_lock is locked in vpci_remove_device_locked.
>  - Remove double newline.
>  - Shrink critical section in vpci_{read/write}.
> ---
>  tools/tests/vpci/emul.h       |  5 ++-
>  tools/tests/vpci/main.c       |  4 +--
>  xen/arch/x86/hvm/vmsi.c       |  8 ++---
>  xen/drivers/passthrough/pci.c |  1 +
>  xen/drivers/vpci/header.c     | 21 ++++++++----
>  xen/drivers/vpci/msi.c        | 11 ++++--
>  xen/drivers/vpci/msix.c       |  8 ++---
>  xen/drivers/vpci/vpci.c       | 63 ++++++++++++++++++++++-------------
>  xen/include/xen/pci.h         |  1 +
>  xen/include/xen/vpci.h        |  3 +-
>  10 files changed, 78 insertions(+), 47 deletions(-)
> 
> diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
> index 2e1d3057c9d8..d018fb5eef21 100644
> --- a/tools/tests/vpci/emul.h
> +++ b/tools/tests/vpci/emul.h
> @@ -44,6 +44,7 @@ struct domain {
>  };
>  
>  struct pci_dev {
> +    bool vpci_lock;
>      struct vpci *vpci;
>  };
>  
> @@ -53,10 +54,8 @@ struct vcpu
>  };
>  
>  extern const struct vcpu *current;
> -extern const struct pci_dev test_pdev;
> +extern struct pci_dev test_pdev;
>  
> -typedef bool spinlock_t;
> -#define spin_lock_init(l) (*(l) = false)
>  #define spin_lock(l) (*(l) = true)
>  #define spin_unlock(l) (*(l) = false)
>  
> diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
> index b9a0a6006bb9..26c95b08b6b1 100644
> --- a/tools/tests/vpci/main.c
> +++ b/tools/tests/vpci/main.c
> @@ -23,7 +23,8 @@ static struct vpci vpci;
>  
>  const static struct domain d;
>  
> -const struct pci_dev test_pdev = {
> +struct pci_dev test_pdev = {
> +    .vpci_lock = false,

Nit: vpci_lock will already be initialized to false by default, so
this is redundant.

>      .vpci = &vpci,
>  };
>  
> @@ -158,7 +159,6 @@ main(int argc, char **argv)
>      int rc;
>  
>      INIT_LIST_HEAD(&vpci.handlers);
> -    spin_lock_init(&vpci.lock);
>  
>      VPCI_ADD_REG(vpci_read32, vpci_write32, 0, 4, r0);
>      VPCI_READ_CHECK(0, 4, r0);
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 13e2a190b439..1f7a37f78264 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -910,14 +910,14 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>          {
>              struct pci_dev *pdev = msix->pdev;
>  
> -            spin_unlock(&msix->pdev->vpci->lock);
> +            spin_unlock(&msix->pdev->vpci_lock);
>              process_pending_softirqs();
>              /* NB: we assume that pdev cannot go away for an alive domain. */
> -            if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
> +            if ( !spin_trylock(&pdev->vpci_lock) )
>                  return -EBUSY;
> -            if ( pdev->vpci->msix != msix )
> +            if ( !pdev->vpci || pdev->vpci->msix != msix )
>              {
> -                spin_unlock(&pdev->vpci->lock);
> +                spin_unlock(&pdev->vpci_lock);
>                  return -EAGAIN;
>              }
>          }
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 1fad80362f0e..af648c6a19b5 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -328,6 +328,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      *((u8*) &pdev->bus) = bus;
>      *((u8*) &pdev->devfn) = devfn;
>      pdev->domain = NULL;
> +    spin_lock_init(&pdev->vpci_lock);
>  
>      arch_pci_init_pdev(pdev);
>  
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 40ff79c33f8f..bd23c0274d48 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -142,12 +142,13 @@ bool vpci_process_pending(struct vcpu *v)
>          if ( rc == -ERESTART )
>              return true;
>  
> -        spin_lock(&v->vpci.pdev->vpci->lock);
> -        /* Disable memory decoding unconditionally on failure. */
> -        modify_decoding(v->vpci.pdev,
> -                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
> -                        !rc && v->vpci.rom_only);
> -        spin_unlock(&v->vpci.pdev->vpci->lock);
> +        spin_lock(&v->vpci.pdev->vpci_lock);
> +        if ( v->vpci.pdev->vpci )
> +            /* Disable memory decoding unconditionally on failure. */
> +            modify_decoding(v->vpci.pdev,
> +                            rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
> +                            !rc && v->vpci.rom_only);
> +        spin_unlock(&v->vpci.pdev->vpci_lock);
>  
>          rangeset_destroy(v->vpci.mem);
>          v->vpci.mem = NULL;
> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  continue;
>          }
>  
> +        spin_lock(&tmp->vpci_lock);
> +        if ( !tmp->vpci )
> +        {
> +            spin_unlock(&tmp->vpci_lock);
> +            continue;
> +        }
>          for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>          {
>              const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              rc = rangeset_remove_range(mem, start, end);
>              if ( rc )
>              {
> +                spin_unlock(&tmp->vpci_lock);
>                  printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>                         start, end, rc);
>                  rangeset_destroy(mem);
>                  return rc;
>              }
>          }
> +        spin_unlock(&tmp->vpci_lock);
>      }
>  
>      ASSERT(dev);
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 5757a7aed20f..e3ce46869dad 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -270,7 +270,7 @@ void vpci_dump_msi(void)
>      rcu_read_lock(&domlist_read_lock);
>      for_each_domain ( d )
>      {
> -        const struct pci_dev *pdev;
> +        struct pci_dev *pdev;
>  
>          if ( !has_vpci(d) )
>              continue;
> @@ -282,8 +282,13 @@ void vpci_dump_msi(void)
>              const struct vpci_msi *msi;
>              const struct vpci_msix *msix;
>  
> -            if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
> +            if ( !spin_trylock(&pdev->vpci_lock) )
>                  continue;
> +            if ( !pdev->vpci )
> +            {
> +                spin_unlock(&pdev->vpci_lock);
> +                continue;
> +            }
>  
>              msi = pdev->vpci->msi;
>              if ( msi && msi->enabled )
> @@ -323,7 +328,7 @@ void vpci_dump_msi(void)
>                  }
>              }
>  
> -            spin_unlock(&pdev->vpci->lock);
> +            spin_unlock(&pdev->vpci_lock);
>              process_pending_softirqs();
>          }
>      }
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 846f1b8d7038..5310cc3ff520 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -225,7 +225,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,

I think you also need to add locking to msix_find, otherwise it will
dereference pdev->vpci without holding the vpci_lock.

It might be a better approach to rename msix_find to msix_get and
return the vpci_msix struct with the vpci_lock taken, so we can assert
it's not going to disappear under our feet. Then you will also need to
add a msix_put function that releases the lock.

>          return X86EMUL_OKAY;
>      }
>  
> -    spin_lock(&msix->pdev->vpci->lock);
> +    spin_lock(&msix->pdev->vpci_lock);
>      entry = get_entry(msix, addr);
>      offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
>  
> @@ -254,7 +254,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
>          ASSERT_UNREACHABLE();
>          break;
>      }
> -    spin_unlock(&msix->pdev->vpci->lock);
> +    spin_unlock(&msix->pdev->vpci_lock);
>  
>      return X86EMUL_OKAY;
>  }
> @@ -297,7 +297,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>          return X86EMUL_OKAY;
>      }
>  
> -    spin_lock(&msix->pdev->vpci->lock);
> +    spin_lock(&msix->pdev->vpci_lock);
>      entry = get_entry(msix, addr);
>      offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
>  
> @@ -370,7 +370,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>          ASSERT_UNREACHABLE();
>          break;
>      }
> -    spin_unlock(&msix->pdev->vpci->lock);
> +    spin_unlock(&msix->pdev->vpci_lock);
>  
>      return X86EMUL_OKAY;
>  }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index fb0947179b79..c015a4d77540 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -35,12 +35,10 @@ extern vpci_register_init_t *const __start_vpci_array[];
>  extern vpci_register_init_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
> -void vpci_remove_device(struct pci_dev *pdev)
> +static void vpci_remove_device_locked(struct pci_dev *pdev)

Nit: since it's a static function you can drop the vpci_ prefix here.

Thanks, Roger.

