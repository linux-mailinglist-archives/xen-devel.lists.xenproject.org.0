Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F6E53374D
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 09:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336878.561310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlKq-0003Lf-UR; Wed, 25 May 2022 07:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336878.561310; Wed, 25 May 2022 07:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlKq-0003KK-Pd; Wed, 25 May 2022 07:21:36 +0000
Received: by outflank-mailman (input) for mailman id 336878;
 Wed, 25 May 2022 07:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7Hr=WB=citrix.com=prvs=137588b7b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntlKo-0003KE-MW
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 07:21:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c80b25a-dbfb-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 09:21:32 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 03:21:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DS7PR03MB5574.namprd03.prod.outlook.com (2603:10b6:5:2c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 07:21:10 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 07:21:10 +0000
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
X-Inumbo-ID: 4c80b25a-dbfb-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653463292;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QQnsyEN8QuvHi/UPd5m0NCTZVJEsdvY2UEljIOmbMXM=;
  b=cSs7Tjq9NN6f/1jcUiwpJ5SCQliHPOlzjQ2MukZ/xHM3g5cO90DXh3WX
   lG/M6NOjTmUqBtSy2YfJBJZ1CFOUdOTGpXMDCasM8Ou+Oht7NQQH/jLxy
   B6zoB3JP4yWGf14koh3Q+wxRsdu7T6TUym8Uy1ZLxWmp7wdj/lB545k4Z
   0=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 72129261
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zg0u56JmJDkJHkdtFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENS02RSz
 GoXDWCHPvaKMGr8etsjOoqy9ENQvJGAzoAxHAdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Q12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IVsu4WLaFgKBPHVk7UWfj9mARFSMKITrdcrIVDn2SCS52vvViK1ht5JVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM6FGvqWjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SOmKWwC9gv9Sawf3U/5zxQh85rXNcuOQPqxXddplHTfj
 zeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPJVGuw+rQqKk6zd5l/AAnBeF2EdLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqUJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:e9ONcqGdulAhouVgpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="72129261"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOOVSITyhiNrLlf9CH6kz8gwZwilJgIK8zbgieQ+TyQ+GT4qoQNkc6OxsvTDS5NVjIAfZuF3eQMCFlwGpS163tONFvShpLY6F/jebcaMQzb/2iuIsrUbrpixG1R0msbyv+bdaWe6Vrobj0c4LPTixaa7ITvVgxy3TczSpEFuyAswFEkZLUXZ/rxJw6HeWGicmpVJE+bsyB0wJscqiCElY4BXJXl5PkGPFI53uTerbM1eHyQe6iWpSJEgLgD0LqWlJ15M/LvL3eMNNoaH6r37vYTSMvpm7R/r6L+DYl82vgbG9DOx5JG0CxI7YN9KqvbalumGM0DO1DT+lX15Vj8iZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC01VVS1t9xrA2x0htIo3j/g4vkU3ZSRw9LLcQir1ps=;
 b=J+5qGK6QsNCSYCZzFfGJDL/J+zAVR8ZL18CpxAKI0yWth9MLJyHR+f+nYPZkqKwLeq+GY9iiqNFNVjHNasVn/ZKSxVvEQTu/ZZnD+86DMvggsElIdpoBHOgAq25M1ahZLsbt8Z1jZRoJApTEhv6mt2TLxTRsP7kS8OkO5bRNXRf9d+IsvReGAOlaDCSPa+5YuCsQO6BdQWP0jIQ60bR7IS4P8yVR4Y54u4HCbkeCREJdA00U6gfeYNcOwvS579EvCyZJwllCL5CcoTePoLaZr75ZO+ouO1CjOwOerzZW3G62mSy9zUswD+HCkthvtKlqCgMR7FZiZXk9j2PAIXNs6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC01VVS1t9xrA2x0htIo3j/g4vkU3ZSRw9LLcQir1ps=;
 b=HN0mkg32THw2SWUkyjba1qju8b+bDHiaepTMWJ3BSdmYwkqbGwsIrXowDqLbTvuhmYGwXyJseE/ptZzXCuXhE4lcrFziHw5ySng7FNIbjcGyAZyD+P6eu3nCd28Z/q9V7u7wFNKDAIc+3Yed6uXeL9EYcYOQWt7FfdSb189sP+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 May 2022 09:21:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/flushtlb: remove flush_area check on system state
Message-ID: <Yo3Y4l5ybrJA7VC8@Air-de-Roger>
References: <20220524105052.5210-1-roger.pau@citrix.com>
 <1b0b643b-a906-13ba-d414-feedc98428d3@suse.com>
 <Yo0L+mp5kP1zMU/d@Air-de-Roger>
 <dcbcb8a1-547e-d8d8-6e69-768533d24957@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcbcb8a1-547e-d8d8-6e69-768533d24957@suse.com>
X-ClientProxiedBy: LO2P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a740121-5866-4aaf-8793-08da3e1f2473
X-MS-TrafficTypeDiagnostic: DS7PR03MB5574:EE_
X-Microsoft-Antispam-PRVS:
	<DS7PR03MB5574238B57837B82F8B8BB7B8FD69@DS7PR03MB5574.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PdDSKrlhFiXCLOJYQ1DgMlq2wbPiXBeM2Sz2elZ3q+4p0ALqLDvex86B2j6yhi+Su9uuyUjMOSPXtZJzQC0TAx+p7nwe+QQbOf3WEdwfj3OKQt6LFq0IsT2Hhs38TiOf8Eu4/uAcOGRuMubfFq5he7ruxtymK7v36TQ8H8ksd5/FMbJ/5J6/lInzURh+baxgu8LVwxamhWyTpzX9KkySlhiH0VEqRmAbWURD3yGM1NG3rUCuLGv3VKf3/9IcRh5Zf9we+5DTDDyJpOXNbIf6C0t9T9zWc4N52zPZf+Lw1K3S86l+DJl8QxussE6cjjhBQv4lJlQ7sR3v16UK1X2alfO7Yta7OvnsOakGLQ6WkpKw8J0W7fcDsSnseyvlBb/3ER1SlIloUXNbj1rFuPc6T8NeB7wMsgynOZQ307D1TO8vIyUSuaPZYpbYHC4Fqp6Tn5AmwbBwI9EycOx+Hhxr/GoRzGrY7Sc/jHABavYEmcllEjjC3Me+g7W4yFxbuEb38RzkZdzlcQyTf8+PKkFZcRuyhywA/x4b/rqG2iQAuA9uoXBRab8o7YwkDjwU7FnwuqQ7eESYIS7O7AxzccUOdwggb0mAGeDEBeR5YuID6PckR40VOjZ/6BQ438pYAOQBX23hd0ryFwFVOd9rFhSydg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(5660300002)(6666004)(508600001)(2906002)(8936002)(85182001)(186003)(33716001)(83380400001)(82960400001)(86362001)(316002)(53546011)(6506007)(6916009)(54906003)(8676002)(66946007)(66556008)(66476007)(4326008)(38100700002)(26005)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFpRQmQ3ODNiVzFQektMRGJxRjlKOTZhWEFkV0JhUnZqUGxKdGVsdmhIVVlU?=
 =?utf-8?B?c2dNTFRMVlh1aUJVYVdIb0FDaW1yNEpDbHZkMFhFS1h4VW95MWZXbG5lSjJ6?=
 =?utf-8?B?VjNROEl5R1d2dnpLYWMwbWZIWlNMKy9BVFg5aVhkcmpDQnYvSzNZMkQ1MWdX?=
 =?utf-8?B?TlpJSFRYNHR5NzN3UlBHaUR1ODUyMER5alF5bTZKZ2xsUkVSbkR5c3dKRVRv?=
 =?utf-8?B?SXNXM0JtUkU3azZ5bDgwR3V4VVhlNWdtb21LbmJUR0lPanI2aGpJREFMSDdv?=
 =?utf-8?B?dVJmdTVoNnp5K3J4RW00bzhjVUhBNUR6ZGdMczB6TEo1NDg5L21mN2lWZjdU?=
 =?utf-8?B?UWlZb1NsNG9WYXI1aWcvd0x1aHRiQnpjYkpCeG1uUzl3aGt3dHhjem42SWhP?=
 =?utf-8?B?UThtUGhEWmdtcGVXRWVTTDdodjl5bTRjMVV0cC9HZGRlTjZWSGVDTlFFRHBj?=
 =?utf-8?B?TlpWVzh3ZDlqYys2S3N4a3JKcmlmdnBDdDFnbWhFeGxuZ0lGdGs4bEcvMWRM?=
 =?utf-8?B?L0dFYWxEWS9XZXcrU0dscDR6QlprSVM1ZHBCUFNzb2JmUWlIV3JrQS9PY05D?=
 =?utf-8?B?bkIzQ0NLTU9MWmxRSnFtdm4yT2dvZ2RnTmswZ2dsekdjazN1NjY3TDdFUlZo?=
 =?utf-8?B?MHZkL2dOdzdneDg3clY0MFprMFkvRjNuRUhscVk4dmhNRnNmbVJ3WjBnZmFN?=
 =?utf-8?B?ZXVrSFBkVXBxa1FneEcwOWFCYitZemtONldXTG9LWXpjRTJoUjRpUzBIQ1Rq?=
 =?utf-8?B?ZXhxZDBNT2svbEYwc3JQbmxzOGI5ZjI4RnN4Z3hLUXhkc1ErUjMrQ2JpUWNW?=
 =?utf-8?B?cncwaEZIVHNuYjlkWjBJR3V6LzBBcUVrL05QL0trMFFkZmFJQU5JMG1zd21n?=
 =?utf-8?B?Y1BHWHIyL3RRLzZwako3WUZtMlZvVC9lN2IxQnl4UFB1dkQ0OUlmNEFwL2lr?=
 =?utf-8?B?eHI3NnJDcmFpTkNQc204b0JIY2lYMit3V21EUldTWjdzZVpWbVp6bEFBcmNm?=
 =?utf-8?B?YjZDSktXUVVUaUp1di9jdHg5YXVnb1QwYkNGcm9uYnNqejFQbG5LMzEwVmM3?=
 =?utf-8?B?VFZlRVRtRzNKRkxNRExubUdtOVM3ZHdqYlF5SU44MGZyT1BRYzA3RnJmU0hU?=
 =?utf-8?B?VGIxZTJDbklZem12VXFCZVBDU2ZyU0c4ZVBaVHE3eGphUENsbFd4djNsMU5w?=
 =?utf-8?B?ZmdEb2NkVGU1OXZ2WGtIdjFvamhrMjNJOVhSNUM4YTV6anFRVEVWL3hHcE8y?=
 =?utf-8?B?R1pIeGp1TG1EM1lFN0pGVkZzM3dmSTRyb1MwSGZHWkZ1dndvMTE4anFwdWUv?=
 =?utf-8?B?dmJkQ1hza3VpKzFrZ3AzU2hvRWdPRko1OU1sdWxSdkNqWlNURHh1eVIwMmVI?=
 =?utf-8?B?RndUSHJSNENBdzA3TzBLRE9aekdHUEM2K00rWUtsOFJFWnVCeFlKUThwSVRP?=
 =?utf-8?B?TnRLaUVNV1B6TnpOU041ZGdLbDg4ZUVQdGZzalV6ekRFaW5CQzRXSE1rbG9n?=
 =?utf-8?B?VlNkZkxTanluOHFKOVFBb2cwQzREQkN4V09XdVh0LzhZaHhlbXo3eW9tNDVZ?=
 =?utf-8?B?MGpTSlg1ZTQyaHlxaStqSmtkd21aRHRQZFdJc3AxaGNoRUF2S2VwRXUyak0v?=
 =?utf-8?B?THVCS1Z6OFBrMEFJeGZ5ZWM5Zm9nTXdrU2VEdnRLbEk1RWJ6bzRvY3FGSG54?=
 =?utf-8?B?QnpMaUN3TXpsQUJTa3g1cFJsMUxyMFZOSnMrc3F3RmZuVnJnMFVYaUpIYjdD?=
 =?utf-8?B?ZnpyZEttQklsTklaUTJTbUlNZ2QwWUxrSDdpVGFzUWlHd1g4MDJMdGppdEsz?=
 =?utf-8?B?NFhBemFGcHB5dzNudFRaR01lRFdGZjlIWW1hakJlVExlWnFtRkRuS2c1ZDc3?=
 =?utf-8?B?dGVlMFdJcmtPcklQczZzN1k5cG96NHR4ZG9WS3ZpNDQ4OHZqY0plNi9QaXFr?=
 =?utf-8?B?d3drclBnUE0zY1dFUGd4N1dMejUxemh5ZG9pR1ErYWw2UlB5L3JNeldrMktR?=
 =?utf-8?B?OGtEbmt4T3YwMHBlenBmczlRZ3VNKzVPQlFhMjllOE5mbkF0dzlZUXJMQ09Q?=
 =?utf-8?B?andRbjcyWU0zb2haNUxwYmRjajRoSW1TYWs5RnI2SS9BbFozS3A5b1hUQkw3?=
 =?utf-8?B?bkZoOVpWMURVM0taRmNCbExjREl4MVhySVdXT29oWWF5WTcvT0xTdEpTR3lq?=
 =?utf-8?B?RjhyVC9EWHJmOFpIKzNIQmxrMitPNlJ4MC8rYi9mMVc4c282Q0xjNjBvSnlF?=
 =?utf-8?B?KzZublB2cVVSNllQMTNwdi9vclh2ZmRpaUlLdk1IanE2R0lncHFwYURjS0Q5?=
 =?utf-8?B?WkMzNkE3ZERVclJrL3pQSG0zVzkzYTY5bmlBNi9ROGpCemdrdTZDaVlJUzEw?=
 =?utf-8?Q?oxnlfngA6JrOwFlU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a740121-5866-4aaf-8793-08da3e1f2473
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 07:21:10.4069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/h4DjCxtLTZY/b/QAjQyKTPLuEWHekwvp+Enb/pWlAOmMJBHflrh63imF65oaUpaphwDu8OnO51f11lhFRrdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5574

On Wed, May 25, 2022 at 08:02:17AM +0200, Jan Beulich wrote:
> On 24.05.2022 18:46, Roger Pau Monné wrote:
> > On Tue, May 24, 2022 at 05:27:35PM +0200, Jan Beulich wrote:
> >> On 24.05.2022 12:50, Roger Pau Monne wrote:
> >>> Booting with Shadow Stacks leads to the following assert on a debug
> >>> hypervisor:
> >>>
> >>> Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
> >>> ----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
> >>> CPU:    0
> >>> RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
> >>> [...]
> >>> Xen call trace:
> >>>    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
> >>>    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
> >>>    [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
> >>>    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
> >>>    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
> >>>    [<ffff82d040203344>] F __high_start+0x94/0xa0
> >>>
> >>>
> >>> This is due to SYS_STATE_smp_boot being set before calling
> >>> alternative_branches(), and the flush in modify_xen_mappings() then
> >>> using flush_area_all() with interrupts disabled.  Note that
> >>> alternative_branches() is called before APs are started, so the flush
> >>> must be a local one (and indeed the cpumask passed to
> >>> flush_area_mask() just contains one CPU).
> >>>
> >>> Take the opportunity to simplify a bit the logic and intorduce
> >>> flush_area_all() as an alias for flush_area_mask(&cpu_online_map...),
> >>
> >> This is now stale - you don't introduce flush_area_all() here.
> >> Sadly nothing is said to justify the addition of a cast there,
> >> which - as said before - I think is a little risky (as many
> >> casts are), and hence would imo better be avoided.
> > 
> > So prior to this change there are no direct callers to
> > flush_area_all(), and hence all callers use flush_area() which has the
> > cast.  Now that I remove flush_area() and modify callers to use
> > flush_area_all() directly it seems natural to also move the cast
> > there.  While I agree that having casts is not desirable, I wouldn't
> > consider this change as adding them.  Merely moving them but the
> > result is that the callers get the cast like they used to do.
> 
> I'd agree with all of this if the change was local to mm.c. As I'd
> like to see the macro in flushtlb.h left unchanged, did you consider
> retaining flush_area() as a wrapper in mm.c, reduced to merely
> invoking flush_area_all() with the cast added? That would also
> reduce the code churn of the patch.

Hm, yes, didn't consider this, but could do.  I didn't want to keep
flush_area() globally, but adding to mm.c only could be OK in order to
limit the cast.

> >>> --- a/xen/arch/x86/smp.c
> >>> +++ b/xen/arch/x86/smp.c
> >>> @@ -262,7 +262,10 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
> >>>  {
> >>>      unsigned int cpu = smp_processor_id();
> >>>  
> >>> -    ASSERT(local_irq_is_enabled());
> >>> +    /* Local flushes can be performed with interrupts disabled. */
> >>> +    ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu)));
> >>> +    /* Exclude use of FLUSH_VCPU_STATE for the local CPU. */
> >>> +    ASSERT(!cpumask_test_cpu(cpu, mask) || !(flags & FLUSH_VCPU_STATE));
> >>
> >> What about FLUSH_FORCE_IPI? This won't work either with IRQs off,
> >> I'm afraid. Or wait - that flag's name doesn't really look to
> >> force the use of an IPI, it's still constrained to remote
> >> requests. I think this wants mentioning in one of the comments,
> >> not the least to also have grep match there then (right now grep
> >> output gives the impression as if the flag wasn't consumed
> >> anywhere).
> > 
> > Would you be fine with adding:
> > 
> > Note that FLUSH_FORCE_IPI doesn't need to be handled explicitly, as
> > it's main purpose is to prevent the usage of the hypervisor assisted
> > flush if available, not to force the sending of an IPI even for cases
> > where it won't be sent.
> 
> Hmm, yes, that's even more verbose than I would have expected it to
> be. Just one point: I'm not sure about "main" there. Is there really
> another purpose?

Right, I should remove main.

> Of course an alternative would be to rename the flag to properly
> express what it's for (e.g. FLUSH_NO_HV_ASSIST). This would then
> eliminate the need for a comment, afaic at least.

I think it's likely that we also require this flag if we make use of
hardware assisted flushes in the future, and hence it would better
stay with the current name to avoid renaming in the future.

Whether the avoidance of sending the IPI is due to hardware or
hypervisor assistance is of no interest to the caller, it only cares
to force a real IPI to be sent to remote processors.

Thanks, Roger.

