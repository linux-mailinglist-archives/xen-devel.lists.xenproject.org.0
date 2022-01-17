Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE8490581
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258070.444018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol2-0000cq-T0; Mon, 17 Jan 2022 09:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258070.444018; Mon, 17 Jan 2022 09:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol2-0000P1-JL; Mon, 17 Jan 2022 09:57:00 +0000
Received: by outflank-mailman (input) for mailman id 258070;
 Mon, 17 Jan 2022 09:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9OeE-0002gi-Fw
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2f2e699-777a-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 10:49:56 +0100 (CET)
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
X-Inumbo-ID: d2f2e699-777a-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=iovEghoT8JMLNPfTSfeZnMsLNMaTz3gRKDzMAmf3b44=;
  b=JXlT2Hr61rO3Jjq5pD5roZOC2fsqsiB7LEmLP9RL25DO7k5ESEocRvbP
   FO0SNf+vCz2rsqi/8MckECv9DQhHGY1ozyVFsPLb+gWnwoXjGg7Uk9WGL
   viomIEpUd+EHgImG3L2F8BT3kCxSCoO6jql8++xfUs14OeMx9w9x3s2Pm
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: c+EvjqZ+33Mg1IUHfX7m11tJ9MgoCmqFsFThOf5WD70CQwfqZWU0gvSEdjnPaZHkIMhP8Ixi/A
 SNiVKWuM98ngHH5NcfDBy0vCYSPHaPuOGouRFBhx5eJC80Fc5ryRUHAbW0FaZZGT7kbOO7jEwe
 Q4MOVXaIvV0oQL7OCT+7z9+fXHqnFRUiV+egja/h2RTIcY0fbcdMAZjDGNaqiMPtFHZSkfl3PT
 R006NDmG6JcZzBcUyT9eyB5jV4Ezr5iP+uVV1y400ZdLLWVLb9eEgWFjVj+22xNee1wLIVOY/i
 wOQvoTpGD4yVokRYCbx8TU/t
X-SBRS: 5.2
X-MesageID: 62542586
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:K27g9KDKlt3H1hVW/87kw5YqxClBgxIJ4kV8jS/XYbTApDx00WQBn
 TdMCDiHb/nYNzHxe9lzOty+pkgO7JfVx9NnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940E07wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/u3aLv9Nxm
 ex26t/paDoOIqfglO0TekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf+XuYUFjGlYasZmJNT+e
 M0jaBxUVhnJQEIRMWYaMNU6tbL97pX4W2IB8w/EzUYt2EDRwxZ2y6PFK8fOd5qBQsA9tlmcj
 nLL+SL+GB5yHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3UruUCT+KfjzBTkApQGd
 hJSqnFGQbUOGFKDfpr/fx648Ue/4V1Feud3D+cW5AiD4/+Bi+qGPVQsQjlEYd0gkcY5Qz02y
 1OE9+/U6SxTXK69EizEqOrNxd+mEW1MdDJZO3dYJecQy4C7+Nlbs/7Zcjp0/EdZZPXRECq4/
 T2FpTNWa1473Z9SjPXTEbwqbluRSnn1ouwdu1+/soGNtFoRiGuZi2qAswKzARFodtfxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9rW/wqyXzIdwOsFmSwXuF1O5eJFcFh
 2eJ6GtsCGJ7ZiP2PcebnarsYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTib24hAjQfLwXufhnY
 /+zKJ/0ZV5DUPgP5GfoG481jOF6rghjlTK7bc2qlHyPjOvBDEN5vJ9YajNimMhjsvPdyOgUm
 v4CX/a3J+J3C7yhMnKJoN9KfTjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX3BUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:ISg/LKtKfoFOlLKpDsTE8ZrE7skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/hsAV7CZniahILMFu9fBOTZslvd8kHFh4xgPO
 JbAtND4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNz2CA5sQkTuRYTzrdXGeKjM2YKbQQ/
 Gnl7V6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9dVfYd1P7srhJJGdZc8qPSMex7wqGr3QRqvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62542586"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNT8wusQLtp43BQGFdgTAwo+po0kJ1XEnzfKai/tQ2fcI5QFT2JepKHHqnp/XMz+H+sfR0PSmoOOCVcqOjgQpz4kakpewOddeHgNqk5NBHbzg6cbot0wlaieeC7cCYZ4v4BZGoxSfZjTgiDOnKIw8gBZKU+EpFK7Ax+BNmZARZeaLzMpEQihkTSzZplrD85H1P3OOZihnjF190oMxiqtX77drZpYP/LxPO6pTIrTP+XvwmtcqKkMRo93NydpITalS5NEq5MMbQuoem0djie8rs6ClZDXdRNa/LryJ9C46DpQdCUmwm+cActj41a7jXWhTlUXHGBSkKV0UC7tWMalsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shER43YyyQhVY1X+UAZxNkhxrqoglUfGVvwMDWcCp04=;
 b=Jo08DoCb/0OFTML/Bl3nS+suJuPBKc/ca/jelzQ+WAZCwsxmEYNj9/4Sh8tEQ8JjZCCPU3QjI5f0anqsf0I1RaDTb9cBNJ0+rIayOWmLswZ5KXukylwzxomMifrkmbxtz31h/HG6B4MOXEmpWdwvuMItNOerJnKLrCLghDal1SjtUp8wHwGgRDcC3tXpfSgiqzeTxwXXtIZqmGlrCWJWPJ8A0FDJpQfRqH4Psvm6gEkhFXd41I+neG7vDA+4ZFFAkjZRTPl0Q7SPzNNgRexBWFnz6D4+qpF5bZPjeC1uo/r/0v4z96safIkYGkUf5rRP54yYQzAj8adBpseQVfMcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shER43YyyQhVY1X+UAZxNkhxrqoglUfGVvwMDWcCp04=;
 b=jDmOJnJLJOUYSg20nN3jm2L4O1Eo20XQMkxJkFI7R2CiC58VxGs/ccQAFiOYf4RZ88MxWFdHFyUUWDZ+53c4BWUBjoMz9BKKvO1we3z+icy8Zb4bxEELYAlGtCkZg6Bp+aq2OBI1kWVb+GdJ8+UDsLoAXXJlpmtqP4lydvgm08E=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 10/12] libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
Date: Mon, 17 Jan 2022 10:48:25 +0100
Message-ID: <20220117094827.16756-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0046.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bd941d9-348c-4f84-e34b-08d9d99eb55e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB40592D87508305A941ABE4CC8F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIFx5Q8y1vlnUikXENkXiERWHcGKA5+YneZYJBfh3jMKwlNMt8NXKGLRuSeva7B4FWIEXgmTJINgHDTex8BBUvxduVqkAa0TOuALC3EkTO2MUBD/C+GNhynOJGD6i65TqzdW0moTA4mUg4d33Tb1ugwarveSEIurrgKCrK4s9i//tVtxQPRLbaX37bMo2VvT3LtT4Rk4Q526dDjm7pWd5xg+E9otjt1sHnfceNVHbkeX7W3EIgzRFCAZeM8P80Lof3PU2YZ8OA5laTsAOynNuUFBlNq71BIEBCFgmQGWAcaFx82627BQ15bowySqBiY9jDvZcXZzHhnDPJyRUYkdALTubzhcPKAum8hr92vieVL3jyq4LVqJiLXYxP6/pMhGf3rIMPzfRiF55QKgC4cXOYK2cbgGHS+gkwy4zrJjGrXZoCaefd27XR4lEZiEI5leqDiC7hxkhMOZ3o/xrxNgpQLU/5uKARnueSS6EkIeLwSBJAdw/lw+Q5OrnCN+7DhsdY4LcQ+CwA8vQvivvuAiNlQ4cugxaO7kLg3Ms6pHLMVQtzs+3U+MXMFqHlbtcNpSR6DI9blHN8QT7dWpKLjDzfdnqbiD+zEoL72yw9US8w1JKU6s7bCOBSggNrxo/wagd2LpSvHXVQI6MVSoC9WXXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T05EUXdHMFRDTXdqUzZjSU54M1FtMXRYSWpvaGdoWXNjWnFuc1JyOHdNN2Zx?=
 =?utf-8?B?dThlK2xhenhxeHM1R2ROeDlyU21GUlB5M1pVTHNsdG9Fa2p0ejdhK0JhZldq?=
 =?utf-8?B?ZytrN1pJNFd3NHdtYlQ1UEErOE94Q1pWR3RkZElJZFc4TTBFRkVIOXJjQ0VJ?=
 =?utf-8?B?UjI0TzR5bFNhNE5tYnB2NUtJYUxjNXdNdjlRdFU5S0hGUThLN0JsVlFKcWpJ?=
 =?utf-8?B?UEx5NWFDQTZORlA4enhHNlhCZi9NK1RNVVd2K0pSajJORElEd2w5OE5INGFt?=
 =?utf-8?B?d1VCVUhLcDQ4ZHNpYVJ4Y1ZhdzZzWFkxWDYyOGdadUtReHE3RFBNTkhIWnl3?=
 =?utf-8?B?eHAreTF3ZENBakJ6N0ZJMU1IYmZqQmc2MHBoVDlpVktwK0ZEaGFDZ1ZXMW0z?=
 =?utf-8?B?QVNPTmJFbzdvbzFWZEVCN0ROL3paTWZ4eGZDQnViWjljTkprbWVRbThlbXdN?=
 =?utf-8?B?MTEvemR2M1lTdzlWSDdldjNnOHZoQ25ISHZNcVF2SE1oQ2c0cFYxenZmbXhM?=
 =?utf-8?B?TkgvZklTSGg3cG85aCtsaDlDSU1ZVGlxTmNtM2M3cnlKcnNEK0F3dFpFN2p5?=
 =?utf-8?B?dEQ3ZXBkOTFUdWErR24zNlZ4S1lWU0g2S3o2dWVCcWVDSGpZWThXMUdwWGJq?=
 =?utf-8?B?a0gxdTg5ZEtIWWR3RVVxaCtkdFl5Y0VyV1hsaWFVd3lMSmR0eTlaUm9PUWxo?=
 =?utf-8?B?cUFpbExkUjVYQXhtWXRPWUpsT0RaUXVJZGFqTHBIMk1RR2t4cDZ4SEdDNWY1?=
 =?utf-8?B?a01NanFGNjZqV1NsU1dpdGswMy8vWHI0T085aHlFMTR5RmVuRHplUGR2K25V?=
 =?utf-8?B?VEZJUFF2bU41Sm5iTDBmOE01UTRiN3A4eEZFTVBRSkQ4MFZlV2NEckduTHBl?=
 =?utf-8?B?M3JQcnd6L1EzRjRkYlBIakNXRTBkS0RHM1RjM3hUNytkWlRjNVlqdHIvcUh1?=
 =?utf-8?B?NXNoeGdOQ2M2UndFK0tqbW80d1NNK3JWd0VCMkJhK29XZGNBMzloRTk5MHB2?=
 =?utf-8?B?YWVveFJ1dDhDWTBJRkQxakxwL0NoQ203VTdWV281OTJrMC9yejZQQmhUMVVT?=
 =?utf-8?B?dzFHZDlsVWRvSWo4VjFnZGEycC9FVC9kMTlwbTVoSEtNaEpUTkFDVm9WYmp1?=
 =?utf-8?B?VENPWVJ5cUN2SkpoUThHQ1NQVWQ4c3djYUZ6eTllem1DQkFpNjcyVkFRYms2?=
 =?utf-8?B?MFcwTVJFUWNmVFQyS0Z0SjJuSkhMKzBpZFlTSDgwS0JPYVlsUFpLYlBEUjhk?=
 =?utf-8?B?RHFwaGQ2andlV0lkRXYxSEtWQ3FpaEZQYzNIcFE5MWlsMHF4VWpLcjZHK0dk?=
 =?utf-8?B?VmYzYm8vYUVabEVYVEVXekwwZCt5UUo0TERqWmVXRWUvZ003clJCS2FUSWwv?=
 =?utf-8?B?cnQraHl4N0VVZTBIay9qbVJYYUpQRGJpbCtDMkxUR01zM1lwUEJTSFNDK3lH?=
 =?utf-8?B?VWJTK1I5UC90dWxadTZRNW5oRlo3K1ZpVCtQcWM0ZWVRYXFHMFlpYkdESzdl?=
 =?utf-8?B?M2Z3WmgwdmUrdWNhVWQzMkZWejJucFhONEl2U0djay94TGtNbDROZUpPZEJ2?=
 =?utf-8?B?enRMQU5uRWFDSThoVk9Dd0VRM3NTYlljNnl4VHc5RlUvV0ZxZzBhSmpIOGNH?=
 =?utf-8?B?Q0h4dVBENnV0R2tZQlJweDZKd0FQaTZGejRHMldja1VPWDZBcTZvMEhNekRz?=
 =?utf-8?B?VmlMYk1kMUxjUmMwWktwOXV1OS9NOUJiZmZDM1F3TjM4RVBvUVg4M1RCZTJa?=
 =?utf-8?B?R2ZtdnhUZ0ZNSDFBN1pmQktoM2Z2R3FkNXliRXNXd2Yzb2liZ1MxK2ZuRjZH?=
 =?utf-8?B?ZloxZGtjTXBtNjUySkt5UXc5a3hMdWpoTVZabEVEYWFXeGlTWDl1N3RkOXpP?=
 =?utf-8?B?Mmh1V3JWS2cyTmx0NmsyWXh5VG4zelZDNXRkc24wMXNIcWo0ZGRyQTZnd3JP?=
 =?utf-8?B?R0pLOGdWcHA3SlhQcWFocnFWTEpmNDZ2ZlYzejFiZ1dpZFIrS1pkQTI3Ykc3?=
 =?utf-8?B?QUUzQUV4ZGZSQkhWM1RnNWN5RStWaHdBYTFaMFN1bEpPcHh6ZVdHd1ROV0Fu?=
 =?utf-8?B?UkdML3NKVXVRNUNmYnlpQ21ZdUN4b0F2U0w0OWw2WFV1NXNVdUFpa1pDaVJ4?=
 =?utf-8?B?Rkc1NS92cWZxdHdvVDFCQ3ViTXJ3b01XR0VzK2xOUVFQc3ZSZm5YOXdqWUpM?=
 =?utf-8?Q?cs3ZwZACUgv7Yg7qIJMyh+M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd941d9-348c-4f84-e34b-08d9d99eb55e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:52.1371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbGN4/qe2SsjS6e/JCjX0dCZ7Lj6sqNJNPFD7jbZBat6VyrDKew2ZYglBUB7Kc9/MO5IhnNkQERxrjpvwco8pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

With the addition of the xc_cpu_policy_* now libxl can have better
control over the cpu policy, this allows removing the
xc_cpuid_apply_policy function and instead coding the required bits by
libxl in libxl__cpuid_legacy directly.

Remove xc_cpuid_apply_policy.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v4:
 - Correctly account for PVH guests being HVM in libxl__cpuid_legacy.
 - PAE option is only available to HVM guests (_not_ including PVH).

Changes since v2:
 - Use 'r' for libxc return values.
 - Fix comment about making a cpu policy compatible.
 - Use LOG*D macros.
---
 tools/include/xenctrl.h         |  18 -----
 tools/libs/guest/xg_cpuid_x86.c | 122 --------------------------------
 tools/libs/light/libxl_cpuid.c  |  92 ++++++++++++++++++++++--
 3 files changed, 86 insertions(+), 146 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..745d67c970 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1829,24 +1829,6 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
-/*
- * Make adjustments to the CPUID settings for a domain.
- *
- * This path is used in two cases.  First, for fresh boots of the domain, and
- * secondly for migrate-in/restore of pre-4.14 guests (where CPUID data was
- * missing from the stream).  The @restore parameter distinguishes these
- * cases, and the generated policy must be compatible with a 4.13.
- *
- * Either pass a full new @featureset (and @nr_features), or adjust individual
- * features (@pae, @itsc, @nested_virt).
- *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
- */
-int xc_cpuid_apply_policy(xc_interface *xch,
-                          uint32_t domid, bool restore,
-                          const uint32_t *featureset,
-                          unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index cf202671ed..974549c0db 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -379,128 +379,6 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
-int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
-                          const uint32_t *featureset, unsigned int nr_features,
-                          bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *cpuid)
-{
-    int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpuid_policy *p = NULL;
-    struct xc_cpu_policy policy = { };
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto out;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL )
-        goto out;
-
-    /* Get the domain's default policy. */
-    nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
-        goto out;
-    }
-
-    if ( restore )
-    {
-        policy.cpuid = *p;
-        xc_cpu_policy_make_compat_4_12(xch, &policy, di.hvm);
-        *p = policy.cpuid;
-    }
-
-    if ( featureset )
-    {
-        policy.cpuid = *p;
-        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
-                                            nr_features);
-        if ( rc )
-        {
-            ERROR("Failed to apply featureset to policy");
-            goto out;
-        }
-        *p = policy.cpuid;
-    }
-    else
-    {
-        p->extd.itsc = itsc;
-
-        if ( di.hvm )
-        {
-            p->basic.pae = pae;
-            p->basic.vmx = nested_virt;
-            p->extd.svm = nested_virt;
-        }
-    }
-
-    policy.cpuid = *p;
-    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
-    if ( rc )
-        goto out;
-    *p = policy.cpuid;
-
-    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
-    if ( rc )
-        goto out;
-
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
-    if ( rc )
-    {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
-    }
-
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto out;
-    }
-
-    rc = 0;
-
-out:
-    free(p);
-    free(leaves);
-
-    return rc;
-}
-
 xc_cpu_policy_t *xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index e1acf6648d..7dcdb35a4c 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -441,9 +441,11 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
     GC_INIT(ctx);
+    xc_cpu_policy_t *policy = NULL;
+    bool hvm = info->type != LIBXL_DOMAIN_TYPE_PV;
     bool pae = true;
     bool itsc;
-    int r;
+    int r, rc = 0;
 
     /*
      * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
@@ -454,6 +456,41 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     bool nested_virt = info->nested_hvm.val > 0;
 
+    policy = xc_cpu_policy_init();
+    if (!policy) {
+        LOGED(ERROR, domid, "Failed to init CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to fetch domain CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    if (restore) {
+        /*
+         * Make sure the policy is compatible with pre Xen 4.13. Note that
+         * newer Xen versions will pass policy data on the restore stream, so
+         * any adjustments done here will be superseded.
+         */
+        r = xc_cpu_policy_make_compat_4_12(ctx->xch, policy, hvm);
+        if (r) {
+            LOGED(ERROR, domid, "Failed to setup compatible CPU policy");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    r = xc_cpu_policy_legacy_topology(ctx->xch, policy, hvm);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to setup CPU policy topology");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
      * the xen-3.0-x86_32 and xen-3.0-x86_32p ABIs).  It is mandatory as Xen
@@ -466,6 +503,13 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     if (info->type == LIBXL_DOMAIN_TYPE_HVM)
         pae = libxl_defbool_val(info->u.hvm.pae);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("pae=%d", pae));
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to set PAE CPUID flag");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
 
     /*
      * Advertising Invariant TSC to a guest means that the TSC frequency won't
@@ -481,14 +525,50 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("invtsc=%d", itsc));
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to set Invariant TSC CPUID flag");
+        rc = ERROR_FAIL;
+        goto out;
+    }
 
-    r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid);
-    if (r)
-        LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
+    /* Set Nested virt CPUID bits for HVM. */
+    if (hvm) {
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("vmx=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOGD(ERROR, domid, "Failed to set VMX CPUID flag");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("svm=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOGD(ERROR, domid, "Failed to set SVM CPUID flag");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    /* Apply the bits from info->cpuid if any. */
+    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
+    if (r) {
+        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to set domain CPUID policy");
+        rc = ERROR_FAIL;
+    }
 
+ out:
+    xc_cpu_policy_destroy(policy);
     GC_FREE;
-    return r ? ERROR_FAIL : 0;
+    return rc;
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.34.1


