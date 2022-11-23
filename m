Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA29636459
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 16:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447637.704133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrws-0001jG-Jl; Wed, 23 Nov 2022 15:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447637.704133; Wed, 23 Nov 2022 15:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrws-0001fw-F1; Wed, 23 Nov 2022 15:46:06 +0000
Received: by outflank-mailman (input) for mailman id 447637;
 Wed, 23 Nov 2022 15:46:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nECt=3X=citrix.com=prvs=319181206=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oxrwq-0008Tc-NP
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 15:46:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eebdf757-6b45-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 16:46:03 +0100 (CET)
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Nov 2022 10:46:01 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6935.namprd03.prod.outlook.com (2603:10b6:8:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 15:45:59 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 15:45:59 +0000
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
X-Inumbo-ID: eebdf757-6b45-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669218363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3IEGhNz5bpGOjKYHnrL7h9RWohXg8ACWsyu0F4mMgf0=;
  b=IyhSSVruvP/cmQVjwwIZpmzg5A8dSEzUo+YrnrVCok9RYYXYsVkH17XE
   2wsRDQ5h/HAUjMf+Y87AT0Gt1WtKGhYL1Zqv3kcrSBVPVLyvY823tRkXh
   2/MyLiJIqluCnqz992vcJyC+Nt/M7JACIp35bpTZVVkXuEJDaxmU2e7No
   E=;
X-IronPort-RemoteIP: 104.47.73.169
X-IronPort-MID: 85425922
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JdHIzq80Ok4JnDvsyf2uDrUDRn+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jQbWDuPOayDM2SheoolOtu390gFv5CBnIdqQAI6/308E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKoQ5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkly8
 8w3ExUGcCqpvO2V7qLqc8dcvsUKeZyD0IM34hmMzBn/JNN+HdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeIilUvgdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+SwXmmCdhIfFG+3uRFnACW5Gs9MjoHalKArb7mu2y4UPsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZEYcYjvdU7RhQr0
 EGIhNLjATFzsLyTRmmZ/73SpjS3UQAXJ2IfYS4PTSMe/sLu5oo0i3rnUdJLAKOzyNrvFlnNL
 yuiqSE/g/AWkpQN3qDjoVTf2Wvy997OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRdlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:24ZmTaon2uJ4EcdT7KsYgqgaV5tLLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwI080kqQFm7X5XI3SJzUO3VHFEGgM1/qH/9SNIU3DH6tmpN
 5dmstFeaLN5CZB/KHHCWCDer5PoeVvsprY/ds2p00dMT2CAJsQijuRZDzrcXGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyqIiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/L8Zan4pWfjbQ9kJl5bhHoe
 p29lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nteIIlXRQXaYXdbcUh40C+0F+FosGAUvBmckaOd
 grKPuZyOddcFucYXyclm5zwOa0VnB2JRuCSlhqgL3h7xFm2FRCi2cIzs0WmXkNsLgnTYNf2u
 jCOqN00JlTU84/d8tGdak8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hwzP22eaYP0IA5lP
 36IRxlXFYJCgLT4PC1rd52GkinehT+Yd2t8LAT23FBgMy8eFKxWhfzDWzHkKOb0oci64PgKr
 KO0altco/exFvVaPh0NjLFKuhvwAElIasoU/YAKiazS5HwW/rXn92eVsrvD5zQNhthcl/DIx
 I4LUvOzYN7nw2WZkM=
X-IronPort-AV: E=Sophos;i="5.96,187,1665460800"; 
   d="scan'208";a="85425922"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKIpnEm50ROSlVG1uvI1R6yYmCbxqTGKv9wMFaqDoQXQUMPAjTi1JJCmD4KpSWOhWNL2TOceCcZLCInOgIpOXdYfwArAWEsbTBc+aHsOlgYkdwlm3/kfLcYuHNmAYJYYlVB3o02Dn/+WLsNKtcVqhm1Aq1uC8NCYeT2tnrJ7o92OiGn/SnCirZlUt04r4qPjO95EHpyFeUROTObpjIvyiIr5Anx0AOvUyFMSOOh/twQ5twwWcDSSwoYnLbxZXf9C8GE4+Yii6dOroANZo48mC599G0zGWae9OeY2ZM8uUO2TT47LNINF6I3Y0PhMV4GSnWGsbyz8q+EQiAI5CDAURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf502VoX9A12guSHyYKYXI0C23cUCFbnzBqkpMCisdc=;
 b=h6+imtFpwGnKWpECzLSNgYAxzU2uj4RU9Qb9z6u/WQjpyquQGn4oEdX4XsKuGkO2JsGIvOzhhAT6pd1sWzhkiqOsBnfPvUcP579Ggh/O1AJEFHfU1wg48PMa5jeZuGO43kWab+Brz0jZhyfQRmJZ+8IviV7HPRtGd28rcXNbOsb0q421ooIWR6Kff56WF4fV86ZBRO/zzbcbDmMjT1FokRoI64OyEG2GevAFTsTbzIQTl0kKspspfX6ZyNzSNE5zMG4FMgDfmlS2RdDNVrT81XtmyTWl0xhavSAa9+1R+uCLxAtplT+d3dypD+Mp/qFv328gbM9/LUJ33bdt0opuKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zf502VoX9A12guSHyYKYXI0C23cUCFbnzBqkpMCisdc=;
 b=nff6HDhegQ1LG3mE6aisggn0FX8/1VLBsHanuIvPozrBqBZifNftqYA8AswJpEZNR9E1G2JMZ7abE/AN7+ryf/S7gsu1fv8xZVt/f6sSgupHkq3fdn6PtJNGtSMxPODG7eng6OR5qcBKX8q618n3lGztnBRI1Ojfnezrko2olrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] multiboot2: parse vga= option when setting GOP mode
Date: Wed, 23 Nov 2022 16:45:24 +0100
Message-Id: <20221123154525.63068-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123154525.63068-1-roger.pau@citrix.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::11) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f55f998-2f0c-4c8c-549d-08dacd69d16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pc/m6AVaAeLOVtlPo+XXo6PnlyorZPyRwKgMys9jx3iwT+5NkTh3FcX0bgYo5wyZ67lBPiFkZbmmmKQaZjGmmmuXlEhVXM82zIBIjpxS+dGgjbTLrfbbIUEIc93FfXtNHRsLj9FQ3cVKf+X/ktudvhyqgZjdyvQRiMqnvqgGs6eOextFXVxdZ15XTeq9shZpTcboZB8UFEMpFn+WXQs3zXzxaDcPyNEsXgqo8vl44k6a0ohzrO8qPBXKCG6GdEINfeqAfQbFe9PrmvLbQNMzpC9ZvTRCz+pnznu+OSZXy95nrD81aOy/Dd1Q0DIeQlTPyDty9fdflWRUlIvzTR+uUeppS4DgUJFJ66HJ6RflzRk2G0MZdwxV8CPKSyJvj7nBkhRY5Zb7ShfAI4ZJEqD2c9MzhhJskbGLdwJIouwAViM5dSl2HDNikmI/ghv1JV/MhfsmEOejzIJWJEYFugXi2xBMLYP9ECGu25Ak29duVlaFcaf1sjyUMkd/8NOtmpbDb96/txnLDXAkKN/6Jtp/+U8V4nQu8rnufoUO8If7KJ9yHWmbg2OZpeSjhZOgdZYtbMKrBmc+xb2JNuA2BWv59XIcJ5SeCiy8M+4AbE9N66YaFD2Ikl8os6+sbC6MkiZ/oDHhHoCmkLLm6+FlfXP9EA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(36756003)(86362001)(41300700001)(66556008)(66946007)(316002)(66476007)(4326008)(8676002)(82960400001)(38100700002)(6486002)(83380400001)(54906003)(6916009)(478600001)(186003)(2906002)(5660300002)(8936002)(6506007)(2616005)(1076003)(26005)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WktXeDNlbElDRmxoZmovZk1manRFaEZXTEpTd2pLL3V5MW51Q2ZQV2lLdkRE?=
 =?utf-8?B?ZGRVUU1LWU5zMG1ydElwVVF6Q1gzRTA5SUF5TDFFdHVVTnRoUjUwK0d0RTV5?=
 =?utf-8?B?NjNseC9GdUgxYlpjWGh3RzZoNWtRN2NGSlNZeFo5bW5WZmtGQVVDTVJIK1BV?=
 =?utf-8?B?eExpUGhaRFVWY011YWVMSnZTZDJ4VnMyKzZwVjhZWmlhNkpxRlEwWTlXTTBL?=
 =?utf-8?B?R2diNUFiNUs2MlIydGYwNUdGZk5LK2FHYjNUdjlFVlIrZSt5Q1dUZkNFMDVT?=
 =?utf-8?B?WEFnYUxBWlcwcnNPS2xhNXMwYVpLTTRGSjVBTHV3R2svdm56NHp5S2Q4VmFH?=
 =?utf-8?B?bzhSSDRvMUZEV2NRWngxZ2poSzl4WStaamFabDl3ZFlYYlhyMnNZOXdvWk01?=
 =?utf-8?B?VTROR3BreWpEQndVY1pwMG1GUGs1aDRzN2t0elF2ZjlzNUlidHFDM3YvM0dO?=
 =?utf-8?B?OUtNMDAyaXRYaHlBZkFvb084NE5lZVpNMlpsRUVQNVlwRzVycWQ3WHlxaGFp?=
 =?utf-8?B?TWhRaFExeHR6bGt6Wm5GWlVsNlVISCtoR1J0QUFZcEZMN2JEQUFGTFBOQnF5?=
 =?utf-8?B?WjZ5SGhqWXk2K1djUmhoc2k2VG40UkJOOEtva3JVanBxbVQ1Si81M2lYSlM2?=
 =?utf-8?B?QVN6QkdSOFk4enk5YjJBdXNMRW5EN3NMQmdVTEMxaElGMkRoNGJwQzRNQ3FS?=
 =?utf-8?B?bUhvQnVYaEJnWGduVWhnKzhZY21hVTNyT2J1NWxhQWdtbEpKbHBPK0wxN29m?=
 =?utf-8?B?RzNVUDNXQURWMDdGN25KdHdsWDE3QjZDUnIzRUV0dE1pb3dTaGNVZkozMU1F?=
 =?utf-8?B?Slp6YUt5YS9pY2lJSSt6a09WcEN4QTlXUkJhbmFBbGZxWjRoZkU1aGNkTFZN?=
 =?utf-8?B?c1czc0JjZnBqTjAySmwzcCtKdG9OWmdvYlA2eVYwNDFLaytlR2tNcWpDTzZG?=
 =?utf-8?B?ZG1IYmpFUFRyWnVCMHAybmJkV2xEejZmZURmV0lCdXpyaXQrRDBkaXVnT0Fu?=
 =?utf-8?B?T3o2ZU5RZDdxUDltbmtIcW5kR24zMkQ0UDJBL01hUXNOSElEemY5aU1aZ3BW?=
 =?utf-8?B?c1JDV3lqb2V4b3l5WVpkK0crenZ0RVBIVi81elNuaTA5cFViN0V1WUR2Ujkx?=
 =?utf-8?B?VTYrK2t1Y29lS2ZNMU9RMFFMaHdseEhyRTA1ZTk5dGV4L0xKcGxqZVFZaDdI?=
 =?utf-8?B?VlFwaHFUMDhxOHJMMk5KUmkzT3dlQlZyRDFGZzZsb2lCZDdDUFIvRlhDYXpy?=
 =?utf-8?B?QXkwQjRiN0NFbFNOdFZWaDhBQW5yWkRoQzhkakppLzlXNy82M2RlVGhYYXBm?=
 =?utf-8?B?SGl1RXpyVmJWSUd4NU9tTDJ1c2hiRjZ3cllvUUdPN1Y5KzZXV0cxdkw3NStT?=
 =?utf-8?B?VGUzZHNKcVlqNlFveDVzL3R0WmJkemp4OUtkNFpFUTdPUG1NNStwK2pPVHc0?=
 =?utf-8?B?T052WXZ0UDRCQVhZWG1KVTg0eDZHTEJOUDZ0dUprRFh2bHhzRjdWdFZsbmcx?=
 =?utf-8?B?MlRkemlWM2R5OGkzQzJlenF4cEZuR0dqM29nUVUwYlBhUk5tZWduZ1V1enNj?=
 =?utf-8?B?TUwrQitBYjRNOGZFbWNRZFlPRG9hWXRJRmtiQWc5VXltRHMxaDI3VFlSRWVr?=
 =?utf-8?B?czlNM2VJdnVZRHdSY2NzWXovVTNETlhieDNxUzNuYWZMdHlaK2ZSYXZCckdB?=
 =?utf-8?B?cWljYUtSZXRJLzJobTYvc0ZCYzlHYmxNa0NGVUdkSlQzQld6OTU3aXBmWTlT?=
 =?utf-8?B?eDlEZThVT2ljbXJlM2NvVU82Mjl2dzZyOUE0WnlPcW1xdTU5cUZ3NlVheWdz?=
 =?utf-8?B?TU5QaWVQYzJRZnNhREVRVm1tMnBVNjFMQ3ZoWk9YeFJkeVJyYUZTemxwRU1I?=
 =?utf-8?B?T1RYbHkwd1h4a3RCb1NjYXRtM290WTkrRnRZS1FBNXRrTytSUjRjbldyRkVW?=
 =?utf-8?B?dXM5U1hxdHQzVGZ5UWtqdDdIUGRyakltNE02MUJOMUFLTytneE5xczFoYlpW?=
 =?utf-8?B?OGZBSm4xeDBSK1ZSQjNFZHNycG5kb25pRUNxMkRRQ21kaFFZeEVBSVdZQ213?=
 =?utf-8?B?dmd0RVFnbzNiN2p1aVFuUVZBSWVNa0xEdUF0NmFPbFBUWlFOQm0rWDdEL1o3?=
 =?utf-8?Q?XFu84tIjbeQTTQi3foOSGNUMS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TvjOtGy14rGVM4fR29dJUdJeO7FT4bSPa3MegItj5/K9Nih5T2pbvFY0viMdjqkt1EkBQ7zMwV2S1FsHn1sM0UcRlQHBWrod+pFbPhht4UoyA4X78qQ4twPVFZrsx2CkzSb/l1tycY0zl9KN3tpBqS76EityR9ZHnaqrxjarG5wOQSCbCHMXv7zdKlCdEG+nC07uv5EJ2MQ1MiByRxBempIxtBHsltTgT3Yk6ie7kP5H+aR6r5LvZiWeo7Schx0CcmoIpfwHVvEeX44NHE1eo47Pco2bNTKCdloLf6YeSoK7bDOgWG7s827HaJZochue9eqWrGFOhTHQ/ggvnjdZG0mO9vUM5BGeLEDI4GLdzacWNyj7XEOeDRQa4+BAfc9A7HCmJ4Yh8hd8OqQEfGpXkDJcBCXTIh+zYZCRqkRhJikBuI8I5Bh6yHmjNofOoT9lfPVXXdWL7DoYPiez4PTDpn3E/nZ0xTPrE9oOuLFzW6ygp89qykXN62ArUS9hCk1xGez2kGqvl0ZO3YBAdJ6YUrM/5k6JBiqAEyAoHkffXy4J02p5+EpcC4oLDUypzFEb40HLLs4olNkvR9YFBGWq5DZOye5waaQcU8LL4/iXPx8RsmDi7ebwVdRuhRS4YiB/MJtT1+HaNR5r9z3vkClvN3q4tsv+KwRnLB5t/yGhlQzzYkY+cS8VUQAHLLuxYCwTPuspSLqZVzYwXXJUbfKDQIeggzu/s/3LmZxjtUUBdGAPbtDl8+dgYTUQrvUN07Nn2O3cMxYwQ/gQwe15rJa3U9gBu8eQYtUaO/nEYmDxnDEIf0nYoMDF5HmmK9F89IXylZK3PLPUzJHvNlVWGKabC6RCtFLSfl+ShGeya/gPTKd7Oq7Y1H9gJq9M9Vp0btSv
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f55f998-2f0c-4c8c-549d-08dacd69d16b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:45:59.7578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6JO6RirB05AEEtXe1ZZPPuK8ZycnEVdTbZfHdhPBXhh5JwSWk3G6Sz8CPHv9lresc0JqpRb6Y4d+oZqVtiwaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6935

Currently the vga command line gfx- option is ignored when booted
using multboot2 and EFI, as the setting of the GOP mode is done way
before the command line is processed.

Add support for parsing the vga gfx- selection if present in order to
set the selected GOP mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/efi/efi-boot.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 695491a5b7..e791d65213 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -835,7 +835,22 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
 
         if ( vga )
         {
-            gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
+            unsigned int width = 0, height = 0, depth = 0;
+
+            opt = get_option(cmdline, "vga=gfx-");
+            if ( opt )
+            {
+                width = simple_strtoul(opt, &opt, 10);
+                if ( *opt == 'x' )
+                    height = simple_strtoul(opt + 1, &opt, 10);
+                if ( *opt == 'x' )
+                    depth = simple_strtoul(opt + 1, &opt, 10);
+                /* Allow depth to be 0 or unset. */
+                if ( !width || !height )
+                    width = height = depth = 0;
+            }
+
+            gop_mode = efi_find_gop_mode(gop, width, height, depth);
         }
 
         efi_arch_edid(gop_handle);
-- 
2.37.3


