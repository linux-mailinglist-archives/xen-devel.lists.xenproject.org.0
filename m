Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ABE58F123
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 19:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383747.618930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLp7T-0001UI-Mb; Wed, 10 Aug 2022 17:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383747.618930; Wed, 10 Aug 2022 17:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLp7T-0001Rk-Jr; Wed, 10 Aug 2022 17:03:47 +0000
Received: by outflank-mailman (input) for mailman id 383747;
 Wed, 10 Aug 2022 17:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLp7R-0001Re-8A
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 17:03:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 629a30b3-18ce-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 19:03:43 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 13:03:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 17:03:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 17:03:38 +0000
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
X-Inumbo-ID: 629a30b3-18ce-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660151023;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QgumIHl6F8csl+ZdYQl1PuQRY54TLt22Dug+yQjzVOw=;
  b=OtuPeNoz57yKB0nbPq8k/9hiDBowxV3NyG+1PWIqD4wL1aBbnfHN+MBh
   md8NWNjEj/fQNcjMWt00v0lBQvNFfOG8jPSD+ZZMAmw8y5DlnlrdUJMAJ
   B25Z46r1o6XPGwLzWqov/p7/Qr6Um7OSxszLD1GUBj04EZbNlBwFvbisd
   8=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 77803282
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:K7mmfaLlMytledfxFE+RyJQlxSXFcZb7ZxGr2PjKsXjdYENS0DRWn
 WYaUWrVP6neZmamKNFxbI3no0tTscWHzNEyQQFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La8Es11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE4Md1Ulw9GsoiwLhGWFBV5
 PJDKiFTR0XW7w626OrTpuhEoO0GdZGuFqVA/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H33j+mK2AwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPAmWLeqCL27gPJtX39V5I/LKWzzdtzsWGtm1BNVxRMeFTu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCy
 Vuhj97vQzt1v9WopWm1876VqXa4P3cTJGpbPSscF1Jdvp/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BApJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:y6wRUangxkHZcJ1pugpYqLOWRSnpDfMEiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdh11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtlqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWDHAcEcYa
 xT5fPnlbFrmGChHjbkV65UsYWRt0EIb1O7q445y5SoOnZt7StEJgAjtbEidz87he4Aot9/lq
 T52+1T5c9zpoV9V9MDOM4RBcSwEWDDWhTKLSabJknmDrgOPzbXp4fw+6hd3pDiRHUk9upEpH
 36aiIviUciP0b1TcGe1pxC9R7ABG27QDT208lbo5x0oKf1SrbnOTCKDAlGqbrqn9wPRsnAH/
 qjMpNfBPHuaWPoBIZSxgX7H51fM2MXXsEZsssyH1iOvsXIIIv3sfGzSoeaGJP9VTI/Hm/vCH
 oKWzb+YM1G80CwQ3f9xAPcXnv8E3aPia6Y0JKqitT75LJ9RrGk6DJl+GhRzvv7WgFqo+gxYF
 Z0Jq/hn+eyuXS2lFy4nVlUBg==
X-IronPort-AV: E=Sophos;i="5.93,227,1654574400"; 
   d="scan'208";a="77803282"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jl3BJZ1p/wPu3tMTvXJjl0flx43sq2VnBUdKJVLsukaHHW/Y0R6vf/X9xJ4UIaUyqkrSG7K8496oYIUpAFYwOIGLqZTK3GxK4vvIvWpS1v4yyotDAgNaEd24zbBqgtMv6QQbRKV53eBeYj9BRtBpuemhPHHvjCYnSgWc6JC7l9CbDR/470GEyt3SoBaOHV5pNBJHepYfDxlcj1KnFHrMhq/bsG+I8J6BGPUvO9XEnfewtNbN7/gDlFA2vCVeJNSK73JEbpIv20livNI4ajXdNBIytjlhQHMiKiG6xvB8kTZSyjxJu4i+W4f2iI3ndgM4z1sfXDuloQhCwJZ8lUxYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgumIHl6F8csl+ZdYQl1PuQRY54TLt22Dug+yQjzVOw=;
 b=IUxeV4BuKmpSVfz6kT6ZX3mOYs7gPnvnqAxI1FtAjO4YBNoF5F5/KqNr5z91qxCu5zIR92l2W5w21Bf1fwiGsuOeKJlRDgBw31YfBG34Aa7+vbX+nn9zDcvSE9Dlvm9GUyUjJu3BbC47zHQA9z1I9YnKfrwF4s8S2uvrZxrqRWx9/hGPpznlejs05CyipqVD5WnipDETCWzq338ALveSfeHfcdhBIAWN9X25DdUWCKYMfEfHVnBINxqzuz56AZCoREu2YeRbK3b/0b6WRdYHNNdIlfauiLZ1AKNbFnd0tpgadFB/tC/OKn+edHeRdRMqVtypskCrfS2kL3fTv+xSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgumIHl6F8csl+ZdYQl1PuQRY54TLt22Dug+yQjzVOw=;
 b=vdboSdMFsPQwM28moJk+BJxY0PC/pLW1ssouRaTrOLWOOuj30nL3mixRsUh2iNCFdwIuvRjYZDWthuB6XmVQA7htzRhv2/A3NSzD7m4wFfnpuetwVjaQOaXgOgGiY9aF4YkwmzYV7aVKv8zRMN6JmYih1uANUdlpscfIoRHbd4s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 02/11] x86emul: handle AVX512-FP16 insns encoded in 0f3a
 opcode map
Thread-Topic: [PATCH 02/11] x86emul: handle AVX512-FP16 insns encoded in 0f3a
 opcode map
Thread-Index: AQHYgKKgfUHb/QlOR0ydMqlnSzGqYK2otP6A
Date: Wed, 10 Aug 2022 17:03:38 +0000
Message-ID: <b5040452-8b25-0363-25dd-b0fb67291a4b@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <b922b255-f8c6-725d-2290-2749c614fde0@suse.com>
In-Reply-To: <b922b255-f8c6-725d-2290-2749c614fde0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d51883b-c0e3-43fa-b884-08da7af244c8
x-ms-traffictypediagnostic: MN2PR03MB5312:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gAPuZNDrmTyMBpX+XF8WI8HxJ4gNM0ilvuZb74rJF7TSdh7qIELC4m27uiJfPCQITsat0D5W6rIlHemWQlEOCWSAGCtoCqiveVTTf5ABIyfR59a1su0DnkRZr13vsn+XFvU8F1lTXvAVVi8Mmv7rEPpVFXKLADlyW8OtRUky9sY/nlHjUWdZ5lsGkabzd6wWfm5w38s2bNa5ZqITk2S5TxiUUmXDxNxxzYtg0Ixqq71mYzyYerK0bddZmOst3EWYWMuU+ZSYcv9kokYo4qtFJtwuWEdHE2SJOmkido7wy4CV3BP3MbPXaLSoDv7ttReaOLsTLlIgHWuIi00FsGp6r2beGYTEfYJIUMCKMNpwluvQeRWU5XvUW7szvM7RuLchXPB9r8fY9kzOyZ3niukSTTCjXoEILcYxj/H4J7eZIb8j4UHmGJCogi7gXSfdHw5sJeww4fX8sTHZe+ysl1XZaaDbWhsQceSl58hnIlfqgsX3yvjCZIe+ajGMoF0ryhYv4N+PNXomZpfuiHCzl8VcT6JcEhLTFi+SNVmPFYkBSl2Ym//xtyiKwWTpUXnTJdHKTEnUL2huvFE52s8OgeZj6+r9lOE2pBQYpGKROqNsitgsEKWHTmlSzBLjhEDOJ/R82pgJgMGEK/0WNZtsPJk0e2fVOtUgtvJ6oKAsYT7MpG/kQ3Nz2Ry6oicCj649vcuSZ4iCN1iV7kzkIdRQJVQ9ywKVDdtM6pDPBi//YEk0BEDM/hbHA4+eG8nod5W58ma4ZF3EAn396CMbRON7e4VrwDiQIApKAAEeRKLORxbTbIwXgc5TEHsSEyld26GCqzdh9L+4Pogkelzvn9rmcg41nxTJ0n0SCRQY2vACs1xuGaJMfmuDa8KIb4fC390Ixo53
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(83380400001)(478600001)(6486002)(8936002)(6512007)(2906002)(26005)(186003)(53546011)(6506007)(38100700002)(41300700001)(31696002)(5660300002)(107886003)(2616005)(316002)(86362001)(31686004)(122000001)(36756003)(66476007)(66946007)(54906003)(38070700005)(110136005)(66556008)(64756008)(66446008)(76116006)(91956017)(82960400001)(4326008)(71200400001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SlNuc1ZBcXhCbnpKYTYwZXFMT1pMTVFkdHZaUndMbFN3KzQzZEZCMERXL1ls?=
 =?utf-8?B?WGdFVzNicnpTT1FTWG1GZ0lyNUxlMnZzVy9zUW1UTkh4RlJHeXRWTzROL0pH?=
 =?utf-8?B?Q2NocVhOQUpmMDI3ZWgzZVBtVllxMld6SU54QzN3ZWxOWUU3aVhSbTJ2STJz?=
 =?utf-8?B?bWNQcGZBOWhrYnBEaDZicCtlZm1uUFVNNS9XY29vYTN5T2pWVjhJNWtmUlVG?=
 =?utf-8?B?SURrQ2RyWGd1V0swVkRrYm5rSnZQODhiZ3ZjTUI5NEhoalJsZjllcjRwZWlN?=
 =?utf-8?B?RVRKUmZnWS9laGM3MllWc0NaUXdDbXh6S3MvMWphMFdCTUxZbU9IN1lkOCt5?=
 =?utf-8?B?V3AyZjZQOHlNZDR5Vk90eFNNYmxhbFhuSExWc1krdkdUK0pCS2pwQi8xcmp4?=
 =?utf-8?B?TWRwRGxJQUMxSHBheW1WeXIvZEtxRm5KZnNLZmgwclprMXdoWW1oajJ5QWsw?=
 =?utf-8?B?SzF5U3B1d3FHU2drWW4xZk1kTmordzhKaWsxN1U5alAvYUtJNUhGNzNSMkNw?=
 =?utf-8?B?UmtKaHFlZm9FUEhSRXA2TVhvTG11aE1KODVrcTljOS9kQXgzSkU3Wnh6Nmo2?=
 =?utf-8?B?UlNEdFNjbjRvRU9uNVNzOUl4NjZsK1VqN0Evb1lLajVRZTI0dVZJOEhJSlZz?=
 =?utf-8?B?SVc0SEI5dGJ3dkFYUnp4ZE9rYUg3bDJtR1F0NloxbUdyNFFvaWJ5amJ3bm10?=
 =?utf-8?B?b05YcmN2ZGpuc3F5T2tITEVBcmo4Q1FDNVUreXYzd0JrVnVZMUxmcGFHNjZs?=
 =?utf-8?B?bWUvRFlQM0MxVmZYMysxZXdpVFhHczJaSmxydWMxcVRmQ0ZmTjBLcG02UzB2?=
 =?utf-8?B?NlRyT294S2NqSEtQMFlTVjNSV2tVL0tmN0JGL2orS1lrYWZTTnVTODlreFNy?=
 =?utf-8?B?S0F3YjM0NExPUlVRcXp2OGxpR3p6OU9lcm1tYmVHN3FDVTdIVzNOcDNQWnhI?=
 =?utf-8?B?a0l2blZYM0srbExyVDcvNkd5OXRBTzZPdEs4dllQc3dUam11dE1WdHJ0RlVM?=
 =?utf-8?B?N3dhZW95WFc4clB3Wkt4cWMyVVJpb1hLblJwT1phQitUOU1TODJER1ZxQmpZ?=
 =?utf-8?B?dUtNc0NBUm5GYUI4UkRYODhwM00xSFpQTWNzMmJLMVhzY3J6RTErMmdlZmVS?=
 =?utf-8?B?OGo0Qk9tTmVvQ1Z5QXdLb1FDOCtlMVdNVzRVZ0ZuRHprRXp6Z0pMenRrK2x0?=
 =?utf-8?B?WFBMTitySlRCdUt1U242Ry9aWVBHVDZpWXM3WE9PNWJ4WW1sbXZJMnNRV3Bu?=
 =?utf-8?B?UmVaN3Z1TXBoWkVEUHk1TTZkV1hBaUVVNXdFVHQ2bWNNMzF6VnA5TFNVS2Zl?=
 =?utf-8?B?NW93eUtqMXpsMUY3NTdQUGNTU0VhTjZMNTdYSTNtZVV4cVFrNWVtOHRZTVdP?=
 =?utf-8?B?NXVuZzlpQmh2YVlEdFQvMXF2SmNzYlllcFRMRWJOcE1Dck5vM0t1VkNDaWVh?=
 =?utf-8?B?cWo0bnc3WGk5VzNHcm1nMDNYT0ZTUFArYWxkL2UyK2U5Q01waHpEdm9XekM2?=
 =?utf-8?B?bHhKdDc0YUFWaTJTenF1LzZkd1FJZTFNTDBXL1Axb2pUeExxR0Y1UGpXWFJE?=
 =?utf-8?B?WGZMdlVQSi9WN0hhRSs3Z3FuSldGNUZaRE9zSHA0M1lsOXE4OHVnaEMrcnNU?=
 =?utf-8?B?RjMyYVlZa0V4aDJsOHFpNTh2aWMzOXMzdC9wdjBZc3Vnc2pWZE5Bc2Q1VFRD?=
 =?utf-8?B?eWJ0bFEzdFljNU0yeHF4ZWtwVW5IOTFEci9EWmIrdU8xcWZTenREQmlJRjdX?=
 =?utf-8?B?cTcwSWRwNjlsa0tyK00yRUwvSFhlVThrZitjYklGbWpYOGRMRnNPQ0JhaGZq?=
 =?utf-8?B?RXdJRXpXYnRIOFBNeXFVY1VaQ0dXUnpJM0VPSURqSENxaFlkNW5oQXdzZGly?=
 =?utf-8?B?WVlUT0hyUU1XVnFRNVJzNUUrSTE1UUhyTjZtbVg5MzB5MU52eEFUMm02eERv?=
 =?utf-8?B?SnRUekIvUGZLNnlVNHZCbituV1NVbXE2MjhuN0FNamtaSkRqSVZGYUE1Z2cr?=
 =?utf-8?B?V2dkWFU0NDdnMmo0UW9nUVBlSytabXhvUU9HYW5Tbi9odm5Gdll6dTVpcVZG?=
 =?utf-8?B?UXdsVHpnbXhFWFh0NkVFZEFBZXlWSFhzRlREQXZxR2x3N0FqVEJaQXdyNmwv?=
 =?utf-8?Q?hM8aSgkzFgdssY3XGAmsl+0U7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32226EFD2751714BA2C39CF292131540@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	InRu8UJ1pSlJlx4PyQyoqmzWBou6+VuIi9+Kl2ZrRR715I6LaT8qpllmjPfW0Nn6zEqRc1b+m3bOuS2oTOFy1qt7qFDcZTzNhG9U4yvHr8v609tBCUiv5HkqM9a6JOUbwb7DFAUN5a2NjYvtmSwBC8lVDq7r9HAkfVFRdoiZaIsUf8c9RqB4K9lu/gCa9/6ju5H5/Q5wd+E9lzccekIjJY6ibnjFRGY8ErmrFBc86Oa2Ca/7u4dMkx0CSgYX2WzngxJtKicKfRDr3HLwNV+ElcJUy6/CmWmm636qvAbPuZutN+ReH8g0wJWTYxfBW+ov7k6UTg9XRNPhAM/iRMee0VI3FF7phirYRV33TWiagSjLIZpuALvBjrFewKqlDu7Tx5nV+6F5XK7JSk2AD0FbCEc2FT9w2lAH/m0jnJGrgzwL3sm9A8+R4OoRkZED2h2Z8gdING3JRHbSXVjAJnyqgfQwfFv2j9Vn0DffJMZqzkDnsu+mcm4TCGUu+pi5iEzR8reJsDDqC3tYMF028QQ3VYy6YF9358nMyis+1w/eNs6A8yUt9UfOU0R09bMA1/44ZGzCeEOfGiCA+wTQH9dODj615DAvrjxH3C1lJ5hjoo3VUgR7MyLCqd9xA5SZiL76uxg1LV8YQnqVcoepGDzpV3RZ2Q1ymTlFgUESQw4i0z1usVul/xjYXcH6gtU3QiNY/xt8o/H9iUNOl0JRowoTwAKdKzJ7/MpLD6qg0TPIuwsiT2rwbicXvt7zT2Z6dw8/sZNqmYg4SvDb3sV8ZKTiFESJi+slQwxl6VmfNGWZIQOehsSQi053+O7gPyBkmhw0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d51883b-c0e3-43fa-b884-08da7af244c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 17:03:38.0400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDw1GEAUWxkxdK4FTDwPqX84tVhaGrEr7ioNTWyauoqQPjeYq7AxGMktqCDOr5wEj2y4QnvOdjcExDCm6bRyPMoGmVLcLlRu4r/vEErrsSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312

T24gMTUvMDYvMjAyMiAxMToyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEluIG9yZGVyIHRvIHJl
LXVzZSAoYWxzbyBpbiBzdWJzZXF1ZW50IHBhdGNoZXMpIGV4aXN0aW5nIGNvZGUgYW5kIHRhYmxl
cw0KPiBhcyBtdWNoIGFzIHBvc3NpYmxlLCBzaW1wbHkgaW50cm9kdWNlIGEgbmV3IGJvb2xlYW4g
ZmllbGQgaW4gZW11bGF0b3INCj4gc3RhdGUgaW5kaWNhdGluZyB3aGV0aGVyIGFuIGluc24gaXMg
b25lIHdpdGggYSBoYWxmLXByZWNpc2lvbiBzb3VyY2UuDQo+IEV2ZXJ5dGhpbmcgZWxzZSB0aGVu
IGZvbGxvd3MgIm5hdHVyYWxseSIuDQoNClRoaXMgaXMgc2xpZ2h0bHkgbWlzbGVhZGluZy7CoCBX
aGF0IHlvdSBtZWFuIGlzIGl0IGhhcyBhbiBGUDE2IHNvdXJjZSwgSQ0KdGhpbms/DQoNClRoZXJl
IGFyZSBub24tRlAxNiBpbnN0cnVjdGlvbnMgd2hpY2ggaGF2ZSBoYWxmLXByZWNpc2lvbiBpbnB1
dHMsIGxpa2UNCnRoZSBGMTZDIGdyb3VwLg0KDQo+IC0tLSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVs
YXRvci94ODYtZW11bGF0ZS5oDQo+ICsrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci94ODYt
ZW11bGF0ZS5oDQo+IEBAIC0xODIsNiArMTgyLDcgQEAgdm9pZCB3cnBrcnUodW5zaWduZWQgaW50
IHZhbCk7DQo+ICAjZGVmaW5lIGNwdV9oYXNfYXZ4NTEyXzRmbWFwcyAoY3AuZmVhdC5hdng1MTJf
NGZtYXBzICYmIHhjcjBfbWFzaygweGU2KSkNCj4gICNkZWZpbmUgY3B1X2hhc19hdng1MTJfdnAy
aW50ZXJzZWN0IChjcC5mZWF0LmF2eDUxMl92cDJpbnRlcnNlY3QgJiYgeGNyMF9tYXNrKDB4ZTYp
KQ0KPiAgI2RlZmluZSBjcHVfaGFzX3NlcmlhbGl6ZSAgY3AuZmVhdC5zZXJpYWxpemUNCj4gKyNk
ZWZpbmUgY3B1X2hhc19hdng1MTJfZnAxNiAoY3AuZmVhdC5hdng1MTJfZnAxNiAmJiB4Y3IwX21h
c2soMHhlNikpDQo+ICAjZGVmaW5lIGNwdV9oYXNfYXZ4X3ZubmkgICAoY3AuZmVhdC5hdnhfdm5u
aSAmJiB4Y3IwX21hc2soNikpDQo+ICAjZGVmaW5lIGNwdV9oYXNfYXZ4NTEyX2JmMTYgKGNwLmZl
YXQuYXZ4NTEyX2JmMTYgJiYgeGNyMF9tYXNrKDB4ZTYpKQ0KPiAgDQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni94ODZfZW11bGF0ZS9kZWNvZGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxh
dGUvZGVjb2RlLmMNCj4gQEAgLTUxOCw2ICs1MTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGV4
dDBmM2FfdGFibGUgew0KPiAgICAgIFsweDdhIC4uLiAweDdiXSA9IHsgLnNpbWRfc2l6ZSA9IHNp
bWRfc2NhbGFyX29wYywgLmZvdXJfb3AgPSAxIH0sDQo+ICAgICAgWzB4N2MgLi4uIDB4N2RdID0g
eyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfZnAsIC5mb3VyX29wID0gMSB9LA0KPiAgICAgIFsw
eDdlIC4uLiAweDdmXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfc2NhbGFyX29wYywgLmZvdXJfb3Ag
PSAxIH0sDQo+ICsgICAgWzB4YzJdID0geyAuc2ltZF9zaXplID0gc2ltZF9hbnlfZnAsIC5kOHMg
PSBkOHNfdmwgfSwNCg0KVGhpcyBpcyBhIG5ldyBpbnN0cnVjdGlvbiwgaXNuJ3QgaXQ/DQoNCn5B
bmRyZXcNCg==

