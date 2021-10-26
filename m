Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A4B43B148
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216384.375973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfKi1-0002p8-8z; Tue, 26 Oct 2021 11:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216384.375973; Tue, 26 Oct 2021 11:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfKi1-0002lf-5H; Tue, 26 Oct 2021 11:33:37 +0000
Received: by outflank-mailman (input) for mailman id 216384;
 Tue, 26 Oct 2021 11:33:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfKi0-0002lZ-Bn
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 11:33:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8da313c4-3650-11ec-842c-12813bfff9fa;
 Tue, 26 Oct 2021 11:33:34 +0000 (UTC)
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
X-Inumbo-ID: 8da313c4-3650-11ec-842c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635248014;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hR8sbW2/ZnVJgEmpjl52uh49HNu615SzMqIY1hC2L10=;
  b=Sk5q4TAGRUklVvTLLpF86BPNiiD8ihzbIkHuDK/uUtK0Ofz56wVhExes
   uV1V0V4mQyJ2NfvQdBapP3LDRlq6lKhqEQlmcH322JrBbwhXsmL2TCg6L
   6UccdF25Df9o+N9Et9iBq6bPAOAzxRpPwoh7JA/t7ejJSQErXz+VmxqWM
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JoX8LU+UjWSsBCM3wpK0vk9PcgZ51da0lQ/QxonFPe2WBz6yO9FcQIlxm9pTMA0nYlo8KYfLJx
 uEgkQnXiP0dtxD7i5pdUlrZ5gWvBAfLoj7BvQ5Tb+CTV+H8seoBDnZHoKq05lhYra3XztT4mNc
 zOm9W2csJCLDojdn3gYDFtOnGobriKQkBeqxB4amiHSROzkJa9Kv3vApsNGhmR0Ye2iz0WsB3m
 wGe9kSSVYsDiynjNBFSNeSbGzFUntX5lrsYl1cshBPRiQ3r7hppVc8+7BwphxLZ5NZ8Umek8Vd
 HGUFhWZNDZJ01JmfHGLVZL57
X-SBRS: 5.1
X-MesageID: 56067662
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cjvkDqJfgQUzlqMEFE+R85MlxSXFcZb7ZxGr2PjKsXjdYENS1zdWn
 zEXWD2BPKmIZTb0KN10bd+wp0kEvJOHy9JlTVdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2wwskoz
 NVDqaevQAJ3O6T0lcUvSDhhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xu4cGg2lu3KiiG97yP
 utGcjxUKy/kbgIRMQkvIYAEh8u30yyXnzpw9wvO+PtfD3Lo5A573aXpMdHVUseXXsgTlUGdz
 krv5Xj0ByY/JdOWyDeb2n+0j+qJliT+MKoYGaek7PdsjBuWz3YKFRwNfVKhpL+yjUvWc9VbJ
 k8P8ywit5878kCxU8L9VB21pn2DlhMEUt8WGOo/gCmXw6rJ50CCB24LThZIctlgv8gzLRQ00
 VuOk8LsFCZYurSfQnKA9Z+ZtTq3fyMSKAcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxAA3gbkJ15ZTj420+FnGh3SnoZ2hZgwo4gTaWEq14wU/Y5SqD6Sv7VXY9v9GIJyuUkiav
 HMEls6d68gDFZiI0ieKRY0lB6q17vyINDndh19HHJQ78TmpvXm5cuhtDCpWfRkzdJxeIHmwP
 RGV6Vg5CIJv0GWCVPJuOoaxBdgR0qHlS9Hsbv31XMFvW80kHOOYxx1GaUmV1mHrtUEjl6AjJ
 JuWGfqR4WYm5bdPl2XuGb9MuVM/7mVnnzmLHMGkp/iy+ePGPCb9dFsTDLeZggnVBou/qwLJ7
 80XCcKOzxhOOAEVSniKqdBNRbzmwH5SOHwXlyC1XrLcSuaFMDt4YxM0/V/GU9c995m5bs+So
 hmAtrZwkTITf0HvJwSQcWxEY7jyR5t5pn9TFXVyZgvxiyh6MNf/vfZ3m34LkV4Pr7QL8BKJZ
 6NdJ5Xo7gpnE2yvF8shgWnV89U5KUXDafOmNCu5ejkvF6OMtCSSkuIIijDHrXFUZgLu7JNWi
 +T5imvzHMpSLyw/XZ2+QK/+kDuMUY01xbsas73geYIIJi0BMeFCdkTMsxPAC5tcdUmanWDKi
 V3+7NVxjbClnrLZOeLh3Mish4yoD/F/DgxdGWza5qyxLi7U4iyoxooobQpCVWu1uLrc9Prwa
 ONL4ev7NfFbzl9Gv5AlS+RgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU6VmsR
 0aC2thGIrHVasnrJ0EceVg+ZeOZ2PBKxjSLtaYpIF/37TNc9aacVRkAJAGFjSFQdeMnMI4sz
 eo7ltQR7giz1kgjPtqc13gG/GWQNH0QFa4gs8hCUoPsjwMqzHBEYIDdVXCqsM3eNY0UPxBzc
 DGOhafEi7BN/Wb4ciI+RSrXwO5QpZUSoxQWnlUMEEuEx4jejfgt0RwPrTluFlZJzg9K2v5YM
 3RwMxEnPr2H+jpliZQRX22oHA0dVhSV9laolgkMnWzdCUKpSnbMPCs2PuPUpBIV9GdVfz56+
 rCEyTm6DWa2LZ+phiZiC1R4r/HDTMBq8lyQkc+qKM2JAp0mbGe3maSpf2cJ90PqDM5ZaJcrf
 gW2EDKcsZHGCBM=
IronPort-HdrOrdr: A9a23:W3QFzKhWOvX+FAGu0+ilYtLTjXBQXz513DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ISuvkuFDzsaE52Ihz0JdTpzeXcGIjWua6BJcK
 Z1saF81kadkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.87,182,1631592000"; 
   d="scan'208";a="56067662"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilgvZ8i2Ps0S72fda82M+OVpuABCCe7A02Kw00PHWO2fSeVq18YSffp2j3h7CDTOFXB5md46M3pISGJqInhIeEM7NvpbKZu0+skS/jeaTXAuUlcU+2rqeeVmEORwtQ1kNpCcYocJAFL808PShklvBS/UWXHUsqMXM3TOA8aDG6YQEGA7kPcbwlHgE4qVqZmsJasBx0NkBNENL9lR/c2MH59/37niFpgiITSp0+Xg3ylQAeup39qud6MddKto5LApCiQK8bTNVFkrYpGjVlCxsWrEpfDM/56fg6hqz6JTqayMqSiwEQNccaVwboBS0voqEOnBEn4zod3TYjiHKlTqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xV6cE3lYNLcn733a1EmyhjCDB3A2zueslC8j7tXpRTU=;
 b=BaYojEXESwFoLR2Vra5KRjmIoEyfq8bdzgEQCCiSC0YMG75mDUUlNdEhgneuDavb/fx++LGXUD/K+07NP54AMsU9QXb7bSb22VHf1ookClRemOD8DTVeT2VWklLa05X9pGBR1nB0VwntVVzbWxx0eQpTiwAqYdAogyQm4/4APofRtrVMiBOnt8FZokNBq1JcAzazgDgmGdOnjxXPzI/ylMdvpgZNkFeafkKmXR2DagZ30rXSxDfaj5dUikwL40xszv+kDv7z8w+XdSMwKprWPyIPkNe2u7jumSuy6khXvKuSw72pTsRpQtf7+tusw+0Ievhfx/vfqL7PY8ERssiYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV6cE3lYNLcn733a1EmyhjCDB3A2zueslC8j7tXpRTU=;
 b=TD33/1/FN3VQnpsv4yZtDeS6LRYV1vMmuZp0rxQ5p29ARSkZYqmRAbcFuSDAZzpgBcxW14KB7Ao+EfqK56lIuXEg6l+Qz/xYfZL6WreTdVKXTUbPrZC6FVaW/vzH8m92g6p1/HM1q0BmyZfTjZYD1AS0Y+qdDInWQy7b/euVzZc=
Date: Tue, 26 Oct 2021 13:33:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Message-ID: <YXfng3PqDI6C4yxn@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-11-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-11-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23e0f3f7-7f5b-4e0d-1346-08d998746ed5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4140:
X-Microsoft-Antispam-PRVS: <DM6PR03MB41400F832A023BD4597D06A68F849@DM6PR03MB4140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cx3Y6kQwknZMUCdwF72QvTdf4wAbuwAvHz9Ru48ug4FUbQQO/U6U+rqgc3MVLgQsAK4GVSTmIXXsH+j98dw+0vcIRB4ggIMnX9P4sMgF3wIZDuPquY6PLbrRkYWp2YPRrNeLbzUfd+lfe7iE0/N3e+WskAExWrzgV/QEAquyq87+84jbNlr87FMpfaySKouMi4ZZZfVsub/8aGur5yNz1doiT0TQXbkZz7y8Qvlv9QxQGMAUkou/Uvck7h1Hs8ndB/c6ENdVQU+vExzVYkfLSC6a1aLt5OGHadUHQN8e0jQ56nGRivrGuP/KhjUVMQp9N2w7B2k47QkaiOJLkJ82qe/03Dbl+MKpCOuzffi1J7AT9kNDpgZbznJoDQMGuMc3071+j1EMJD6JAqTd20htCHeBSwTI1W8OjJ0GqguRk7hBUPb1PlV6jlRw4NV2B4QOpFMmifDxuzNJvLrjP8OiZBPlw0d+n503yq3j4ZR8V+jw2iwHjPR184fzVtFPu2k6N6/whg4Y2Iildr+w9WK86VRrgKzwDwaGqIDF3wIuscBEGUGvpA4cqS1YfOx43oSMGyxmqxW9xfr3PUdtJZvh0YXEeZuV3opkfAl3qsQe09iws1w0p5JB9yir23i2DdhLVil0A7gLOJv4qsGQis5MIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(8936002)(4326008)(26005)(85182001)(6916009)(186003)(508600001)(2906002)(5660300002)(82960400001)(8676002)(66946007)(66476007)(66556008)(7416002)(86362001)(6496006)(316002)(6666004)(83380400001)(6486002)(9686003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkhzSytialhpUG5lbzZCeE9mUGRHeWMxU2Nhc05NU2oxVkJobW4weStJekxy?=
 =?utf-8?B?TGhWYUJ0UGg5Ty9QZFJMNUpKZzdGWitjNzFySDQyTzYrekRZQUYvakhacVhj?=
 =?utf-8?B?TDB2M3dkMnBMLzhzZ21BVWRyaFppeEozaVNmOGc4UExReWsralMweGlDSW9Y?=
 =?utf-8?B?ekVvQ0g3VGJHTU1wdUVnU3JROFFDdVB2VHlXZUwxOEVkQk1uMStKZ0t3UzNQ?=
 =?utf-8?B?MVFKSyswd2tkVitLd3o3Sitrck96TjVWUytTN0t1ZHY0RDRJaG00R3RMUStY?=
 =?utf-8?B?NENnK09KVVQ3ZnRQNGJ5U3h1YXJaUXpVQ201clpTK3dhRW1tb3pabkoxSHRk?=
 =?utf-8?B?OEkxai9URFNuNm45SW1TYUxvKzVWUVVud0c0TmpwS0grTHZwV04rdVR2REt4?=
 =?utf-8?B?b2h3TGNMYjZaTjJUUUNnc1F6NHhkQVlSZU5HSVZUejFXSSt3WU1DdlAyaVpz?=
 =?utf-8?B?OEduMHIvNjdkQjFNSVR4L2NzcWIrbng1SDdUcjhhOFFPYndSUVUzbW11elh6?=
 =?utf-8?B?ajMyVXhEUVE3bTFpYUpCazlIeHJUS2NFNXowZzRGM2ZsVmZxSkp2THFsYmJp?=
 =?utf-8?B?NzVNMktJdnd3WUN3WVUyTVdCRUJBOXNVTTVyNXBrOTVPYWlpcThZNDJDMkc0?=
 =?utf-8?B?dklYenpJKzAwVXpRdkhXQmhKY0hxRkJtZXhtSFdRWVZqNzhONTNVSCtaSjFL?=
 =?utf-8?B?RXV0ZnlWZ252YUc1Nnp5NU5HaTg0dDU3cDlXSmlqMzZKY2NXa3M1aUo5anM3?=
 =?utf-8?B?ZHZ6azcwSWd4OXNLUFd2MDUxMGN2b00rMzBUS2RFWEhqZ0N6T0ErR0ROSkJD?=
 =?utf-8?B?RG02VEEvY2NBYllLdUgzRzdGazEzRHFQQU92THN3OWJ4ZGhaTHYyOWNYZ3ov?=
 =?utf-8?B?RjViU0lJSlZMUlNKeVF5b2J3Tk1hc2k2UWJXa3hCcElkcEVVSFBpOC8wUDMr?=
 =?utf-8?B?MVlVN3Nmdlkrdm1DQnRjSnhaUHdPYXBuTmIxNHJUSnlnVDQzeWpnanRDTG1R?=
 =?utf-8?B?ZFQ5V3RjdGJkWDBnYVljR0lpdkZCcytZbzVsWWRBTlVVM3VHc3g4TTkyV2pN?=
 =?utf-8?B?NUhuQlJnNmtzV0g3d1psZGx6SDVqSm1BOUxDQmw3NUdzU2kvT3hXdW8ySExh?=
 =?utf-8?B?cG1DbEhtK3g4cVV1bzFuZ1RZVnBKak53VEdiZ2cwZ1JIUS9DdURDUDYrOWFB?=
 =?utf-8?B?WW9FYVpoZUt4NW94a0svKzRJUGVsNVdzNWQzem5lOXVzNTZFRk9LZjM3V0Qr?=
 =?utf-8?B?U0FlOWhJaEdQYmVYdVFTNExoOXc0WTF3OVI0ZS9CTGpuN2FoYndtRG9UbHhp?=
 =?utf-8?B?S3RvWG5teHpJa1pTUy8rTHFNSlU4czlzOGlnUzg2dXAxZmxMNGJPTm0vVFR0?=
 =?utf-8?B?dFd1aW1jKzkzSDRSMllTT3o1WTF2NjNIbkpkMXAyRllPWWh2OWEwZmlIUW1l?=
 =?utf-8?B?cWJBdGU2cGlZaU1kVkJRRGw4cFF4YkpZSGY4WTUyU2pkdEsxWHExREFscGRi?=
 =?utf-8?B?YWZtSTF0Nll1a0NHUjlRWGVHTWhPeFQ4TnhiNXdGaUNMUTNvWHJaWGYyMFU5?=
 =?utf-8?B?aC9iNzFZTURIWm1jVWc3Y2hzbytPZWxXdXEwT1BwTmN2enBIcFlxYzFYM1Y3?=
 =?utf-8?B?MXJiUjlvRElIS0lUQ0RWV2F4eUVUVHhKZmlsWmtvQjdYK2l0TU0vMnl0S0JJ?=
 =?utf-8?B?YjU4MGJmNHZ5aE9ZQ0d3RXpkQjBTNGlQNUwxakFJamM5UVFlb3l4T3dLTVd4?=
 =?utf-8?B?UHdnMndTdkxNWG1TVnFYNnFHNTM1b1BtUHNxbkNoa2dTRi91T0RCdFVTYmtD?=
 =?utf-8?B?QnBSQUxGRXR2cUcyOGtneEpWWUE5TUQzbXpKSk9DUjJ4azVrY2UvNHF6UjNH?=
 =?utf-8?B?TXFVMXI0RklBM0o2YWJyRkFnemEzS1l2QkZqcUdkTUh5MndJZndoZGNPNWh2?=
 =?utf-8?B?ankzbW1iZVorRzk4RFVCNGdaaFZBaElwck5TWW91bk1FNUdXTDcrakJkem1H?=
 =?utf-8?B?WWk3UzdDb05hV3phTzVRU2ROcjc5bFJjd2RLNzUvdzk2NFJGL2gxcWsyWVoy?=
 =?utf-8?B?cG43SFpPV1E3T0FsaTBWalREUnlsOGxLYlR6TmdZSS90b09DMUM5aGhkWlRT?=
 =?utf-8?B?b01PRFNMSXZCRkRNQkF1TFdSdVNJRU00TDhzTkNldndaUE1HN2trYjVyT0pp?=
 =?utf-8?Q?pVJ51M0qa4QIMfdO0zD3HrA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e0f3f7-7f5b-4e0d-1346-08d998746ed5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 11:33:29.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eaoxt/psnUyGY7ZYaczs+M6ESVFATaLUhBNY/b48/vIHXB3DLFLhFR6UQF3jt887FPe6QDsVO/bdzMO6C/vuqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4140
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:22AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v2:
>  - remove casts that are (a) malformed and (b) unnecessary
>  - add new line for better readability
>  - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
>     functions are now completely gated with this config
>  - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/common/domain.c           |  3 ++
>  xen/drivers/passthrough/pci.c | 60 +++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c       | 14 +++++++-
>  xen/include/xen/pci.h         | 22 +++++++++++++
>  xen/include/xen/sched.h       |  8 +++++
>  5 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 40d67ec34232..e0170087612d 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -601,6 +601,9 @@ struct domain *domain_create(domid_t domid,
>  
>  #ifdef CONFIG_HAS_PCI
>      INIT_LIST_HEAD(&d->pdev_list);
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    INIT_LIST_HEAD(&d->vdev_list);
> +#endif
>  #endif
>  
>      /* All error paths can depend on the above setup. */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 805ab86ed555..5b963d75d1ba 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -831,6 +831,66 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      return ret;
>  }
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static struct vpci_dev *pci_find_virtual_device(const struct domain *d,
> +                                                const struct pci_dev *pdev)
> +{
> +    struct vpci_dev *vdev;
> +
> +    list_for_each_entry ( vdev, &d->vdev_list, list )
> +        if ( vdev->pdev == pdev )
> +            return vdev;
> +    return NULL;
> +}
> +
> +int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev)
> +{
> +    struct vpci_dev *vdev;
> +
> +    ASSERT(!pci_find_virtual_device(d, pdev));
> +
> +    /* Each PCI bus supports 32 devices/slots at max. */
> +    if ( d->vpci_dev_next > 31 )
> +        return -ENOSPC;
> +
> +    vdev = xzalloc(struct vpci_dev);
> +    if ( !vdev )
> +        return -ENOMEM;
> +
> +    /* We emulate a single host bridge for the guest, so segment is always 0. */
> +    vdev->seg = 0;
> +
> +    /*
> +     * The bus number is set to 0, so virtual devices are seen
> +     * as embedded endpoints behind the root complex.
> +     */
> +    vdev->bus = 0;
> +    vdev->devfn = PCI_DEVFN(d->vpci_dev_next++, 0);

This would likely be better as a bitmap where you set the bits of
in-use slots. Then you can use find_first_bit or similar to get a free
slot.

Long term you might want to allow the caller to provide a pre-selected
slot, as it's possible for users to request the device to appear at a
specific slot on the emulated bus.

> +
> +    vdev->pdev = pdev;
> +    vdev->domain = d;
> +
> +    pcidevs_lock();
> +    list_add_tail(&vdev->list, &d->vdev_list);
> +    pcidevs_unlock();
> +
> +    return 0;
> +}
> +
> +int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
> +{
> +    struct vpci_dev *vdev;
> +
> +    pcidevs_lock();
> +    vdev = pci_find_virtual_device(d, pdev);
> +    if ( vdev )
> +        list_del(&vdev->list);
> +    pcidevs_unlock();
> +    xfree(vdev);
> +    return 0;
> +}
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> +
>  /* Caller should hold the pcidevs_lock */
>  static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>                             uint8_t devfn)
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 702f7b5d5dda..d787f13e679e 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -91,20 +91,32 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>  /* Notify vPCI that device is assigned to guest. */
>  int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
>  {
> +    int rc;
> +
>      /* It only makes sense to assign for hwdom or guest domain. */
>      if ( is_system_domain(d) || !has_vpci(d) )
>          return 0;
>  
> -    return vpci_bar_add_handlers(d, dev);
> +    rc = vpci_bar_add_handlers(d, dev);
> +    if ( rc )
> +        return rc;
> +
> +    return pci_add_virtual_device(d, dev);
>  }
>  
>  /* Notify vPCI that device is de-assigned from guest. */
>  int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
>  {
> +    int rc;
> +
>      /* It only makes sense to de-assign from hwdom or guest domain. */
>      if ( is_system_domain(d) || !has_vpci(d) )
>          return 0;
>  
> +    rc = pci_remove_virtual_device(d, dev);
> +    if ( rc )
> +        return rc;
> +
>      return vpci_bar_remove_handlers(d, dev);
>  }
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 43b8a0817076..33033a3a8f8d 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -137,6 +137,24 @@ struct pci_dev {
>      struct vpci *vpci;
>  };
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +struct vpci_dev {
> +    struct list_head list;
> +    /* Physical PCI device this virtual device is connected to. */
> +    const struct pci_dev *pdev;
> +    /* Virtual SBDF of the device. */
> +    union {
> +        struct {
> +            uint8_t devfn;
> +            uint8_t bus;
> +            uint16_t seg;
> +        };
> +        pci_sbdf_t sbdf;
> +    };
> +    struct domain *domain;
> +};
> +#endif

I wonder whether this is strictly needed. Won't it be enough to store
the virtual (ie: guest) sbdf inside the existing vpci struct?

It would avoid the overhead of the translation you do from pdev ->
vdev, and there doesn't seem to be anything relevant stored in
vpci_dev apart from the virtual sbdf.

Thanks, Roger.

