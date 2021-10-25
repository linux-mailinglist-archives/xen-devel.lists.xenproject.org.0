Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5036439AC7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 17:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215932.375371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf2Cx-000888-7Y; Mon, 25 Oct 2021 15:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215932.375371; Mon, 25 Oct 2021 15:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf2Cx-00084y-3u; Mon, 25 Oct 2021 15:48:19 +0000
Received: by outflank-mailman (input) for mailman id 215932;
 Mon, 25 Oct 2021 15:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Ub=PN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mf2Cv-00084m-Cq
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 15:48:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bd302a2-de52-48e3-b937-4fbec1a48bcf;
 Mon, 25 Oct 2021 15:48:15 +0000 (UTC)
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
X-Inumbo-ID: 8bd302a2-de52-48e3-b937-4fbec1a48bcf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635176895;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=12MJVt6yrc8x54FEBoKJKDIpPCbNWC4oL/WjWWexQtQ=;
  b=h5h9flex4YR2yBuIkoEWpvuwNr8reliMFbQFohph9/tRsq3pEbmTuwhl
   bhvFeYy01AlX1DVK1fIS13JYOqKyJ//dPlYkiSdcG/IJ4za4eoeSsw0WG
   vnWWBKeHGRvqE5vYKpP0Bma0S7EM+lYs1xQFjvGIH2XQQ29uwWxv1ibG/
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g2RhN9VJXAt9kwDt5f1nXqr7ukuh7JLIwOTaXSODPuMNK9AngMp+ve+3qr8TueBzs92RVcEy4r
 S/3lDwiFPC8bCuwnVboFyJi8lzq4nN7bP2Oe2lL0hH9BHCDekjLh7x/0fx19x9ldaB5nyl/TQn
 ertnyJ8Tdgv/ZtZVaulqyTv2nJ781qk6MCTgfU3OlxtOV9edSrG5mz0fXZCOpw+PGY2yoj57Q4
 yd5xn58D3qgEvBbqfNujzqDeFTU+0soMgYid1OqSIZY8C3t4kBwahuzLe/71VMpX+bmaW0JfIa
 cFQ2dL/dfZiNM4ZxeaOJpX2z
X-SBRS: 5.1
X-MesageID: 55999716
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8wFdQ6NzPjrm84/vrR2NkcFynXyQoLVcMsEvi/4bfWQNrUom0WBUx
 zQcW2qCPPqOYjHxfoskYIrjpkoG65GHx9MwSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Ug+w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2qPhepO6
 tpJiZW5EkQUL4jcuOEYTyANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iXtI4Jg25u7ixINd+FS
 MMTRRN/UEzNXwVhYFc7FLA5sc790xETdBUH8QnI9MLb+VP7zgZ8zbzsO9r9YcGRSINemUPwj
 kvc42n8NTQLO9WexCSt/2qlg6nEmiaTcIgfDqGi//hmxlia3HUOCQY+XEG+5/K+jyaWXNZSK
 Fcd/CY0mqE0+Fa2Vdn2XxC+o3msswYVXpxbFOhSwBuEyrfQpR2YAGcEZjdbbZots8pebSIt0
 liFjtb4HwtlubeeSW+e3rqMpDb0Mi8QRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ihCE4i69J1ZZT/6q+9FHDxTmro/DhTBMx5wjRdnKo6EV+foHNT4us5FvA5PBMNrGFX0KBt
 3gJncuZxO0WBJTLnyuIKM0WB62g7fuBNDzagHZsEoMn+jDr/GSsFb28+xkneh0vaJxdP2a0P
 gmD4mu9+aO/IlP1a7VNXKC+D/gjxPOjKMXARtDRa8Z3N80ZmBC8wAliYkuZ3mbImUcqkL0iN
 ZrzTftAHUr2Gow8k2LoH7Z1PasDg3lknzuKFM+TIwGPiOLGPBaopaE53ExihwzTxJiPpxnJ6
 J5hPs+OxgQ3vAbWM3SPr9B7wbznKxEG6XHKRy5/K7brzulOQjhJ5xrtLVQJINQNokitvr2Ul
 kxRo2cBoLYFuVXJKB+RdldoY671UJB0oBoTZHJ3YA/wgyJyOd71vM/zkqfbm5F9pISPKtYvF
 5E4lzioWKwTGlwrBRxENfERU7COhDz03FnTbkJJkRA0foJ6RhyhxzMXVlCHycX6NQLu7ZFWi
 +T5jmvzGMNfLyw/XJe+QK/+lDuZ4ClC8N+eqmOVe7G/jm23q9M0Q8Ew59dqS/wxxeLrn2rKi
 V3OWkxG9IEgYeYdqbH0uExNlK/we8NWFUtGBWjLq7GwMCjR5G24xoFcFu2PeFjguKncos1Ov
 M1ZkKPxNuMphlFPv9YuGrpn1/tmtdDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/fqMNHPbipOd/+FAJDLgQSceneh+ofnSPf7KppLRyitjN35reOTW5bIwKI1H5GNLJwPY58m
 bUhtcca5haRkB0vNtra3ClY+37Vdi4LUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ3fOQia5dy0zOd2sIOULMhecN144TvB1qzUMZIwjbkNTymfJqjgZa9i46T1oJw0wfgf5zI
 GViK2Z8Ob6Ko2VznMFGUm2hR1NBCRme9hCjwlcFjjSEHUyhV2iLJ2whI+edukse9jsELDRc+
 biZzkfjUCrrI56tjndjBxY9pqyxV8F1+y3DhNujTpaMEJQNaDb4hrOjODgToBz9DMJt3EDKq
 IGGJgqrhXEX4cLIn5AGNg==
IronPort-HdrOrdr: A9a23:B1RJqamwNzk5MiU3qWOKWL7gjKnpDfPIimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8vgZQpENRGtldBm9Ce3mm+yZNNW977PQCZf
 6hDp0tnUvdRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA8ciYhV9MIOA4we7rGNoXze2O/DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,181,1631592000"; 
   d="scan'208";a="55999716"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr49AvhJvE3q2GxVZHvwKL2HDkoEblkMUFLDinPFJoS3oKhKyYX51uKLUbbRMCEPG16FX93pe6o6gzWMq5pwNn+xaltBe34KWfPaYsG89ZE35S4qJMf3R1mCsEhaz15ng2eSR35GBbhfIPuB0qERnoOZ6IKAZ1Q/E1M+l5Gjq2W2KNplgMDXmkPDUkI+WZ9vfIbZcIDxdEGZXLjh5P5jtXHRAWX4a4epuRGb5Dyl5WEO2llCcw0vh+0B88YHBkOgH9a5it+iaaFYJWKQAnJWv8jZZKckXs14XRE/JOeadesddUMLxL8q1m6PY+pkA/CAvvus9JlCFdX0sOZ9uiiwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dh1i9o1bNKJfQ0T4SfKY4z2f9l77ooKn2b2EAtp4JW0=;
 b=mBHSwl0uy4qtcoBYbBiB6esz5Fv4aff/BfGv37unHfB5FLpoiFc0VkqMM1Ka9IIv7Q3sNE7UoQAG2u6ZN0tMKXxJoZDet7NN/wKKbYs79bvRtrUn43NrBSD/sF889ZTrVPuz0o6mMSuZlTY2b8Sve9wupbSudBzOs0D7FbWW6Tr5jngSYzExoMnJvGDaMfH4nSFganKkvufOn4kn79f6OHxJggp/9a9SHKIaBHlI6gU3ATPDnol+oWYPkW3RxCvyUryj9EXZqbd4MiLdpxltIpLZYFlma5MUg9qa2LRjr6Ho6l4wL+7StVmxVZ16sBlyygb4tPG3nLwm2/fdGLo5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dh1i9o1bNKJfQ0T4SfKY4z2f9l77ooKn2b2EAtp4JW0=;
 b=FVWqrLZYy0sM4qqGlV+zc/AOAF9Aw1e+HbFHk7FlXrAurT+MMd+QMI5lp3JIJSo4QH7LyEPSmiKA2NtUzc5hfcgkLrkoQ29Jj9rgbhgKLTmS7VQNRRQwYuDRVTiGilqYdci+P6dpUDumSkcosQefLjgu2dSl9pw86sHi3GFQ0f8=
Date: Mon, 25 Oct 2021 17:48:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
Message-ID: <YXbRsbzLxZs94v0Z@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-5-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-5-andr2000@gmail.com>
X-ClientProxiedBy: PR3P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ab46bf-df97-4367-ca1d-08d997ced680
X-MS-TrafficTypeDiagnostic: DM5PR03MB3291:
X-Microsoft-Antispam-PRVS: <DM5PR03MB32917016E564B11A55DD2FE98F839@DM5PR03MB3291.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89MTW79B8+wn6svHPLceAB1u128Pcjqbgh2L64Hm1jwsXW8uTCuRPN8h0+chs3UfPHedPPN27vf5WNb3gVW4Kcmu7EryQ0vty1YHfCTgpK5dpX+7gQr33ScVQTTtm/Pm6ghR4hxX5d+4NoWs8QhJ81d7oVCuqT2s7ogQR0n+eu180tycMohitJuCc48K770uTBsU58cKdaQET70TD5WIDO734xfdIwCmC5tIeuVFOX3DtsFR3CAoXBr8n6n7I7s1UeVxn2q2ZjsnkOA7ZUfunTkwyYC012kVk+kao2YKRV+Ly7X79x+6vXfgnuGBk9iufMGY9Oa0ssVdAUYTHwSLGjG+EJlp3cgxI6O4bcjyeVHm9O7RzNfonalwUayBwQbT3hivKQ5Q1oeCJsDQQli+9Dmg3/qjfXnympauFFOAykKg1DzC+Chp0KzFBdUEsefe8HeK7VwYX2Z7Qyuv8OZB1+DCbg+IV+OLYaHI/jp1MvLp34fOd/8/KRM9oVM5+wiydKQiqhkX7Z0qdQQMfH/B2a3RE5rKyj/Kzs7ny4H9+HDkLxkvfwjiZOEv1DZhljV6l+/R2LMaKjYiH5CJ1v69f3IE0xc7GwBRB+cWGn07TcAHJsCzajKXEXKUqFrUlrMCW3ueQRvD7rs4Ag4dpXf+wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6916009)(956004)(186003)(82960400001)(6486002)(8676002)(26005)(38100700002)(85182001)(8936002)(5660300002)(2906002)(86362001)(7416002)(66556008)(316002)(66946007)(4326008)(66476007)(6496006)(6666004)(508600001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1lUeC81Q2U5YVd5OFJLSGRnVnVaUFQwQmZIS09QY3JrcXl2SDIzQVczT3Yy?=
 =?utf-8?B?VkVLR3hwNVRXMUxvSEZzTHBScVhZZUlaWHpQckU4ZUZjVHdSekRCc3hKQ1Fx?=
 =?utf-8?B?bzhvcFNRR1YxbHNpS0tpbnU5aFhJU0pLZzdQeFBBbVZ6Q3V3NUpVWENMZDl6?=
 =?utf-8?B?cHdSNkErYjV3M0U4dm85aXQ1dFJsSFdRNGFDa2tiWENFSWVPaE56eFV3alJI?=
 =?utf-8?B?VDlHOFp4WlJqYm9tblUvSElBQTIrZ1N4R1Zra0xSVGtRSXU1Mng0OEVHQ0JQ?=
 =?utf-8?B?ZitVa2NJb25YU2FPdU9ZeDJ6c2tLOFBLWERaSng2RTlmcTJrYjFndVlFRjA5?=
 =?utf-8?B?d0krQ2ovbGhOZURFYllBUE0zdDI4am0wWnNRSEhzU0w2azBnK0llVkYvc3ND?=
 =?utf-8?B?K2phSFNpUnlLbi9MWThuaU9SMEI0bE5uWXRYQjZ3WnRZdERrK0tac3gvUjBl?=
 =?utf-8?B?c1VrcEVnNlc3TWlnbEdBcVNsVzJ3SklmVTNzdDZhbytQdkc1bnN6azlNcWtL?=
 =?utf-8?B?eDg1YVpyZG5yYnFRL1p3eWcvTXF2RnlaNnBDMEJwUFZTZ0NUS2xsdmI1RFov?=
 =?utf-8?B?UytyYXBQcjZDa0R3aEdBeU81eFM4RmdTd2VaQzRWNnRnTFFMQWRDMW9pNHRr?=
 =?utf-8?B?U2grMnU5SEh4R2xaZmRmSm1rck52elBRY1FneEJYTCtoakRYY1BvR2xoejRT?=
 =?utf-8?B?MituM2JPakpya1htclpVb1ZDL1RxK3BTMnNhMStXYmE4aW1DVGt5TW1NNWZx?=
 =?utf-8?B?RVpkVnoyd0d4ZURTTTBMdXpkUjZDamNPS0czQkZwVXJFMVV4ZVJtUVZXZnA5?=
 =?utf-8?B?dk5PK1luUTJIa2tvckxXdXo3ZlE0ZWtuWVlFWFE4RjRlRTE3OU9WNEdodXZ5?=
 =?utf-8?B?RHV6azFoTjNJSStRQ2ZEMnE2SU03MW03akc3blB1ckNyNkkvWEY3NHBITCtU?=
 =?utf-8?B?elZYY1BkOVB2QUdsSmtueWNoWTJiYzFpYjhKL04yOGtXRFZlRzdoWlYwMThF?=
 =?utf-8?B?VG5aU2prYTA2QnhUeEFxTUNuUmEyanRLWCtLN255V3VmRExiaHV0SVpiL3lK?=
 =?utf-8?B?Q0hQV1N0ZnVlM25hbHRxUWhWTXp6dnJhL1BCQm9HZWMxaXNiSFRqQ1kyc0Yr?=
 =?utf-8?B?S2FYb3NEcUcwKzNBRndiZHE0RlM2NnNIYmZ5YjF3M1hsWFlBdlVyMUc0U3V1?=
 =?utf-8?B?dUhnNFI2SVdQTktqTit4MkVoMU1GSXhwMGhWZHRDZVVoczBQMTFBOVN1eGZx?=
 =?utf-8?B?Tmo1WlMzdHJxVSt0dFlacEZhWU1KUDU2ZFpoYVViNVI1Uk1wTG1RejJJa0hq?=
 =?utf-8?B?cVRUNjhvczh3WHduVWNjZDZKeDVzaEVabmsyemMvZjAzejRseVQxNUZZZndk?=
 =?utf-8?B?Mk5JdU53RU9vWnkwb2R5SVZxR0dpdDF2SmV0Ukp4ZFJOSTQweEVNSHNMTG5r?=
 =?utf-8?B?dmJHK0lrZDF5bU1ZWjl1enIrMzBSQkdCZitqdjlVWGVTR0t1NDZOaWFPWE5B?=
 =?utf-8?B?eDBYc0pKTy9QdnhiVkF6bXZyK3NHb2JqMDdoOXVaZWNqbGZ2Ly8ydmZjRTRH?=
 =?utf-8?B?ZmY4NkFnbklPQXZLaWxaWktZN0ZCQWdINHJrTVRrM0Z1Vm5BUFdXVXE1WTR3?=
 =?utf-8?B?UCsrTXgrV1dVeWtmVHlNVHYzZTBOQ1NMbHpBQnVtZzQva0dReDhoMVRPRURt?=
 =?utf-8?B?ZnRWY1JBY3FKQTVBZ1MxOFhFZzZsZXk5ZHJmOGZhRk5Cd1NqMThUUS8rQkJs?=
 =?utf-8?B?WXJ2cHFuMEx1Wkt4bVpEWngwdXY1bW1zUWF5aElsd1RjTTIrWDVZbHRST3VJ?=
 =?utf-8?B?YWI4MlVNWFZoRm5veFdrdG1hYWtsUFRQWU5xcHVUUUFNSmdwNEphRXBqMm0r?=
 =?utf-8?B?YURMejhNUzJ3dWFCRkVrbEFwdEdLRXE1U21hRDJZN1NQdGhFeFl5MHVxM0VH?=
 =?utf-8?B?OFRhQWszcGtETER5MVRsTGw0VmlsS2ZWcGNQdHAvd1dWQ0d1WDIrVEVDOFZo?=
 =?utf-8?B?RjM4M1ZDZkljME1PMU02RlMvVWI1SFRlUHk0SXg4Sk9TeTV2OEpTWmpiSndh?=
 =?utf-8?B?dWxyZXRsTnlpbDZHQXMrR21kaUFyUFNMZTIrTzJONlVPSjM4bXRhR01Pc1N4?=
 =?utf-8?B?Z1N0d1JEakJHNmFaWm05V3kxbUNYazNpNHRpZ2VNb2dGSFB2ckh2QUlSWFBI?=
 =?utf-8?Q?TAAs4zxV1ctsRaCTY3EXHgw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ab46bf-df97-4367-ca1d-08d997ced680
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 15:48:07.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBZ6QUcOm9a5uoFRT0RYwTNYoeBOHdP+6chrtrPP0DtDUAkBXh+ZHCvEZ9kG6yYGe3cTnZbz+D9Qjm/ZgBOs2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3291
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:16AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
> 
> Use stubs for guest domains for now.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v2:
> - remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
>   has been eliminated from being built on x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - simplify some code3. simplify
>  - use gdprintk + error code instead of gprintk
>  - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
>    so these do not get compiled for x86
>  - removed unneeded is_system_domain check
> ---
>  xen/drivers/vpci/header.c | 72 ++++++++++++++++++++++++++++++++++-----
>  xen/drivers/vpci/vpci.c   |  4 +--
>  xen/include/xen/vpci.h    |  8 +++++
>  3 files changed, 74 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 3d571356397a..1ce98795fcca 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -397,6 +397,17 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +}
> +
> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    return 0xffffffff;
> +}
> +
>  static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>                        uint32_t val, void *data)
>  {
> @@ -445,14 +456,25 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> -static int add_bar_handlers(const struct pci_dev *pdev)
> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +}
> +
> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    return 0xffffffff;
> +}

FWIW, I would also be fine with introducing the code for those
handlers at the same time.

> +
> +static int add_bar_handlers(const struct pci_dev *pdev, bool is_hwdom)

I would rather use is_hardware_domain(pdev->domain) than passing a
boolean here, no need to duplicate data which is already available
from the pdev.

>  {
>      unsigned int i;
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
>  
> -    /* Setup a handler for the command register. */
> +    /* Setup a handler for the command register: same for hwdom and guests. */
>      rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
>                             2, header);
>      if ( rc )
> @@ -475,8 +497,13 @@ static int add_bar_handlers(const struct pci_dev *pdev)
>                  rom_reg = PCI_ROM_ADDRESS;
>              else
>                  rom_reg = PCI_ROM_ADDRESS1;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
> -                                   rom_reg, 4, &bars[i]);
> +            if ( is_hwdom )
> +                rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
> +                                       rom_reg, 4, &bars[i]);
> +            else
> +                rc = vpci_add_register(pdev->vpci,
> +                                       guest_rom_read, guest_rom_write,
> +                                       rom_reg, 4, &bars[i]);

I think you could use:

else if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
    rc = vpci_add_register(...
else
    ASSERT_UNREACHABLE();

And then guard the guest_ handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT.

>              if ( rc )
>                  return rc;
>          }
> @@ -485,8 +512,13 @@ static int add_bar_handlers(const struct pci_dev *pdev)
>              uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
>  
>              /* This is either VPCI_BAR_MEM32 or VPCI_BAR_MEM64_{LO|HI}. */
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            if ( is_hwdom )
> +                rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write,
> +                                       reg, 4, &bars[i]);
> +            else
> +                rc = vpci_add_register(pdev->vpci,
> +                                       guest_bar_read, guest_bar_write,
> +                                       reg, 4, &bars[i]);
>              if ( rc )
>                  return rc;
>          }
> @@ -520,7 +552,7 @@ static int init_bars(struct pci_dev *pdev)
>      }
>  
>      if ( pdev->ignore_bars )
> -        return add_bar_handlers(pdev);
> +        return add_bar_handlers(pdev, true);
>  
>      /* Disable memory decoding before sizing. */
>      cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> @@ -582,7 +614,7 @@ static int init_bars(struct pci_dev *pdev)
>                                PCI_ROM_ADDRESS_ENABLE;
>      }
>  
> -    rc = add_bar_handlers(pdev);
> +    rc = add_bar_handlers(pdev, true);
>      if ( rc )
>      {
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -593,6 +625,30 @@ static int init_bars(struct pci_dev *pdev)
>  }
>  REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +int vpci_bar_add_handlers(const struct domain *d, const struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    /* Remove previously added registers. */
> +    vpci_remove_device_registers(pdev);

Shouldn't this be done by vpci_assign_device as a preparation for
assigning the device?

> +
> +    rc = add_bar_handlers(pdev, is_hardware_domain(d));

Also this model seems to assume that vPCI will require the hardware
domain to have owned the device before it being assigned to a guest,
but for example when using a PV dom0 that won't be the case, and hence
we would need the vPCI fields to be filled when assigning to a guest.

Hence I wonder whether we shouldn't do a full re-initialization when
assigning to a guest instead of this partial one.

> +    if ( rc )
> +        gdprintk(XENLOG_ERR,
> +                 "%pp: failed to add BAR handlers for dom%pd: %d\n",
> +                 &pdev->sbdf, d, rc);
> +    return rc;
> +}
> +
> +int vpci_bar_remove_handlers(const struct domain *d, const struct pci_dev *pdev)
> +{
> +    /* Remove previously added registers. */
> +    vpci_remove_device_registers(pdev);
> +    return 0;
> +}
> +#endif
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 0fe86cb30d23..702f7b5d5dda 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -95,7 +95,7 @@ int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
>      if ( is_system_domain(d) || !has_vpci(d) )
>          return 0;
>  
> -    return 0;
> +    return vpci_bar_add_handlers(d, dev);
>  }
>  
>  /* Notify vPCI that device is de-assigned from guest. */
> @@ -105,7 +105,7 @@ int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
>      if ( is_system_domain(d) || !has_vpci(d) )
>          return 0;
>  
> -    return 0;
> +    return vpci_bar_remove_handlers(d, dev);

I think it would be better to use something similar to
REGISTER_VPCI_INIT here, otherwise this will need to be modified every
time a new capability is handled by Xen.

Maybe we could reuse or expand REGISTER_VPCI_INIT adding another field
to be used for guest initialization?

>  }
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index ecc08f2c0f65..fd822c903af5 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -57,6 +57,14 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
>   */
>  bool __must_check vpci_process_pending(struct vcpu *v);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/* Add/remove BAR handlers for a domain. */
> +int vpci_bar_add_handlers(const struct domain *d,
> +                          const struct pci_dev *pdev);
> +int vpci_bar_remove_handlers(const struct domain *d,
> +                             const struct pci_dev *pdev);
> +#endif

This would then go away if we implement a mechanism similar to
REGISTER_VPCI_INIT.

Thanks, Roger.

