Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C5C4AD4DB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267843.461601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMoq-0005Ft-Eh; Tue, 08 Feb 2022 09:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267843.461601; Tue, 08 Feb 2022 09:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMoq-0005Do-BS; Tue, 08 Feb 2022 09:29:52 +0000
Received: by outflank-mailman (input) for mailman id 267843;
 Tue, 08 Feb 2022 09:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHMoo-0005Di-Ph
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:29:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8847e40-88c1-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:29:49 +0100 (CET)
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
X-Inumbo-ID: a8847e40-88c1-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644312589;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4jFbx/RHhWlzxgz2kb/wwup8BCw/fbQLYggpgjuPGUQ=;
  b=IFBkEhv3CpexgCAVBXdCMK7/S9MRFpZhbVuwh5x/O8UTpCI54hM8N2ci
   y9m1QN3TFj/bFl/ZJJ11OESCnDtxVBoUY7jYzpE8Za8D69wH8IggbnIYn
   8KZ1DTcoCEwVqNtnEGwdeuK3KBbWJvKka4N3SakXJglFa/ARJYUiRkbnQ
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ka7va5Z7RricQ7rok5L/fp/uHhwQkaPkQPZRRoV5b5jG5u54bFE8Cvs6ty7Hab2kRj6tQfDxkr
 O0tD4T27qGw5JONdk2iU1oq/XUOMpXVWDwwnbcb0OmVD/hFEyWryCNZUftpwRW6T3YnUQ47eEW
 N2RMjPinsSsrBkxtnflANE9ox4jfDDEML42Tyd5yCNM7SalicYfCXrfP/tmBc5R7zhXa8Gnut1
 zkUtMWS7Dj/bJONfHKQmcIQmyTYpntNlERb9j3t6qcD2xsj9Pcq89WbMt+TmieiHs+mxMBh/fX
 vsa0sjcNRtMudXWLjtfyhH0k
X-SBRS: 5.1
X-MesageID: 64120967
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MkfzsKhOzCTcoyvrGVR1XK/fX161QBYKZh0ujC45NGQN5FlHY01je
 htvWDrXbv6IYDehe91ya4W28B9S7ZHUxoRhQVFkqSFhHi4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQw0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1imKOoEjg7NZGcs+kWDhB+DzF4Ar9/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u2pkURaeAO
 KL1bxJFdhnJY0doAG5HL64nhtjzwVnecjZx/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru1n7lDxQtEc2QwDuI7FqhnubK2yj8Xeo6HrCi6uRjhlHVw2UJEQAXTnOyu/z/gUm7M/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwBuEyrfQpR2YAGcEZjdbbZots8pebQIt0
 liFjtb4HwtFubeeSW+e3rqMpDb0Mi8QRUclYSIHVgID78PUiYc/lA/UTt1jHai2ifX4ATj1h
 TuNqUAWhb8ekMoK3KWT5k3cjnSnoZ2hZgwo4gTaWEq14wU/Y5SqD6SP7VXY9v9GIJyuckiav
 HMEls6d68gDFZiI0ieKRY0lB6q17vyINDndh19HHJQ78TmpvXm5cuhtDCpWfRkzdJxeIHmwP
 RGV6Vg5CIJv0GWCQoJIe9mOGc8WnYPtHonscOzEaOVcW80kHOOYxx1GaUmV1mHrtUEjl6AjJ
 JuWGfqR4WYm5bdPl2TvGbpEuVM/7mVnnD6IG8inp/iy+efGPBaopaE53ExihwzTxIeNu03r/
 tlWLKNmID0PAbSlMkE7HWP+RG3mzETX57ir8aS7lcbZe2KK/V3N7NeLkNscl3RNxfg9qwsx1
 ijVtrVk4FT+n2bbDg6Bd2pubrjiNb4m8y5nZH11ZAj5gSF4CWpK0Ev4X8FmFYTLCcQ5laIkJ
 xX7U5no7gtzpsTvpG1GMMiVQH1KfxW3nwOeVxdJkxBkF6OMszfho4e+FiO2rXFmJnPu6aMW/
 u3xviuGEMFrb1kzU67+Nqn1p3vv5id1pQ6HdxaRSjWlUB63q9YCxu2YpqJfHvzg3j2ZnmTDj
 FvNUU5DzQQPyqdsmOT0aWm/h97BO8N1H1ZAHnmd6rCzNCLA+XGkz5MGW+GNFQ0xnkutkEl7T
 ekKnfz6LtMdm1NG79h1H7pxlPps7Nrzvb5KiA9jGSyTPVisD7phJFiA3NVO6fIRluMI51PuV
 xLd4MReNJWIJNjhTAwbKj06Y7nRzvoTgDTTs6g4eR2o+C9t8bObekxOJB3Q2jdFJb54Pdp9k
 +csscIb8SKljR8uPorUhyxY7T3UfHcBT78mptcRB4qy0lgnzVRLYJr9DC7q4c7QN4UQYxdye
 jLN3fjMnbVRwEbGYkEfL3mV0LoPn4kKtTBL0EQGewaDlO3ai6JlxxZW6zk2EFhYl00Vz+JpN
 2F3HERpPqHSrSxwjc1OUm3wSQFMABqVph74x1cTzTCLSkCpUirGLXEnOPbL90ccqjoOcj9e9
 bCe6WDkTTe1I52hgnpsARZo+675UNh81gzeg8T2Tc2KEq4zbSfhnqLzN3EDrAHqAJ9piUDKz
 QWwED2ctUEv2fYsnpAG
IronPort-HdrOrdr: A9a23:N8cTYaHmlo/l6rT2pLqEMMeALOsnbusQ8zAXPhhKOHlomszxra
 +TdYcgpHvJYVcqKQodcL+7Scq9qB/nmKKdgrNhR4tKPjOW2ldARbsKheCJ/9SKIUPDH5tmtZ
 uIBJIeNDSfNzRHZI3BkW6F+p4bsb+62bHtj+LX1W1sQgFhY7xh6QARMHfjLqRZfng/OaYE
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="64120967"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8IU2EC9GLickhKyrTYOQFHbZEoDrgTKngEfAaR3MmBCB5sBw11KyM+CHOWdGmGxe6aMKjqcRwceLXEUXv9tHEUm7jrIUKpyX35oUMnl7mqleMCOYYvCJnnSm/WUCf6QjHOH1NaQaERYNZwk0PDd0CtAqWkd7VLy+HucuSFm480BqB75z+gGSzyGFBYVkBx5QE/76Zck4P7pk9sODgpRFHatVsErsnxr4lXcE23DnYrry9Iv9ygIQFlF+dBd1gVfbwedyMc57RZLNMtN5aMjYytQXzbB/4hdV5snfbu4WFIDuC7u9NLRNrtXYkyHhk9LjYADZyFTaD/YAB0NAKqrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPHEHagKqtJ19nwbHuNeVG1QMZljMg6SFdCo8Bt4izU=;
 b=HvxbjjVisHhKbHaCuWe2P6CzwQRSM65bDpehDAMXQMl/Yv6j1XoM9hU0WMhAi8xglWnIEg6OFmoj0+aiVcYwzcQNCVDiz5PwHlr1tUpICCoGjI8Xj39UGySTUdGsQH7mMfvHuccLvQOEDpt/dx/fOs/7Atfgec4wAfg5pL2BQwtT0u5L0bZdUuBn0oyJdJ3sHajeMaUp5AtJuBY5IgM6wP0zPjvncrxI0VHZtCa+yRREbatp8ZANdyrmL5YSvDE8AoqnK+pMWvtPXFTATfGgwTVWpMGZxgk06V+2iRUb4hp9wQowIKs4LriyjrpRTtP8aCuyM36YRSyQ+6BkEf1zPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPHEHagKqtJ19nwbHuNeVG1QMZljMg6SFdCo8Bt4izU=;
 b=hhaKHriVtfy9HrR3hSAXsJ9kyEqDit3GPxD5yWl8KWrsF+BAXZjP8KlGsP9nS5bcsOTDG5ChFoa8K1S45IZnor45YWQPjwgEA2gcU19bTD6pJ+esyJhwj5Q+x7bH9hERGKFmpU60bdFIx7QQj010uBo9wOlm1EQvAJursEJeYyk=
Date: Tue, 8 Feb 2022 10:29:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Message-ID: <YgI4AWgVc/zN4THm@Air-de-Roger>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com>
 <61d85343-9a37-6409-449d-a662ae5258c5@suse.com>
 <66992013-f438-246b-451d-d96f6eea22c0@epam.com>
 <1bc9c545-5af7-8665-4830-e8aa3836101b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1bc9c545-5af7-8665-4830-e8aa3836101b@suse.com>
X-ClientProxiedBy: MR2P264CA0126.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1399548c-92df-47c4-cd0f-08d9eae589e4
X-MS-TrafficTypeDiagnostic: DM5PR03MB3387:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB3387519CFD58C7420A0124F28F2D9@DM5PR03MB3387.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46aH7D/UI4/ILAYyHCWjluI14cUt00S/Jf7Q4i5SSfGTYk15slP31KeyyfkwsgTrHeTZdOIj+iVGiccqMPWqJat/ZuwYI6Mp6tffzuXtwIKB/d89pniBSfgqakKh5E931Ub2YSYwRUlFjcwwt5kYjCMQ4UO7hSHL1acFZX2gnUE4miAYzMAGlj/H6m5DeOGfvc9jYyvmOTtdB0n+v69a5V2S9oT90eu9wfBm66RGEWzLOyHekizu0xfg3xRWkYYLTIccuLxY6ry7+8iHPwyZ34w3dLgNpnO5OVaEMV5fIw4gg8r2D4T5bwvGSZZMWCuh0Z8aECQu/wt+WjY6qRi7WhvqPYxOcnlsAp2oKwHgCFWf2asLJy38PJNKH2k+3hOU/q9xAe4vW7uVftxdcEfsKHHolNA07OsnHZR/1JddGrHUiueShl9UuvvQ/1n38qzRBOcmsVenG8Rj/09pLaUq9E3lxhQgblVNRa1QY3Fxd/FnejjiIOhrYCUL8fizSFn4hMoNYMRC1D/EPrXQkvuLmu2N73DCHoLXwVgrxnrjQFSUyLiL2s8TuFOA61BG3xXopOrndAteiIkJJRQyKduhkGnw2IcWBeTBjzc1d9iLdgQ5S6EgllrL4Xof2xo+0bsdR1Jbww5NuLyz1yn42ri1xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(186003)(54906003)(26005)(6486002)(83380400001)(6916009)(316002)(7416002)(66476007)(66556008)(86362001)(33716001)(85182001)(4326008)(8676002)(8936002)(66946007)(82960400001)(2906002)(5660300002)(53546011)(6506007)(6512007)(6666004)(9686003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3hicCtMZHhIMlRpanIyMU5IcDVmOW41Q1lnb0orOXlQcW1USThNcXFFL2k0?=
 =?utf-8?B?QVpBU0xuSW4xS3hHQVlycVJMQ3YvbFRQWU9Pa3gySXZ0SHJYeHg0dklSc1ZW?=
 =?utf-8?B?cnpWb0tpcUtGZkF4RExVNUJkekZ3Ung0SWMwKzVLM1JGM3dXWTRTZnlBQUxI?=
 =?utf-8?B?d0UyMVRWQ0NxR2pEelN6YjJqTHdlRmhNN09aY1VCS1dtR3pFbDhzK0tsMXVw?=
 =?utf-8?B?N2VqcVMyVjMzakdjeDNqUFEyb3RLaEJQYytQdm5pazcxZnlpcUhQRTE0QVJP?=
 =?utf-8?B?SGk0a0pFTVMycUlwd0NzZm8wN0lBOGVNdkwyWE9SR0lLNm5zVVN3cHI0ZmE0?=
 =?utf-8?B?aFpqN3lWTkhCeGJ1STVhSVJybWNRaFBJMHlyUlZTWUlmUjUwb1cvbG1LZ1lY?=
 =?utf-8?B?REpFMlpBZjRPZmk4YW9jR201azVDVHhMRjFFRHBaVXBLZXU3cDlJUDFqbEVZ?=
 =?utf-8?B?RWtwTWkyQ3QrNXRUWTdZTzh5S0lreTBHWFVBbFlLcENDaHZuZmJVYjJoSjR4?=
 =?utf-8?B?OWVreFRZYU5Jc0hiQlk4T2VqeEFNbVRzcjBzdjhFSURjSnl1Z2hpcm5vYzZm?=
 =?utf-8?B?a05CS1JDQi8vWENiSjJaNFNUWWRKbWRlMUNnWkF6RkZwYXNPOHR1WmV6cUdV?=
 =?utf-8?B?ZHNzNEVpa1VkeGtLZGJTbnFYM1ZTZVpuelR5aGc5SjAzL2Q3OEFEclZ5Y3Z2?=
 =?utf-8?B?N0VRU3J3WkxEdlV1R2RPQXN3Z0xPU0lIdmY0cmR1L1N1TmpXUE0vL2RmckNS?=
 =?utf-8?B?bmlhVDhCMXh1bHludE1ZSHphbnpCc2VtOEZRUG9aa3MzWTdYYUNJR2hFRUxt?=
 =?utf-8?B?d2hoNktkN1pFcUJpSStnREFGdnNCVlNKZjFZVThxTzEvZzE1aVk3QlNkclZp?=
 =?utf-8?B?VlpZN09NUENFT05sMkgxTUNOU0F0OGUvYUIveU4xQUJNdzU0b2pVWVBCZGhm?=
 =?utf-8?B?UEVhQVpuaXhwdUVYVDhFYnRjZzRNby9KaCtYekRuaC9tYVVHb3VWV0VmbWRj?=
 =?utf-8?B?dUpib2ZiNWtBeS9Vb0x2N245ZEJEZWZSTjNyaTUxMWVSY3NDWWFsSkZXUUts?=
 =?utf-8?B?bXo4QUtmL2QzUUkrdGpRd3F4ai8vaFcxNXJVYi8reTl6Z3FjK3E2OFJ5SDV3?=
 =?utf-8?B?bTF4YUxFRXpLQit6TGpXYmZPRGJRRFNNS2Y5UzZjWFdIMXU4L2dBdlQ0YTlp?=
 =?utf-8?B?SFN1d0IxdnNYdnpubTVLMGUxR3QxUUNsVnNIa2U0aXlQNG9RMlNjQU1OUysw?=
 =?utf-8?B?QlpyZU0vYVRZTEtod3UrQ0pET2tDbU5jSlRqY3IrbGxUMjlmRk1iRVUwNkhy?=
 =?utf-8?B?VE40ZmdnL3JhV2I4OFNMb2ZLTy9wS1pweGUvaVA0bkhvTmJTQi94WkhONWRw?=
 =?utf-8?B?ZFQ3aFZvaDRpbFQ5R0lpWHg4NzR2TjdBYnhZY2wvK2g1UlFWM1Jvamx2cXlm?=
 =?utf-8?B?S0xUYUZSR1JxNDZ2a0tKU3ZQaUZ5eDVGSFRlQkpjK3RSWXRkdG12amVleEd5?=
 =?utf-8?B?anBrSXFYMkVVRXE4Zy9TK0R3WGZBS3gyRGxlckl5SGJQS3NYbFA0ZVVDUVh1?=
 =?utf-8?B?cjB0T2tFUmc0VkhSbEpBZXBoSVRVQ0tzQmtxcHdWUWhkL01zQ24vRWZ6c0k0?=
 =?utf-8?B?U2JYcXVWYjhnOCtRaUdJV3p5MWl6ZHRQWExudFpaamFUWWV0S29TUzI2ZlBm?=
 =?utf-8?B?VTVhRUhsemx4c2YvWHJDcjlhanBPckczeFB0TWtZVkkra280YnpHL1REQk1S?=
 =?utf-8?B?RjV5THpTSFNGZml3NFpmSk5UcnptTEJzUmpGemNBUlhpeFd6Z0FpZjdId2Zs?=
 =?utf-8?B?VXRmaExBaHN5RkpXcWRhbkc3YmpMR3k5b3dHai9jSFc1YjllWVR1R2E2MTV3?=
 =?utf-8?B?MVhEaXFTSmZ4L1NHMlBaam1CSGR0ajFFaitpRUlGcDVKSUFVR1BkY1lqLzhI?=
 =?utf-8?B?Z1l1d1E3a1VzaWVSdDlYUlhneURZRmFIdTdrbDNVSFF4dlRGY2E3M3lxUHR3?=
 =?utf-8?B?UmNobkthT1c2MENIWWpaQi8wM0NSQ002UFZwVVVrSkdrbmJDMFZ5RTJUSzZi?=
 =?utf-8?B?Sk81SlNuSjJKK3VHV3RpSGFuQUw4bWxnOGFlTll6WHhLMmFQL01uSk8rRXFw?=
 =?utf-8?B?SGNEMFRGUnBHVjJlM1RaNE9aSUxEc05hM0h0akdMR2NXbFFRUE9seDdTbkxQ?=
 =?utf-8?Q?QS5qojYbM/pMfhk0dqRnUcw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1399548c-92df-47c4-cd0f-08d9eae589e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:29:43.2300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhIybPh7cc7LZ/J2PW3bUpRteCR4RdSDkPo1+YTI8B8BJB8EsNrto/bUsDcx9Rj1JEcTAVUHEkAmNZZhJCsRkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3387
X-OriginatorOrg: citrix.com

On Tue, Feb 08, 2022 at 10:16:59AM +0100, Jan Beulich wrote:
> On 08.02.2022 09:06, Oleksandr Andrushchenko wrote:
> > 
> > 
> > On 07.02.22 19:06, Jan Beulich wrote:
> >> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>> +static uint32_t guest_bar_ignore_read(const struct pci_dev *pdev,
> >>> +                                      unsigned int reg, void *data)
> >>> +{
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +static int bar_ignore_access(const struct pci_dev *pdev, unsigned int reg,
> >>> +                             struct vpci_bar *bar)
> >>> +{
> >>> +    if ( is_hardware_domain(pdev->domain) )
> >>> +        return 0;
> >>> +
> >>> +    return vpci_add_register(pdev->vpci, guest_bar_ignore_read, NULL,
> >>> +                             reg, 4, bar);
> >>> +}
> >> For these two functions: I'm not sure "ignore" is an appropriate
> >> term here. unused_bar_read() and unused_bar() maybe? Or,
> >> considering we already have VPCI_BAR_EMPTY, s/unused/empty/ ? I'm
> >> also not sure we really need the is_hardware_domain() check here:
> >> Returning 0 for Dom0 is going to be fine as well; there's no need
> >> to fetch the value from actual hardware. The one exception might
> >> be for devices with buggy BAR behavior ...
> > Well, I think this should be ok, so then
> > - s/guest_bar_ignore_read/empty_bar_read
> > - s/bar_ignore_access/empty_bar
> 
> Hmm, seeing it, I don't think empty_bar() is a good function name.
> setup_empty_bar() or empty_bar_setup() would make more clear what
> the function's purpose is.

I don't think you require an empty_bar_setup helper, the code there is
trivial can be open coded in init_bars directly IMO.

> 
> > - no is_hardware_domain check
> 
> Please wait a little to see whether Roger has any input on this aspect.

I think for the hw domain we should allow access to the BAR even if Xen
has found it empty. Adding the ignore handlers for dom0 shouldn't make
any difference, but we never know whether some quirky hardware could
make use of that.

Thanks, Roger.

