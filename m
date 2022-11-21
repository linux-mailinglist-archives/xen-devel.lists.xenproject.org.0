Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8886321D4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 13:24:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446590.702239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5qE-0003oL-6Z; Mon, 21 Nov 2022 12:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446590.702239; Mon, 21 Nov 2022 12:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5qE-0003kt-2Y; Mon, 21 Nov 2022 12:24:02 +0000
Received: by outflank-mailman (input) for mailman id 446590;
 Mon, 21 Nov 2022 12:24:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5PF=3V=citrix.com=prvs=31798088b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ox5qC-0003kn-Ur
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 12:24:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ebbae6b-6997-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 13:23:58 +0100 (CET)
Received: from mail-bn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2022 07:23:55 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by PH0PR03MB6219.namprd03.prod.outlook.com (2603:10b6:510:e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 12:23:52 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 12:23:52 +0000
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
X-Inumbo-ID: 5ebbae6b-6997-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669033438;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oVL7tfPvhqZHEWr4k0UwNBS6LYjPQVIpkkPufNfNWCQ=;
  b=SyxPi5CXEcsuhq3z7n/mcR7nCNof4AvmbqhFFZUODsot5NENvqcSjhwd
   VjDFlCGZxfCROy7OTYHYo22FWqstFPCDLo61J9qc/aynd/GpF456m9YsG
   kYWyVU33KfscD0QT1enZCfGNsPk9M4vaErmXP7OAv1T5efJ4Rj8ecvkez
   c=;
X-IronPort-RemoteIP: 104.47.51.43
X-IronPort-MID: 85665039
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CpfDY6u5bWo5utqUaNebnlR0rOfnVGdfMUV32f8akzHdYApBsoF/q
 tZmKWDTa6yKMTHxetx2PNmw9EkH6J7Qx4BhTQprrX8wRnsR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaEziFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNm8yNR2nl6GK64mRYO5Lids7M+TABdZK0p1g5Wmx4fcOZ7nmG/+Pz/kBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osif6xa7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RODmqKMy2wz7Kmo7VjgKTgGBsfqCj22lSf1iB
 3U4xDEVsv1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceXTU30
 neZktWvAiZg2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OKu8j9mwEzepx
 TmP9HI6n+9L0ZVN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:stulDKDbxes4vTDlHeiEsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX252oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD6nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZJB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3M4iFQJuYdI99RDBmcca+d
 pVfYfhDTFtAAqnhkXizy1SKRqXLywO91m9MxM/U4euokVrdThCvjclLYok7zc9HdsGOud5D6
 6vCNUWqJheCsARdq5zH+EHXI++DXHMWwvFNCaILU3gD7xvAQOFl3fb2sRD2AiRQu1/8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBGGwRy7kxM1S74Vw/uSUfsuhDQSTDFQ118ewqfQWBcPWH/
 61JZJNGvfmaW/jA5xA0QHyU4RbbXMeTMoWsNAmXE/mmLOCFqT68ujANPrDLrvkFjgpHmv5H3
 sYRTD2YN5N60i6M0WI9CQ5m0mdD3AX0agAY5QypdJjubTlHrc8wjQ9mBC++tyBLyFEv+g/YF
 Z+SYmX4J+GmQ==
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="85665039"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLZ1T6aU5w7jxtBojLBVo0tKfBIM6ZWEKkvjVlPulZecYgMSMu/T/yfFtjnLErf69FBjQbCIKjZLwRXGBTDCcnXnrxp76AD3utEUKCMAJWV4f0rdWJHhj2IP/KszkhWWRr5V0K32UMtF0g1Aukn7Xm0/nqHUzir6h1R9ALvChgmSvrfiIlSFGANNm68jrMOHAutveXhDD5OctOhXUdAx9NmYJjQk6xoeDurghBFhmVN7koCzTNObyT5K3yG3YxGQKFCt74TZOzE56IaAe+cZT/i1oxz5iZT17LdqXwVE8jNwrU2FLe7mZ3HABqqPdxZt/VaBgJsRvjKxjEt/T10emQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVL7tfPvhqZHEWr4k0UwNBS6LYjPQVIpkkPufNfNWCQ=;
 b=NMcuS8tKLWo97lFEdCXpeGDYaA6lTIUgnN2GiUTiKpRF7HGwNdrcswlVS2XqwnAevoDOHPzK3Vj5gWc/0nOz6mgzQ+T1K5emPWaJRYaEmEo4Qk8+hMXFUoVsp/JtGICpbgfjgUeVwAsBjIR1IJxV8eeBohOLo7YSHIIdHisbA3xPuceoQGdEFs3dUHhTEckjRkZeu68PGrfI7AQYiWUglB422AkOBZHoIrFlqXzvttRVkJU0ThMHXqf5vdobXAtsjrelRASdjOti6ET1jKpEza0RbwdN+w3ux+T5NPHduf5WWg+Ty7K/GTIVtFsq0gwhJ9wIzwL5YoRQfivsg57MDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVL7tfPvhqZHEWr4k0UwNBS6LYjPQVIpkkPufNfNWCQ=;
 b=hTMgljQmWa45q08/3hOBYjiVrfevlUpLb1e4nY1DmKE6Srf16KH4izVhvSXU8hTjwRx7blkrhKQSLp9DuaKyEs6G6hGmrnhIa7r27THhn/J59nFET+tdtV1u7/ZznYPjPgUKJyhY9xNwAXHGDMIJSBjBEscmYDpzB+RuzpZoRcg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Thread-Topic: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Thread-Index: AQHY+zjv47cM7GZ23kWVhiI/91aGOa5EnVaAgAAGB4CAABnfgIAEWpmAgAA59AA=
Date: Mon, 21 Nov 2022 12:23:52 +0000
Message-ID: <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
In-Reply-To: <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|PH0PR03MB6219:EE_
x-ms-office365-filtering-correlation-id: bc54823f-298b-4383-1612-08dacbbb4088
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /7zK09pA+NloDfx9DB7rjYnraYuLbhLJr+idu2J09pPgUhMu5leMc3JjS0/8gWobeAT0nB0IMKzG2JQPv4GzJiU7G57tZzgc+5foDtMb7VGoPpp0SsuxWgSD/c/vxJNUZBIoUElAb/G+0ezwk7f53SEeL5O6jI41fCWWv6L0A57ZUytqpBF/xgu9exVNgcVjJl0HOFGOX06v3ZJMPkgxs4gUZGlVjqocyWFnTqrW29vsJTzYTVtC6NTWo4PH/oW6dNXm4jrP/Gmw711lEZzXIxSCECtzPcpFXcUh3S0I6kWcSJCDZqx22rbkwbiCGVlFQ6NiTrFck9E1txMvPBgLNXy3DRHrBZZ+1pcGFZAPftYPDfk4cT0KdWSVSfI5d3s832BQkoDLEiKnFKnPVdNQEk6CzgfvPT+Ni7lh5pHMVPFsLe4hEAV3bAoY9XCBGiu8i5Y/p5MUD3KX91GYQFSfBUz1XcOBookwA1dSnabznhEFbEmabJfIZ4OuPINOqlg1ITX5LjPV8eYKvpaq8sbygX06EnqXaftpnGsLfyTQxoi+8QmMjCh6RjmhdicnfBx3wftrZJ2/CY/aLhgWSPx22dAfwu/Hf+4SdhNdxgjzIqONLPBMU2uLY/pDQB6OLdSgVPkHtF0jSVuVOLnw6yi0K0P/Idqq6MiE/r0yUSxfXBl9tLUZChqwVspraKqTgU6PnLLQt8MPQ/yNMW9Oj7xVHfYFdyVqJx33rfMzMfbUCcCxO//etj0NleSdOcJF+PkXv1qufuCAAhc3TGmc2Voibg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(71200400001)(91956017)(53546011)(26005)(6486002)(478600001)(76116006)(64756008)(4326008)(8676002)(66446008)(6506007)(66946007)(6916009)(41300700001)(66476007)(66556008)(316002)(122000001)(38100700002)(6512007)(54906003)(83380400001)(2616005)(186003)(8936002)(2906002)(5660300002)(31686004)(31696002)(86362001)(36756003)(82960400001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VklERFE1azBseGRBVlpVY0gyUTg5UkFZTmtYOUF6Lzgvc21iQUM3SDNPN1FM?=
 =?utf-8?B?RDB1bWh4ZUNsRlh6bHBJUGF5R3o2NWpHUWVzRmVQNDhWcXhqYTdlaHNJdWh4?=
 =?utf-8?B?d2lZSmVSS2NJWlptTWRLOVZPVWtZQk5sbjBiVU5VTTMxeTdva2NJTnZzcGtO?=
 =?utf-8?B?SkVlaGRjSHQ1aW1hNk56RjYrNTBGQUVGYUZVM0JSdnFqcFZqK25xU0JZbzNE?=
 =?utf-8?B?Y0JWZElsUkIwa05STDVoOC9zVVBPVUM3US9KajdPcnpiZTg2azdFajAvZFJH?=
 =?utf-8?B?cHVGVHZZcWxCTWU3QURiMExpVG83M0oyTzVzek1VRXp1NlBUVVN4SFBLV1Ix?=
 =?utf-8?B?YmlZQ21JWkZMaFhoaG9CUkVXOCt2K05mU2MxME9KRGdUTUNlREFod0NGMmVZ?=
 =?utf-8?B?UndQaE80N3dmMmgzcVU0UktzMXF3cHJkdGhwUk5xSVE5eVFoWWd5Qkd6emxT?=
 =?utf-8?B?Lyt3VU1hbHhpY3JVMjBCVWZZaDVWZjZ6UFV3OXdEdHliTlVxa0FvTFRRa2Rq?=
 =?utf-8?B?SGZFWWpiVklpaVV0Y3FrR0V4ZTg1U2FsNDNFc3FTN0hQRENWemJtelNhY1FT?=
 =?utf-8?B?bEVzK2RlMGRYNks4R0lLMjZ5ZE5IcUN1R3FITjROejBUSzRONytLY1hXMmxP?=
 =?utf-8?B?ZXliNHJyK1dpS25hUHNnNkFNU2pCYnBHVzZVOHRkcDFFekdid0lqd0cydTBI?=
 =?utf-8?B?OTJ4R0N5dld2RnBickpTeU5WVkk4Qi83NytZVktIczZrRXRlaFZ4NmdKSjJs?=
 =?utf-8?B?Wk96dzRqNlBkdENFanRnc0JCcmhubXhBcFlQYS9KdUFyQldEbDR3ZDg3SnQ3?=
 =?utf-8?B?Sk45b0NzNEFhZjhjN3JaaDBNcG04S21FU3F1MzhDQ3lxQlhXeC9OUjFrbXc2?=
 =?utf-8?B?S1J5K3lyVDFGUEt4NnU0a1B1QkI0T0ZOOHlFT0lHeXN2QVJSR1RDejdoNGZG?=
 =?utf-8?B?Z09hb3l1czltT0JWbUFvU0pRc2xOenMwN2JhaWR5Z1UwcDQ3ekR3RnZrbGJl?=
 =?utf-8?B?aHBMRVVvc1dDSnE2VkNuRE9jMDQzRHh5Y09PZUdPNWhtU0ZJbWovdGtFSmFU?=
 =?utf-8?B?dDVxSktKTEdEeXdWSEdValRBOERVVk9aRU11T0lIclVZTlFQWHNGdTFlRjN1?=
 =?utf-8?B?bEIvZStuU2JnQnFjUEtlMHc0N0YrUEMyL29JRUc3ZFY2OCttbkFJOVJOR05z?=
 =?utf-8?B?cy9CWE92TnZ4N2NmMUpCN1NaK1JMOFFGY0xocnVxcVU3WDk2cU5aakpOYVhn?=
 =?utf-8?B?cHgxUlBETUhKSDFpbTk1NlFiQXUvZEpWU3BDYmV1V2tZeU5ZanlNRTFUMFZh?=
 =?utf-8?B?bmJCSzVQWEQ4eGdzWUZ2K3cwRzJ1TDJQaklnMzBieHJFZFZpbFV0UzVVL3ph?=
 =?utf-8?B?SktxcXpzUnpNNDdpQzAvZ1JjeE5pd0gvVm1LR0VnVGYzZ2IyTHQ3aGZPczVO?=
 =?utf-8?B?MGR3RHdzUnhFZUZocDVsc2R6bnZuUVpDZUhqSVVvWElWRmRPR1hQRU4yUUh1?=
 =?utf-8?B?Y2pSbVRhSXhiZ0ZqVW81dUgybFhVb1h6WFlmYkRJWWNueENFZ3BNZ1hWaHhy?=
 =?utf-8?B?TDQxby9UR3lLSVJ6Vmo3ZTE5V2NuUUVuMFo1ZEt2VWRFU1F4RFJhc29id3N6?=
 =?utf-8?B?Y3pDODh6bFFhSVRIeDlyYmlOZWJSWE0zMlBFaGVKQTlsdXhrcnNjR2pmd2ZF?=
 =?utf-8?B?ZjMvd245Skt5MXNnQWlTcENoWGtnV2VaMFczeW1FVE1KSUpwWTQvNWpnd01o?=
 =?utf-8?B?Q2FNKzFpUXRyVysvc2xvaTJSbmJ4czltc3kxeUF5aUlZakFxWWtGQ05ZZkxv?=
 =?utf-8?B?bFZMc2JMV3FOMzBwVDZ2TlEzSGZ6d1RLN3hyeGZaWmRKTW9raEVzalVmOERs?=
 =?utf-8?B?T3RaUHRpa25HcnAwMFRNL3hHcy9iWnpOVHd0Qmppc3dxSVkxQ1hvaEpaRUdj?=
 =?utf-8?B?WDArYlhvWFdtMmdXWG43TkwxL09kM1daR1dhU092RkNIWWJnVG9xMUlHVHJW?=
 =?utf-8?B?STdpTk9XQ3ZuQkEvYnlJOGJlZnZ3dTFBSEkrL0xiV0hqU3o4SWVoWnBwSlpY?=
 =?utf-8?B?RTBYUEZqckw0K1NEMTZ4UWx0WU5RU29ZNlFraTh0K3VLUER1RURaQ09UL1Yw?=
 =?utf-8?Q?FxHbppA+Jfyqh9Hxfp6EzFDTH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <284CE6C9B6DC1C4280FF853296F15313@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pvL15yjwaMa3JGCKLL4N9BrhMkIZcPofq6OjL7tp53yZgorjzlJuyK91H9Qf8qBmADRt8/RVcMj3MiQquna6XY25ox1cJH9hwkjGttzNz6I+/wwQ/vfuFYDOsIl/XA9MgkvleKeRToqITse1u1iW3gJyDp2ktB3BZ6E/vRmaZCRzh6NIAcvGGutpNeM7/HX78A7jHjzbjHctCW9qYTg+AuGcDiee3GF6xeamZ24sBvphJC8B0BAdVcm2rUFLQJXz2NoneXKaSQn3z40SRVEyz6c/LcHlzo6qvQJ9wTddZgP0aEc3yD+PNNLAtNW7aZhaYnRt1PPUXrAZNDTi5Cp3mm3mzp0cGPy7kKUK7rpzZycQBWpV+8XuQDU3aiD+ALzwM856QuHfjALgWbAHyKLGx1O4s1yDogDwCWn7pzOE9RKw7YfqiCpxXlmCRTWrX8d7BJhScnirzGmq0WjL2tIxumstGy1sEoKaxlP5/s+EqGUAgwubfk9OQnz+yvq0me0jfQE8p6JjohNaPQP1ZOssfej5OtKDzPeG1S/04bVnRbq2upP6rTk+XcyC9blPIx25e7DLyNDGAGC7SwKHI9UddbyuFDsA6h/DXBWBShn7PHYE7aupbSVaN0poYXuS5+GtgARxsFexF3AxD06I91fHn09fNYVR4NKOd89RCl9H8Twy3PwW7IQaTOCty8kGZ1XYLRZAwd3OYJXz9OMBloMdkFTfh+OnrFa0ix/SQdlxvLlB6kv2ieIWBAWbvWPhqZinU11nAWd/0WfVjkwRa/G7zemTNTlE5E+rRE02t6sLTzZK+I6Av0Cj++MmoZxwJyIfr+GRFNeYtB04j5BH1FZkEdcp870HiG2WPbEoopU2WF0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc54823f-298b-4383-1612-08dacbbb4088
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 12:23:52.8173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6v2QI533RQ284Pm62gup3IPICiSDsUpCz6877w1DJkTlBUrWCJVE6jejsgoLfdzEvkLF8sx/D9vuCzwiSpP0eq6Dhm4/yNDSEuPm7xIUGxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6219

T24gMjEvMTEvMjAyMiAwODo1NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE4LjExLjIwMjIg
MTU6MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxOC8xMS8yMDIyIDEyOjU0LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxOC4xMS4yMDIyIDEzOjMzLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBPbiAxOC8xMS8yMDIyIDEwOjMxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
IExpbnV4J2VzIHJlbGF0aXZlbHkgbmV3IHVzZSBvZiBIVk1PUF9zZXRfZXZ0Y2huX3VwY2FsbF92
ZWN0b3IgaGFzDQo+Pj4+PiBleHBvc2VkIGEgcHJvYmxlbSB3aXRoIHRoZSBtYXJraW5nIG9mIHRo
ZSByZXNwZWN0aXZlIHZlY3RvciBhcw0KPj4+Pj4gcGVuZGluZzogRm9yIHF1aXRlIHNvbWUgdGlt
ZSBMaW51eCBoYXMgYmVlbiBjaGVja2luZyB3aGV0aGVyIGFueSBzdGFsZQ0KPj4+Pj4gSVNSIG9y
IElSUiBiaXRzIHdvdWxkIHN0aWxsIGJlIHNldCB3aGlsZSBwcmVwYXJpbmcgdGhlIExBUElDIGZv
ciB1c2UuDQo+Pj4+PiBUaGlzIGNoZWNrIGlzIG5vdyB0cmlnZ2VyaW5nIG9uIHRoZSB1cGNhbGwg
dmVjdG9yLCBhcyB0aGUgcmVnaXN0cmF0aW9uLA0KPj4+Pj4gYXQgbGVhc3QgZm9yIEFQcywgaGFw
cGVucyBiZWZvcmUgdGhlIExBUElDIGlzIGFjdHVhbGx5IGVuYWJsZWQuDQo+Pj4+Pg0KPj4+Pj4g
SW4gc29mdHdhcmUtZGlzYWJsZWQgc3RhdGUgYW4gTEFQSUMgd291bGQgbm90IGFjY2VwdCBhbnkg
aW50ZXJydXB0DQo+Pj4+PiByZXF1ZXN0cyBhbmQgaGVuY2Ugbm8gSVJSIGJpdCB3b3VsZCBuZXds
eSBiZWNvbWUgc2V0IHdoaWxlIGluIHRoaXMNCj4+Pj4+IHN0YXRlLiBBcyBhIHJlc3VsdCBpdCBp
cyBhbHNvIHdyb25nIGZvciB1cyB0byBtYXJrIHRoZSB1cGNhbGwgdmVjdG9yIGFzDQo+Pj4+PiBo
YXZpbmcgYSBwZW5kaW5nIHJlcXVlc3Qgd2hlbiB0aGUgdkxBUElDIGlzIGluIHRoaXMgc3RhdGUu
DQo+Pj4+IEkgYWdyZWUgd2l0aCB0aGlzLg0KPj4+Pg0KPj4+Pj4gVG8gY29tcGVuc2F0ZSBmb3Ig
dGhlICJlbmFibGVkIiBjaGVjayBhZGRlZCB0byB0aGUgYXNzZXJ0aW9uIGxvZ2ljLCBhZGQNCj4+
Pj4+IGxvZ2ljIHRvIChjb25kaXRpb25hbGx5KSBtYXJrIHRoZSB1cGNhbGwgdmVjdG9yIGFzIGhh
dmluZyBhIHJlcXVlc3QNCj4+Pj4+IHBlbmRpbmcgYXQgdGhlIHRpbWUgdGhlIExBUElDIGlzIGJl
aW5nIHNvZnR3YXJlLWVuYWJsZWQgYnkgdGhlIGd1ZXN0Lg0KPj4+PiBCdXQgdGhpcywgSSBkb24n
dCB0aGluayBpcyBhcHByb3ByaWF0ZS4NCj4+Pj4NCj4+Pj4gVGhlIHBvaW50IG9mIHJhaXNpbmcg
b24gZW5hYmxlIGlzIGFsbGVnZWRseSB0byB3b3JrIGFyb3VuZCBzZXR1cCByYWNlDQo+Pj4+IGNv
bmRpdGlvbnMuwqAgSSdtIHVuY29udmluY2VkIGJ5IHRoaXMgcmVhc29uaW5nLCBidXQgaXQgaXMg
d2hhdCBpdCBpcywNCj4+Pj4gYW5kIHRoZSBzdGF0ZWQgYmVoYXZpb3VyIGlzIHRvIHJhaXNlIHRo
ZXJlIGFuZCB0aGVuLg0KPj4+Pg0KPj4+PiBJZiBhIGd1ZXN0IGVuYWJsZXMgZXZ0Y2huIHdoaWxl
IHRoZSBMQVBJQyBpcyBkaXNhYmxlZCwgdGhlbiB0aGUNCj4+Pj4gaW50ZXJydXB0IGlzIGxvc3Qu
wqAgTGlrZSBldmVyeSBvdGhlciBpbnRlcnJ1cHQgaW4gYW4geDg2IHN5c3RlbS4NCj4+PiBFZGdl
IHRyaWdnZXJlZCBvbmVzIHlvdSBtZWFuLCBJIHN1cHBvc2UsIGJ1dCB5ZXMuDQo+PiBGb3IgSU8t
QVBJQyBzeXN0ZW1zLCB5b3UgbW9zdGx5IGxvc2UgbGluZSBpbnRlcnJ1cHRzIHRvbywgZG9uJ3Qg
eW91Pw0KPj4NCj4+IFRoZSBsaW5lIHdpbGwgcmVtYWluIHBlbmRpbmcgYXQgdGhlIElPLUFQSUMs
IGJ1dCBub3RoaW5nIGluIHRoZSBzeXN0ZW0NCj4+IHdpbGwgdW53ZWRnZSB1bnRpbCBzb21lb25l
IHBvbGxzIHRoZSBJTy1BUElDLg0KPj4NCj4+IEVpdGhlciB3YXkuLi4NCj4+DQo+Pj4+IEkgZG9u
J3QgdGhpbmsgdGhlcmUgaXMgYW55IGNyZWRpYmxlIHdheSBhIGd1ZXN0IGtlcm5lbCBhdXRob3Ig
Y2FuIGV4cGVjdA0KPj4+PiB0aGUgd2VpcmQgZXZ0Y2huIGVkZ2VjYXNlIHRvIHdhaXQgZm9yIGFu
IGFyYml0cmFyeSBwb2ludCBpbiB0aGUgZnV0dXJlLA0KPj4+PiBhbmQgaXQncyBhIGNvcm5lciBj
YXNlIHRoYXQgSSB0aGluayBpcyB3b3J0aCBub3Qga2VlcGluZy4NCj4+PiBXZWxsIC0gZGlkIHlv
dSBsb29rIGF0IDdiNWI4Y2E3ZGZmZCAoIng4Ni91cGNhbGw6IGluamVjdCBhIHNwdXJpb3VzIGV2
ZW50DQo+Pj4gYWZ0ZXIgc2V0dGluZyB1cGNhbGwgdmVjdG9yIiksIHJlZmVyZW5jZWQgYnkgdGhl
IEZpeGVzOiB0YWc/IFRoZSBpc3N1ZSBpcw0KPj4+IHRoYXQgd2l0aCBldnRjaG5fdXBjYWxsX3Bl
bmRpbmcgb25jZSBzZXQsIHRoZXJlIHdvdWxkIG5ldmVyIGFnYWluIGJlIGENCj4+PiBub3RpZmlj
YXRpb24uDQo+PiBPaywgc28gd2UgZG8gbmVlZCB0byBkbyBzb21ldGhpbmcuDQo+Pg0KPj4+ICBT
byBpZiB3aGF0IHlvdSBzYXkgaXMgdG8gYmUgdGhlIG1vZGVsIHdlIGZvbGxvdywgdGhlbiB0aGF0
DQo+Pj4gZWFybGllciBjaGFuZ2Ugd2FzIHBlcmhhcHMgd3JvbmcgYXMgd2VsbC4gSW5zdGVhZCBp
dCBzaG91bGQgdGhlbiBoYXZlDQo+Pj4gYmVlbiBhIGd1ZXN0IGNoYW5nZSAoYXMgYWxzbyBpbXBs
aWNpdCBmcm9tIHlvdXIgcmVwbHkpIHRvIGNsZWFyDQo+Pj4gZXZ0Y2huX3VwY2FsbF9wZW5kaW5n
IGFmdGVyIHZDUFUgaW5mbyByZWdpc3RyYXRpb24gKHRoZXJlKSBvciBMQVBJQw0KPj4+IGVuYWJs
aW5nIChoZXJlKSwgcGVyaGFwcyBieSB3YXkgb2YgIm1hbnVhbGx5IiBpbnZva2luZyB0aGUgaGFu
ZGxpbmcgb2YNCj4+PiB0aGF0IHBlbmRpbmcgZXZlbnQsIG9yIGJ5IGlzc3VpbmcgYSBzZWxmLUlQ
SSB3aXRoIHRoYXQgdmVjdG9yLg0KPj4+IEVzcGVjaWFsbHkgdGhlIExBUElDIGVuYWJsaW5nIGNh
c2Ugd291bGQgdGhlbiBiZSB5ZXQgYW5vdGhlciBYZW4tc3BlY2lmaWMNCj4+PiBvbiBhIGd1ZXN0
IGNvZGUgcGF0aCB3aGljaCBiZXR0ZXIgd291bGRuJ3QgaGF2ZSB0byBiZSBhd2FyZSBvZiBYZW4u
IA0KPj4gV2l0aG91dCB0cnlpbmcgdG8gcHJlc2NyaWJlIGhvdyB0byBmaXggdGhpcyBzcGVjaWZp
YyBpc3N1ZSwgd2hlcmV2ZXINCj4+IHBvc3NpYmxlIHdlIHNob3VsZCBiZSB0cnlpbmcgdG8gbGlt
aXQgdGhlIFhlbi1pc21zIGZyb20gbm9uLVhlbiBhcmVhcy7CoA0KPj4gVGhlcmUncyBhIHdob2xl
IGxvdCBvZiBwb29ybHkgZGVzY3JpYmVkIGFuZCBzdXJwcmlzaW5nIGJlaGF2aW91cnMgd2hpY2gN
Cj4+IGhhdmUgbm90IHN0b29kIHRoZSB0ZXN0IG9mIHRpbWUuDQo+Pg0KPj4gSW4gdGhpcyBjYXNl
LCBpdCBzZWVtcyB0aGF0IHdlIGhhdmUgeWV0IGFub3RoZXIgeDg2IFBWLWlzbSB3aGljaCBoYXNu
J3QNCj4+IHRyYW5zbGF0ZWQgd2VsbCB4ODYgSFZNLsKgIFNwZWNpZmljYWxseSwgd2UncmUgdHJ5
aW5nIHRvIG92ZXJsYXkgYW4NCj4+IGVudGlyZWx5IHNoYXJlZC1tZW1vcnkgKGFuZCBkZWxheWVk
IHJldHVybi10by1ndWVzdCkgaW50ZXJydXB0DQo+PiBjb250cm9sbGVyIG9udG8gb25lIHdoaWNo
IGlzIHByb3Blcmx5IGNvbnN0cnVjdGVkIHRvIGhhbmRsZSBldmVudHMgaW4NCj4+IHJlYWx0aW1l
Lg0KPj4NCj4+DQo+PiBJIGV2ZW4gZ290IGFzIGZhciBhcyB3cml0aW5nIHRoYXQgbWF5YmUgbGVh
dmluZyBpdCBhcy1pcyB3YXMgdGhlIGJlc3QNCj4+IG9wdGlvbiAocHJpbmNpcGxlIG9mIGxlYXN0
IHN1cnByaXNlIGZvciBYZW4gZGV2ZWxvcGVycyksIGJ1dCBvdXINCj4+ICJmcmllbmQiIGFwaWMg
YWNjZWxlcmF0aW9uIHN0cmlrZXMgYWdhaW4uDQo+Pg0KPj4gWGVuIGRvZXNuJ3QgYWx3YXlzIGdl
dCBhIFZNRXhpdCB3aGVuIHRoZSBndWVzdCBjbGVhcnMgU1dfRElTQUJMRSwNCj4+IGJlY2F1c2Ug
bWljcm9jb2RlIG1heSBoYXZlIGFjY2VsZXJhdGVkIGl0Lg0KPiBCdXQgYXMgcGVyICJBUElDLVdy
aXRlIEVtdWxhdGlvbiIgaW4gdGhlIFNETSB3ZSdkIHN0aWxsIGdldCBhbiBBUElDLXdyaXRlDQo+
IFZNIGV4aXQuDQoNCkludGVsIGlzbid0IHRoZSBvbmx5IGFjY2VsZXJhdGVkIGltcGxlbWVudGF0
aW9uLCBhbmQgdGhlcmUgZnV0dXJlDQpkZXRhaWxzIG5vdCBpbiB0aGUgcHVibGljIGRvY3MuDQoN
ClRoZXJlIHdpbGwgYmUgYW4gaW1wbGVtZW50YXRpb24gd2Ugd2lsbCB3YW50IHRvIHN1cHBvcnQg
d2hlcmUgWGVuDQpkb2Vzbid0IGdldCBhIHZtZXhpdCBmb3IgYSB3cml0ZSB0byBTUElWLg0KDQo+
IElmIHdlIGRpZG4ndCwgaG93IHdvdWxkIG91ciBpbnRlcm5hbCBhY2NvdW50aW5nIG9mIEFQSUMg
ZW5hYmxlZA0KPiBzdGF0ZSAoVkxBUElDX1NXX0RJU0FCTEVEKSB3b3JrPw0KDQpJdCBkb2Vzbid0
Lg0KDQpPbmUgb2YgbWFueSBwcm9ibGVtcyBvbiB0aGUgImtub3duIGVycm9ycyIgbGlzdCBmcm9t
IGFuIGluY29tcGxldGUNCm9yaWdpbmFsIGF0dGVtcHQgdG8gZ2V0IGFjY2VsZXJhdGlvbiB3b3Jr
aW5nLg0KDQpUaGVyZSdzIG5vIGdvb2QgcmVhc29uIHRvIGNhY2hlIHRob3NlIGRpc2FibGVzIGlu
IHRoZSBmaXJzdCBwbGFjZSAoYm90aA0KYXJlIGJvdGggdHJpdmlhbGx5IGF2YWlsYWJsZSBmcm9t
IG90aGVyIHBvc2l0aW9ucyBpbiBtZW1vcnkpLCBhbmQNCmNvcnJlY3RuZXNzIHJlYXNvbnMgbm90
IHRvLg0KDQo+ICBBbmQgdGhlIG5laWdoYm9yaW5nICh0byB3aGVyZSBJJ20gYWRkaW5nDQo+IHRo
ZSBuZXcgY29kZSkgcHRfbWF5X3VubWFza19pcnEoKSBjYWxsIHRoZW4gYWxzbyB3b3VsZG4ndCBv
Y2N1ci4NCj4NCj4gSSdtIGFjdHVhbGx5IHByZXR0eSBzdXJlIHdlIGRvIHRvbyBtdWNoIGluIHRo
aXMgY2FzZSAtIGluIHBhcnRpY3VsYXIgbm9uZQ0KPiBvZiB0aGUgdmxhcGljX3NldF9yZWcoKSBz
aG91bGQgYmUgbmVjZXNzYXJ5LiBCdXQgd2UgY2VydGFpbmx5IGNhbid0IGdldA0KPiBhd2F5IHdp
dGggZG9pbmcgbm90aGluZywgYW5kIGhlbmNlIHdlIGRlcGVuZCBvbiB0aGF0IFZNIGV4aXQgdG8g
YWN0dWFsbHkNCj4gb2NjdXIuDQoNCldlIG11c3QgZG8gZXhhY3RseSBhbmQgb25seSB3aGF0IHJl
YWwgaGFyZHdhcmUgZG9lcywgc28gdGhhdCB0aGUgc3RhdGUNCmNoYW5nZXMgZW11bGF0ZWQgYnkg
WGVuIGFyZSBpZGVudGljYWwgdG8gdGhvc2UgYWNjZWxlcmF0ZWQgYnkgbWljcm9jb2RlLg0KDQpP
dGhlciB0aGFuIHRoYXQsIEkgcmVhbGx5IHdvdWxkbid0IG1ha2UgYW55IHByZXN1bXB0aW9ucyBh
Ym91dCB0aGUNCmV4aXN0aW5nIHZMQVBJQyBsb2dpYyBiZWluZyBjb3JyZWN0Lg0KDQpJdCBpcywg
YXQgYmVzdCwgZW5vdWdoIG9mIGFuIGFwcHJveGltYXRpb24gdG8gdGhlIHNwZWMgZm9yIG1ham9y
IE9TZXMgdG8NCmZ1bmN0aW9uLCB3aXRoIG11bHRpcGxlIGtub3duIGJ1Z3MgYW5kIG5vIGNvaGVy
ZW50IHRlc3RpbmcuDQoNCn5BbmRyZXcNCg==

