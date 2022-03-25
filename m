Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578834E7123
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 11:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294646.501080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXh8Z-00055Z-Vs; Fri, 25 Mar 2022 10:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294646.501080; Fri, 25 Mar 2022 10:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXh8Z-00053f-RQ; Fri, 25 Mar 2022 10:25:43 +0000
Received: by outflank-mailman (input) for mailman id 294646;
 Fri, 25 Mar 2022 10:25:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r7I=UE=citrix.com=prvs=076f4df05=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXh8X-000535-Dp
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 10:25:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8dd807e-ac25-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 11:25:39 +0100 (CET)
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
X-Inumbo-ID: e8dd807e-ac25-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648203939;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Zj7sntSWZ68JLfH8Q0e0keRLEt7YoR7fB0FHdsEvCtU=;
  b=dd0XE2IWNt/WfNsxmw+9asmHDkFrtqjcn0mwzoHMEdYIas9Mj2cPt98R
   zJcFZ7sVRp6CwWUaOBA/flPttsf6OPOv3cz+rd9nI3LnyOZIOYs4GEArm
   va/szJcL3qvuyqWOu7+sD096nJQPYERuV8fN4MVxy0Defr3MfaIQIIc6V
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69529485
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nVDW2KtxcIsiCFoKdEml8p/R3efnVLReMUV32f8akzHdYApBsoF/q
 tZmKWiPM//fZGahLY1/OYyw8xtT6pfcxtYxS1M5qHw1EX4Q+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX5
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi92IIjpp/9FbSMCOC9ZY45U47DCECig5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AN
 pdDOGY/MXwsZTVTAFcbFZszlt2Mj3OmaTRqjEDEiLoetj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMHMN2SzxKV/3TqgfXA9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydGboEOjX9NUK
 2QP5zEj66M18SSDUtD4VgaQvH2AsxgTStdUVeY97Wml1qPR6h3fAmUCQS9MbPQnstM7QXoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYW2Ks2qPEQj5uBp3vJpGyPtIPGSz9l+VCCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI5lypUQDPY68PhwxUjaoSsEgHONg1HsyDXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmTOKGM2mkUX8i+H2iJuppVEtaQrmggcRtv7sneko2
 4wHa5viJ+t3DoUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDpJNhMl+pt4I9YNt/0Mzo/gp
 yjhMmcFmAuXrSCWcm2iNyE8AI4DqL4i9BrXywR3Zg32s5XiCK7yhJoim2wfIeZ2rrAynKQoJ
 xTHEu3Zaslypv380211RbH2rZB4dQTtggSLPiG/ZyM4cYImTAvMkuIItCO0nMXSJkJbbfcDn
 oA=
IronPort-HdrOrdr: A9a23:1/iFjqmKTcDjedfhI7UvSeTWtWTpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1F9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPW9yV0qp/1WH/ebcHkjaRny9Mws/U42uonVrdUlCvgUlLJd1pAZDyHo/I6M0k9
 gsfJ4Y0Y2mdfVmHp6VNN1xMfdfNVa9My4kEFjiV2gPR5t3ck4klfbMkcAIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.90,209,1643691600"; 
   d="scan'208";a="69529485"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoVY5tzbNLvZ9ug3/nGH0HGeDlyb2k1YlIltrrgm3Vy8rwiK8EbN3LwieK+QJKJlaCfMCtF8+95vYlSecfL5nKDfcy9ysVYZdNxkRelEIyk/SkHQ5wdygABLkKwVh9eMXuOWJPq/wWFOpwvKX8DMqQ9KaBsBbunGVxLqlVYmeQFFH+oGUJRAZbuPQN3xFhmEi+wKssKbm84cjvZoHgV6GvN0ARxqgvQOwWGAT8J7d1/+7D+zoHw/AvLPWQnf4shP8ihPOARRA0VqF92pNoKXIPOaW9A57/RcYOu5iiqYRK7Tt9UFzM0m7KCT7btm1CTFoB7M9C2l6YaeS5AIFXo8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPQHxJ1hAuYMlNmWJ/4PGDmSYVMmnuPuzQbRLzFyIW0=;
 b=EfNcpBprbG5zyxLwLe3ueZ2g1qQ7H5u9mRzGFGwVhhTL4iljZJgsHHCj66rPhHerDKPA8MYOXzdAfThSNWTEUoFtRRi7JedHYeCxITZ3E3QfAjyfy4rps3RuONq7EQ12xOpJzfGuB05tYKA4FzIib2LXvEBh8DcCGzfq9dP6IoK90AYMZ4mE5w+ynOwzCJh4xhrWkhXunnDnmnVUZfklAyRIMgYrNmeCeUAYQPkX8BMcDEwvgwNurS4UbabeaK+SXuPMC+Ndc2Plk49/UCIecjnt5PonjkENFXOjmBEMmwhIWR8ADf7UPc9XmwDFkV/whBainE/QVRPhY5TbZ8B6cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPQHxJ1hAuYMlNmWJ/4PGDmSYVMmnuPuzQbRLzFyIW0=;
 b=jA4KAxnrL6q3l7jsjO70eCZdwOHuuTgtEaESbBFUcX7qxMSN6atYHlFs7NeupqbYH9oGfTO1kSGkk1Ohij4i8T1EJYXAIB8cHQG3xN/BILgP+s2jqZHckKku5rKS2yu5KVkRwOP7I4G+RgVBnyWkNIlPTWdJ5oJToFMMZo3x20E=
Date: Fri, 25 Mar 2022 11:25:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>,
	<xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] x86/mem_sharing: option to skip populating special
 pages during fork
Message-ID: <Yj2Ykz2diY5RTjbS@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <YjyFODl7VFJLaj0c@Air-de-Roger>
 <CABfawhk9n08bmXWO1iM7Sz-5uhzuT5W6BZzj+yNDW1+FFDA5GA@mail.gmail.com>
 <YjyTf4INCjKWD09n@Air-de-Roger>
 <CABfawhmWtxpb3E_vxRRAV6b=P7_T3Mhd+rZ=_XY+6J3-vv+-+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhmWtxpb3E_vxRRAV6b=P7_T3Mhd+rZ=_XY+6J3-vv+-+w@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1be427ed-9a31-4a9e-020c-08da0e49c7bb
X-MS-TrafficTypeDiagnostic: CH0PR03MB6148:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6148F3B7CD3AF95EA84CF9328F1A9@CH0PR03MB6148.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u8WozOnpj8gOtJeuZPLMlCyE9tim+iCxV2htWrESRxvmxZd9RBfxtIYST0fGwnlQfT94h6EZPQjnX3QZ1y04LUq1wlmoz2MlgVhK8BWkyIXZhU9XcbxDIBI8yuQZ2RMM61etamJ+Vkm3MCXso6A8D4wc/GzIe/FSwW8xGKDLhz+c5J70I1kkrIeycGB8nHrKzkEV9dVkkwmg/oVI2in+fJJWRnbCb5VCq4aJxdHm1uOYuNTigMiK22c90yiSSKkJ1mgsKQQFqFaiPiL3uLQeH8Ni6Tf9y0k8ur6PdPMrimcJTleW7XuCBPHznAXST7Carq4w5CEIqWR3xl/az5563aZxXt1Xug++a/ToK38sVB9q6XqfFwxSejBFDzUGF8C2KHh65MsKRWlB6vbNUVyuBWBAnVarQJjC1fh3FBMpuVkbxQetGuVSR+VMOMAuTDp4jkV96VVJCy4zpzrrmHv0U1+RdhKEDTruvNnXa6RjAjPGPPsJHOii2U+UYkKIHsOLs07bTRfnxbGQYIRR+U4JEfjIjBiPsA4FE7Hbt5MP3/iLcG/3e1os1B9zAFQ4gSyQPmNkQGYukQPeqO4dWcD0NCQNh6m9XzMCSBRdZkIg/GZZ+BxfNWTx56If4vZXHhDn2cE2tJ25m/VXGliM8eHdqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(186003)(33716001)(6486002)(66946007)(66476007)(316002)(6916009)(66556008)(54906003)(85182001)(8676002)(4326008)(9686003)(26005)(5660300002)(6666004)(86362001)(8936002)(508600001)(38100700002)(82960400001)(6512007)(53546011)(2906002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djZZWG1TQ0RNcnZvcFloOVNqZUpjRWl1bkxMOWxvQ2Q4VXhmcDVvMk5MMUxO?=
 =?utf-8?B?RjYvRElUR2J1VWx0WWFvazBpSU1HanJSOENEVlNIT000ZVRzbjdzc1JSRVp4?=
 =?utf-8?B?WWZ4S21YRkkyMFR1SW1tSnByd1RPaXdnNkJ5WmdFZy8xS0pCUUUyZGJHcW1F?=
 =?utf-8?B?MWd4Y1VjV1A4TU1HdHhJVDRzZEdWQUlZSUlZRHBvMjY5NDdGNkcrSkpxbHBT?=
 =?utf-8?B?WHd1bkhpZ0cyMDdnZ2Y4SGR0c2VURTFsU3NjdnFBOG5kaTBhTk1GbE96aVdK?=
 =?utf-8?B?Z0NHZGE2cVhxbFNpWlUxTWpGdWl6Z0wvR0ZieGdPNnZvMmRTT3MwN3JjcDlr?=
 =?utf-8?B?RXRqTDI0b3J3dzRLODBMbWxDd2FJNUg4SGRBNnlpMm9nZUt5Mkk3UEhJU0Uz?=
 =?utf-8?B?a2VOUW13cmdDaGlEN2tMeW04N0NCZ1FSM0tSRndOd0NJSEVFQVlCV1hjanJu?=
 =?utf-8?B?cmtzMTdLREZLTVA3REUwOVNvSXpkZXZCcTRFQkJzZWxiaG02OCtIRElETGcv?=
 =?utf-8?B?WTlrUFhMSE55Ly9taWJDc2p5UkxJZFdReEpwYVN3ci9CVTcvbXJ5aC9hWUw5?=
 =?utf-8?B?Zm5EaUxaSGJkdk9BVWRMSzRrWXladnlhTkpielRneklVSHk1VUVmRDZyRHJy?=
 =?utf-8?B?R3FkWjRVSzMvZEtNdkZMNmRGQktRRnZGQUQ1TDE1VmJaRjlVRGxTZEd0dW91?=
 =?utf-8?B?OVV2VW12dnhFRFFpZTBKKzlpVk92NUFoVVRGdEZLZ0Nzb1hIZVVPQkljOVRZ?=
 =?utf-8?B?ZHNkQnoyZmVrR2YxRHhyM1k1UFVtSzR6eURiL0M0azFXM3VtVGdCY0pRYXBz?=
 =?utf-8?B?ZmZJdG1kT3g3UEZyc1VQYnhMKzA4eDByejg4V0ZKL1k1bTM4bDRFcXkyZjFw?=
 =?utf-8?B?TWRhNTZQY0laSWF0TjN6Zmg0RStlQlc1Mk5KRWJ6MDN6VlZjRUFTNWxObC93?=
 =?utf-8?B?REp2VGtwWUJOajhWSm9rUjNySXV0TFZwSEtjYmdxWWRHb2FpcXdvYW9KMGo1?=
 =?utf-8?B?eEQvcWtjQVUxVFIzWjhBenkzL2Z2cHA2TWFGbUUvMEZZY0FYVXJzNE5zbUl1?=
 =?utf-8?B?SVdnNnZOMWtNZ3NCUkt6Mlo0M1lJcWYwVFZtOHQrTjdyMnNhZVVzcXRmdm9O?=
 =?utf-8?B?UmlYU3pMRGpSQVdCOFp0V1FpSnFxWjk2NTdPNzhWbWc5RVMyU3JPYTRUaDZZ?=
 =?utf-8?B?YTFKUGZYQlFNWXhmQkN4TWpqMDdDbnBtV2lCWlNmWWgyNnNCR2FSd2FtUkx5?=
 =?utf-8?B?d3hOZGVhbXRUWWhmb3g5Z3VSSEZ0emNEVGJxN3dFOERGbXQzV1RML210QUJG?=
 =?utf-8?B?K0ZKQTVZT2ZGakR3SmRjUDBGL01XYTFFVnhlUm1UOGhIem83WVhMVlFmK2Mz?=
 =?utf-8?B?ZE96L2o5RXZpSHZJOEx0RkhTQThLMWdaWlE1QlZwOWlhcVNrMUgvN0UzeHV3?=
 =?utf-8?B?R09zNUFaelZlRjBJRnNIR3FRRUFuSDNFbEM5cUZocEhtcHhYZ3hoTnhRdUtU?=
 =?utf-8?B?STNKNUt2Zk1xVEZQb0VIbHNMZDZzeFozSlJ4c3RRZlVvaHMxV0dOV0lTSG02?=
 =?utf-8?B?eUU2c09ad0JyNE9KOU10U0tVSzhQc1FKYWxURTJkUzZ3K3pJMnpWUHIwcjdW?=
 =?utf-8?B?L0JycFJ2YW5xVFhia0N5ZUpISHFsWUF0L0F0LytpcUtpT3paMXNSZUxqU2ZZ?=
 =?utf-8?B?MS9vK3MzcXZjc213NEt6QmlqaytWM0xXT3VtRjVPN2RnT3Vod29pTnRwRnNo?=
 =?utf-8?B?UnZRMXN3cjVhb1ZvUFhpYithS0pYSkJJcTk2TWFjeHNOTEpYTUVMbk55eHI4?=
 =?utf-8?B?Y3FGV01JU1VlQ1VEeThPZHpieHJMZ0g3THhFL2JaK0VoSUYvZlBMOWdDNDFt?=
 =?utf-8?B?TDdWUG9kNWk0UzBFZXAzYjU5K3cwRkJLaU1OOWszcUtnTmtaWk9sM0Rkb29D?=
 =?utf-8?B?dmMzSE1QUXhvdmd4eEJId0tPNm55ZnJqRm5YQlhlWDhjY3R6MnRFMGYzRmNm?=
 =?utf-8?B?WmdCMFJ0cUE4dUJ6RnJxNENBWE13aUNoYW93WFdsZWpKczBhUVZwM0tSSTlG?=
 =?utf-8?B?YWo5NUYvU0hlN25pT1ZUbHRzZjFCaE5QVXlYWEZRZ2lEVkYya2VNOUk0YmM3?=
 =?utf-8?B?L25Ud0tJT1lkOEZnbEh5TjlFWUxMaFJGTzdqTHcyMDRKL0hWODQwUmpaL3hE?=
 =?utf-8?B?WUY4ZzJob2pqNWY4UTlJSHIrNWg0b1lMYy82NFhvZDR2UnM5dUMxRno3U2Vw?=
 =?utf-8?B?ZytIWS9rVzc5YklFcEgwdGE3YWpHUEREek1DMXVaMHBmaEhaWkthN1UwSWUx?=
 =?utf-8?B?MHRvS0ozWFRQaHRkWDlha2gyV0h2eWZRbWM2b1dJRjdJd3RSYld0K0pKVith?=
 =?utf-8?Q?MOyMhyk+Lhp+zpfc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be427ed-9a31-4a9e-020c-08da0e49c7bb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 10:25:27.4856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0JRsbVzFnHuPmCLOpWK5GMfcS0c9pvE0xgmR+N8JOEnIsCuNx4xrOLncusySga+6FfqRKXGc1nbF4jilwvKFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6148
X-OriginatorOrg: citrix.com

On Thu, Mar 24, 2022 at 12:27:02PM -0400, Tamas K Lengyel wrote:
> On Thu, Mar 24, 2022 at 11:51 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Mar 24, 2022 at 11:15:08AM -0400, Tamas K Lengyel wrote:
> > > On Thu, Mar 24, 2022 at 10:50 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > >
> > > > On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> > > > > +    {
> > > > > +        cd->arch.hvm.mem_sharing.block_interrupts = block_interrupts;
> > > > > +        cd->arch.hvm.mem_sharing.skip_special_pages = skip_special_pages;
> > > > > +        /* skip mapping the vAPIC page on unpause if skipping special pages */
> > > > > +        cd->creation_finished = skip_special_pages;
> > > >
> > > > I think this is dangerous. While it might be true at the moment that
> > > > the arch_domain_creation_finished only maps the vAPIC page, there's no
> > > > guarantee it couldn't do other stuff in the future that could be
> > > > required for the VM to be started.
> > >
> > > I understand this domain_creation_finished route could be expanded in
> > > the future to include other stuff, but IMHO we can evaluate what to do
> > > about that when and if it becomes necessary. This is all experimental
> > > to begin with.
> >
> > Maybe you could check the skip_special_pages field from
> > domain_creation_finished in order to decide whether the vAPIC page
> > needs to be mapped?
> 
> Could certainly do that but it means adding experimental code in an
> #ifdef to the vAPIC mapping logic. Technically nothing wrong with that
> but I would prefer keeping all this code in a single-place if
> possible.

I see, while I agree it's best to keep the code contained when
possible, I think in this case it's better to modify the hook,
specially because further changes to domain_creation_finished will
easily spot that this path is special cases for VM forks.

While the code is experimental it doesn't mean it shouldn't be
properly integrated with the rest of the code base.

Thanks, Roger.

