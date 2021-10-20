Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5B5435440
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 22:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214083.372513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdHmx-0006qi-HS; Wed, 20 Oct 2021 20:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214083.372513; Wed, 20 Oct 2021 20:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdHmx-0006oc-DX; Wed, 20 Oct 2021 20:02:15 +0000
Received: by outflank-mailman (input) for mailman id 214083;
 Wed, 20 Oct 2021 20:02:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QpeW=PI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mdHmv-0006oW-K5
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 20:02:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cd52f9a-31e0-11ec-8357-12813bfff9fa;
 Wed, 20 Oct 2021 20:02:12 +0000 (UTC)
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
X-Inumbo-ID: 9cd52f9a-31e0-11ec-8357-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634760132;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gwVswPp89v0uyd6Eh27m4OZBMYYEtoB19YcwSFhVui0=;
  b=HfZ712w+McHgtpMjDm9Fm5xYXeXC68QCT0yLloI78+h58wV1DgHVjc6C
   wISQlT2z/NFRI+VG7GBMcM7hUUxUlJrTdfQi4j3vmWM1FEcp3tVG12p2s
   fawgJVk5HLuhcTSUpnkXEd9A5MfheyeTZac3hVfaWbtigz4N5mTb3bxz3
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Blg05HS9F4XGiJQNbbREtmISYgCn4OI91WC1puiHP2+SHhe3rOYo2rfCCoU0sZnGKNQuAcjQBN
 lBZVb5Hv8zU3NHfknCZpSQvFbnXSto0C2+ZnzYY8JYmJjIGTt/HKpOovsDEbslMBexgReVE64Y
 3hoIuHccmbFv5b/eHEFtxNxJZ+xdj7J4mze5p/1ia6cZ9f609TklY6uP9QJcnz8/CvYm0yVo4O
 KnK66qPl418JMlO5CTXnpeWIWQ74E6z3plw9kH4PUM+PxTURrPzdIq1SsJLLdKz9QP8KO2AxBp
 4uqDCPLo9d9Q0MT8nGVfzQiZ
X-SBRS: 5.1
X-MesageID: 55235160
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PaU4iahjhVs4pxrY7Ejl3ydlX161lBcKZh0ujC45NGQN5FlHY01je
 htvXT/VaPqDNDamKYgnaYTlpk8OscSAndNqHQc9rX81En8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Yy2YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1RrZe5GAt5N5bhs9ZAbAAHSX1UE6RZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauDP
 ZFEMGQ3BPjGS0JBHw0sFb0kptryrFmvXw1oq32KuZNitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOTufCkjmauVtQZL
 FYbkgIxqYAi+UrtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEAYVjVIOdB2vfQbbg536
 UbWxY/DKzVw5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEY49SP/dYsndXGiqm
 WjT/XdWa6A71JZTj82GEUb7byVAT3QjZjU+4RnLRSqb5wd9aZ/Ni2eAuAWDs6gowGp0SDC8U
 Jk4dyq2sL9m4XKlznXlrAAx8FeBvart3Nr02gYHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSXxMfEpMtrrV5xzlMAM8OgJsNiOMrKihbAqLGe6ENxGPxbMjwgBbmB9+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbZf1E8Rz14WqSPqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA9370s5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:z1Ht1qhegw3bCOF2aT2xoCmkCHBQX0h13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskaKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkZNDS0NykGsS+Y2njKLz9D+qj+zEnAv463pB0BPGIaCdAT0+46MHf9LqQffng3OXNTLu
 vk2iMonUvERZ1aVLXAOpFTNNKz1uEj2aiWLSIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsmVP73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMV2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYAB89IletiA1DkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooFI5+NRjzEB3YM87Uvt8vIYf9ERaHNMrByTh8r0qF+
 FoEYX1+OtWS1WHdHrU11MfgOBEZk5DWytuf3Jy/vB8i1Nt7TdEJgojtY0id047hdAAo8Iu3Z
 WDDkxq/Is+BvP+I5gNXdvpevHHflAldyi8eV56EW6XYZ3vBEi93KIfwI9Frt1CK6Z4gafbpv
 z6ISVlXCgJChrTNfE=
X-IronPort-AV: E=Sophos;i="5.87,167,1631592000"; 
   d="scan'208";a="55235160"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJQPsfhKanwB4ZCHzfqAHOq8Ct8h7w43IY3rU4qeOsFxVitD9/ew61DV2S9wGC+ncdrcO0Tew8u6boLj0JCIsBrIUUQRia0XxF21d5ddoYI9RdNf6RP0+s9MlDPSGRQWP5Cx8Z9I4NlTBtAm/Q8B1/g8rnoc4V4X2zEIsVcDvF3PRKSAK2Hq06gwTX2WIpeZsKJwT4npau4TUQVel4NN904j2USxa8+nW6cViRAL7y1TMCEHvcKfkr7QtAgWN2ybXOfs+2qgTlILpgeMEYvgwoAvNlOdeDc4NRMGd6dqpu3sG/nly/fTPm3/zfflCnB1YD3hAz+YgmiXIu4IJk4+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTLVC7cS/lefeTZA/B6tP3IwJisz4pj7fwvDBwl2HGc=;
 b=GxGajN6bVtYljpv3PE+la7c+0DIEHTpS2+PQHfnD5/5mK2RgC5ot6qt1eE7CsTPaaKNHlDh/OjnbmdULg0+ErORwj8+INEgztBlm/KXpfskStNKqnUvhF0NwI6B+tJCH0YdTqqhkHpaIguOEfLTlApPmYHHelgAI9tO81QdgfX5kIpavJMWtLs54O19xh81v8nPVncpIbUhKxOpP/AXbV9KrPja8O7Guf3FPvs++lJxWlyyE2CrREF4WFFrpSWwzZfQLOPovHQHJp+XcX9w5hyll2yoJhurVb3FCBzgumQweeVC81RyQv9ay7JyovqROOGmDSVc8xL6ForjG9UcCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTLVC7cS/lefeTZA/B6tP3IwJisz4pj7fwvDBwl2HGc=;
 b=Cq7wRIaLkkFQQm0ffre8eFeeGUbnjYWNUBYUmPTrQpTA4+97CZdeyrM5bnqtfF4kRqfYvPqqLXQR2ZgMDp9NhaB3KyaypoKD4sLiCT0Rm9C2zJtlmd7fttcwmnf01sSZWM+RgDRNa9UOS4i2rBgX07X8wojOE3ZOppQzBkyVbAc=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <684e4a04-3ef3-46be-3302-149d5ce30177@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/IOMMU: mark IOMMU / intremap not in use when ACPI
 tables are missing
Message-ID: <e710cb3f-9343-f9d6-123e-287687e7bac3@citrix.com>
Date: Wed, 20 Oct 2021 21:01:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <684e4a04-3ef3-46be-3302-149d5ce30177@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a0da519-1495-4b01-2aec-08d9940478fd
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5503:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB55039E720415D20E9AF97C92BABE9@SJ0PR03MB5503.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BgNaw2ZrcZv5DNjsB64zJbuHNb4mc/6fJVDUzP2J/Md8zsvr1YoeU64yvw9J/ssPB9a/oOWUfrNWP+fHU4Y9yrEBX2es0HAuNGfVnIOgAJH6s7YijzhGWJTVHW/DcqI9dSC81KIsMJZ1TlgpaE0948kNyCkBkeICUk8b14LHsaoZElZT1l7ObgXPwJoorklePJh2Vz15c8d/PpykGkSzIdYsWbGxD9+FSdCk4bi2iSN7okmZqxnVaZ2fYtDHk5q1gj8q4GExrgW7wz+3g+Z2fM3+qay6F5ZKJ3xIjbvNEX2cfqcmqFbycR6+wTE23jOZqYZpppXQM9b3bZo4x/tlgvcC+UiDE4rhka/5sWqHDPScxbcD27ibKAMhXMiRhrMZHYYMncr6hNcspYVryl6HlxdFChmlu95oaASXioOjGuKrwVFs+7is5leLD/agi5o/mqQWNg7Mf+Vc5LISLXvTbPuksiyRe7h+5Pcu6gGfkeiF6wBKfaoN7Q/E2ApUv2bDgOldoDA4bV7+zeH/tOp/o93kgBnIwazBIPP5UW+AEhfdvRVqRxeEUg99VOmSZ6652wPD+xrG0ynX5/RsD4wprLQ6WU8IWvxkOUCzi0oAvPbyLgHYUwqPDQ9+uTSGUcW6W6Jd+FxrjwmQ0EeM9oBR/x5QXqVYR3oad4pcO6Vo45UaX6/GjW5Z5Ehudt61lSRFhS9hOkWYOz7JsOn6lvzblBBpBpjYvtChCrAAhxv6+cGj0nItePaoBE/qC/88Gomf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6666004)(2906002)(31686004)(8936002)(83380400001)(110136005)(2616005)(66946007)(66476007)(54906003)(66556008)(956004)(508600001)(16576012)(5660300002)(86362001)(53546011)(82960400001)(8676002)(26005)(6486002)(38100700002)(31696002)(4326008)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTdsT3ZXd2FtK24ya0t0YmtQSHhoSlNSdGdjbEJWU1M0YndNeEJtekc2WXgy?=
 =?utf-8?B?NElCRUxHVFFSTDdlMXo1Ny82bFhhelZSaXFYTmVmQitLT1d2MEdRbzFnekU5?=
 =?utf-8?B?aG16aFpsOGJ6N00rdk1nTk53SnMxUkxNcVphZlQvZHRyeDNHVGZEUkw1WjdE?=
 =?utf-8?B?SjhTaGc5WWRwYWpRTit3NHNyMVZ2TURNMUJLRXFrRHp6T0JZVFFBZnc1TmFV?=
 =?utf-8?B?L2FDbHYxNUJFb2twVnFwNkV5YmhoeEtGUmZGVldncy9KZi9tcHovdVJENENv?=
 =?utf-8?B?SDhVdmh2M3BabUlKU1RUSUdvT2dzTkRXb1ZubnBhcEcySmtES29MbFdaSlFI?=
 =?utf-8?B?d1dFQVVFVTdwZE4yNEdla2toL0xKS01VTmNPVmhGOWlOMFNJbHFPSTYxOHd6?=
 =?utf-8?B?Ky9oMERjdWV6UzZtNXdJT0lNK1lkR1F0QWprL00rbllicXBtZi9sZE1rMDYy?=
 =?utf-8?B?ZUc5aThrVTRZMWdvQmVOQkJsKzlLMHVQT0lSTzBnKzJpdUwySkNaNnpvbnY0?=
 =?utf-8?B?SmdlQ3prMWZpY3B2dTU2N1JYbDA0ckF0VEUwZHNCbHlrQ0pGRnJveXhIaXFy?=
 =?utf-8?B?YnArWEd4WFB3WnJIdUV2RHI1ZVpQSDBKcUVHZ2pnSGRzOXkxeGtiYnVGVFRL?=
 =?utf-8?B?OS9tckx0SGN5RGlVcDltUHhtV05sTTIvd2NkVzFCTHVUSjYwWUQ1Si9JVlIr?=
 =?utf-8?B?ditCMEo4OXc5N0VSbHNlck9kclpVUHN1cURxK2p1Qk9nVlp1MFpGMzEwTEtI?=
 =?utf-8?B?NzNpZHA5MytNVTFYZGprQ3V1ejdFemRZaHdnV0J5aHM1OHZXcTM5blVYSVVq?=
 =?utf-8?B?aEtiOGFybTlzNGtrUE1mSGRveTVXODVHTEdmckVJSVVVcUtlMVRoM0wyTHQz?=
 =?utf-8?B?c1cxME85M29ORnNWcXREckg2MlgxMU4rUmh1QXh6VFJibUpiSzAvSEtrU1Yw?=
 =?utf-8?B?MkM1K2VYS1g2cCtISGhGUm9LU1FuM2VZbkZiQ3ErTElGUk53UTQ4SHFuaHRu?=
 =?utf-8?B?dDg2SncvWnlibGROQmR0UXQ5UjNPYTM0Q0JYMzJ3S201NzJNdVhjd0EvV2dk?=
 =?utf-8?B?d1ltMnpGbkRkOXQwWnBQNm5oRjI0ZHQxdjZHMTZmY3UxdlVUSkl3N3BndmxR?=
 =?utf-8?B?bWNKOUJPaE4zSzBSZWo1UGozVnVMMWNyZVVsRHFUTUwxSDE1ODh2VHVwWnJt?=
 =?utf-8?B?MXJSL0NGMVZ1WVNkeG5YcGdGNk0zQTRtaE9HT2xxOFAwYkNoQzNEZ01PVHRk?=
 =?utf-8?B?M1VVbWRJWE5ZenJudEpaTC96MDNLRTBpYVl2c0dZZ3paWU1oMGZodkRBVGNx?=
 =?utf-8?B?c0tDV01USHhwTE5JSGdaZWlJVDBWRXBDRGRBMFR2WUtlemhNUk1sR0FTN2Nx?=
 =?utf-8?B?emlQZllBcU12eW1YeW5rT1BVcjRLOWdyS28va245QkhyZ2UzQUp4STZjV2hI?=
 =?utf-8?B?WW9lVEZKWFRlcEw5cjNXRUpaeXE2TVZnWVFSUERwazRVMXAvb3R2RTZxQWFM?=
 =?utf-8?B?YnRMVGdFcUJhcnU0cWRwUmdTNHgySUhsa2UvS0JYUGVtTVVOZFRwYm5ycFUy?=
 =?utf-8?B?ZlJEbWJjWmlFVXBLSDRYMy91KzlvbGFiT2s3NEtHeHk0UVdxSnFCa3BHRUpN?=
 =?utf-8?B?TjRWWnRPTEE3VnI4WWJBaWMvOVpaWjNVRVNMdlBMc1Uwdk9xQld4UDVLY0Fm?=
 =?utf-8?B?UlczM1BPWU1pcVM1VDBOOUpvQm5TUUlMQ0xaYjcyZTVGYkxPekdZb3M1TWJq?=
 =?utf-8?Q?beaSRM5svLOFmNG1PYXPUUCtu2areyrwWDDCk07?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0da519-1495-4b01-2aec-08d9940478fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 20:01:58.2292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: andrew.cooper3@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5503
X-OriginatorOrg: citrix.com

On 20/10/2021 11:36, Jan Beulich wrote:
> x2apic_bsp_setup() gets called ahead of iommu_setup(), and since x2APIC
> mode (physical vs clustered) depends on iommu_intremap, that variable
> needs to be set to off as soon as we know we can't / won't enable the
> IOMMU, i.e. in particular when
> - parsing of the respective ACPI tables failed,
> - "iommu=3Doff" is in effect, but not "iommu=3Dno-intremap".
> Move the turning off of iommu_intremap from AMD specific code into
> acpi_iommu_init(), accompanying it by clearing of iommu_enable.
>
> Take the opportunity and also skip ACPI table parsing altogether when
> "iommu=3Doff" is in effect anyway.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I've deliberately not added a Fixes: tag here, as I'm of the opinion
> that d8bd82327b0f ("AMD/IOMMU: obtain IVHD type to use earlier") only
> uncovered a pre-existing anomaly.

I agree it uncovered a pre-existing issue, but that doesn't mean a Fixes
tag should be omitted.=C2=A0 That change very concretely regressed booting =
on
some systems in their pre-existing configuration.

The commit message needs to spell out a link to d8bd82327b0f, but it's
fine to say "that commit broke it by violating an unexpected ordering
dependency, but isn't really the source of the bug".

> This particularly applies to the "iommu=3Doff" aspect.

There should be at least two Fixes tags, but I suspect trying to trace
the history of this mess is not a productive use of time.

>  (This now allows me to remove an item from my TODO
> list: I was meaning to figure out why one of my systems wouldn't come
> up properly with "iommu=3Doff", and I had never thought of combining this
> with "no-intremap".)
>
> Arguably "iommu=3Doff" should turn off subordinate features in common
> IOMMU code, but doing so in parse_iommu_param() would be wrong (as
> there might be multiple "iommu=3D" to parse). This could be placed in
> iommu_supports_x2apic(), but see the next item.

I don't think we make any claim or implication that passing the same
option twice works.=C2=A0 The problem here is the nested structure of
options, and the variable doing double duty.

>
> While the change here deals with apic_x2apic_probe() as called from
> x2apic_bsp_setup(), the check_x2apic_preenabled() path looks to be
> similarly affected. That call occurs before acpi_boot_init(), which is
> what calls acpi_iommu_init(). The ordering in setup.c is in part
> relatively fragile, which is why for the moment I'm still hesitant to
> move the generic_apic_probe() call down. Plus I don't have easy access
> to a suitable system to test this case. Thoughts?

I've written these thoughts before, but IOMMU handling it a catastrophic
mess.=C2=A0 It needs burning to the ground and redoing from scratch.

We currently have two ways of turning on the IOMMU, depending on what
firmware does, and plenty ways of crashing Xen with cmdline options
which should work, and the legacy xAPIC startup routine is after
interrupts have been enabled, leading to an attempt to rewrite
interrupts in place to remap them.=C2=A0 This in particular has lead to XSA=
s
due to trusting registers which can't be trusted, and the rewrite is
impossible to do safely.

The correct order is:
1) Parse DMAR/IVRS (but do not configure anything), MADT, current APIC
setting and cmdline arguments
2) Figure out whether we want to be in xAPIC or x2APIC mode, and whether
we need intremap.=C2=A0 Change the LAPIC setting
3) Configure the IOMMUs.=C2=A0 In particular, their interrupt needs to be
after step 2
4) Start up Xen's general IRQ infrastructure.

It's a fair chunk of work, but it will vastly simplify the boot logic
and let us delete the infinite flushing loops out of the IOMMU logic,
and we don't need any logic which has to second guess itself based on
what happened earlier on boot.

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -41,6 +41,23 @@ enum iommu_intremap __read_mostly iommu_
>  bool __read_mostly iommu_intpost;
>  #endif
> =20
> +void __init acpi_iommu_init(void)
> +{
> +    if ( iommu_enable )
> +    {
> +        int ret =3D acpi_dmar_init();
> +
> +        if ( ret =3D=3D -ENODEV )
> +            ret =3D acpi_ivrs_init();
> +
> +        if ( ret )
> +            iommu_enable =3D false;
> +    }
> +
> +    if ( !iommu_enable )
> +        iommu_intremap =3D iommu_intremap_off;
> +}

This does fix my issue, so preferably with the Fixes tag reinstated,

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

However, I don't think skipping parsing is a sensible move.=C2=A0 Intremap =
is
utterly mandatory if during boot, we discover that our APIC ID is >254,
and iommu=3Dno-intremap must be ignored in this case, or if the MADT says
we have CPUs beyond that limit and the user hasn't specified nr_cpus=3D1
or equivalent.

This applies to a future world with a sane boot order, but Xen needs to
know hardware_support_{dma,int}remapping (-> must parse the ACPI tables)
ahead of choosing whether to turn the facilities on or not.=C2=A0 Fixing th=
is
removes the double duty from variables.

~Andrew


