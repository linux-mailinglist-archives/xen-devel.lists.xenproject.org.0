Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F204D052D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 18:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286354.485865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRH7e-0000Mh-MM; Mon, 07 Mar 2022 17:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286354.485865; Mon, 07 Mar 2022 17:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRH7e-0000Kd-Hz; Mon, 07 Mar 2022 17:26:14 +0000
Received: by outflank-mailman (input) for mailman id 286354;
 Mon, 07 Mar 2022 17:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NfF=TS=citrix.com=prvs=058fb9784=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRH7d-0000KV-0y
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 17:26:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abbcb91a-9e3b-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 18:26:09 +0100 (CET)
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
X-Inumbo-ID: abbcb91a-9e3b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646673968;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9o2/1mxb+L0ljiQl/EdESBVgRtCw8o/iccanDF5noO0=;
  b=UrE8lDSFPmUlMLMwTUKDXFiyJ998D2Tl97tbGLWW+5fIg1Riarz1fXSD
   u9ThDe+dQWkl9//s3jCVi7rKl0/39I0wSgVuO6MNmCjikp2Ti1xKj1Tyc
   D1KXIShTyGtRM6DpRkvEMpyaT9x1BwVZWa/CVGUr+XkFl27eZ7CWWZyl6
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65111729
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v/lpBKmfsji3ELwXkQOICt/o5gyFJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeX2mDbPreM2P3Kt90PYS/oEkDvZTXnNM2Sws5qH03HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1zV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYRAYjMor9s9whVgBkSSQnLbFN9e7+Li3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNGM2NUuaMnWjPH81MJ9lm6DxvUDDLRFnlny1j7UwskLqmVkZPL/Fb4OOJ43iqd9utlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ+uBwiVeewkQYARsKXFH9p/Sl4nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaJvxQQfOt7K9E/8T3Xz/PE/w2UV1ELG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4jDGJGT9bxgbQ+0RqnBNzFJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/q2rwqiD7ItsAsG0WyKJV3iEsI2OBX
 aMukVkJuM870IWCN8ebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HWfUP5GfnHI81jO50rh3SMEuOHPgXOTz8iuHADJNUIJ9YWGazghcRt/vV8F2Iq
 I8Eb6NnCXx3CYXDX8UeyqZKRXgiJnknH5Hm7ctRc++IOA19H289TfTWxNscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:Hn1NPKDehpcvHXblHegCsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsuqKdkrNhQYtKOzOW9ldATbsSobcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj4Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSXGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZjzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUjZ1TChkF2nAic0idvrD
 D+mWZmAy210QKWQoiBm2qp5+An6kd215at8y7BvZKpm72HeNtzMbs+uWseSGqC16NohqAN7E
 oAtVjpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5rD30XklWavoJhiKoLzP0d
 MeeP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy8/BreDQQF6+oXgV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65111729"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhSuXMqR7d+JED9Xjaig2kAegEROjKeesAjUrJ2yHz2/P0y+XmqBCKCqTd7zUSGIYKLeg1VejR145RrpCov57dxS5VZ7Tjb3qyh4o5tia/eI1kBfDJDRNKxgQtulALiuP1g2TGUIscDegzb6skwcjuZLxCPPwa0fxYHz2eRkqmcNtgfrvvoszPdVFjvB09YHAa+68TYMYPigYUlmf0amI79koDYxxoTKBsLNWuNVuVQ+bnvQP+n98Ohqq1mg2UEEsyZ14WE7mBKVyx9GMxFKAiRyO4Gh+on7r2fZYHUb8ACwum61roT9Ug1IvV65TQ6Ozrnnorm/nJGS7cjzJuNarg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9o2/1mxb+L0ljiQl/EdESBVgRtCw8o/iccanDF5noO0=;
 b=HyboXSSmivv48LS4QH0I2mw70nVmILI+FAVeXsPZJoIBKmiDv40FpZUhYoXk87F12AX7Bn/Pj3p1DFVGqD5Pd7ecDIbjqunJAXC1gfXZisrEpavY65C1PPmPuWiypLJ6aAkN54bwtO8XNT990uic4HM71hNEgV2DAKXjJLHnFtwkJqoXsOx42iwXdgNdwbItnFGnLZJ3tjaLuD5K0bXNsTXtSmj+M9Wei86LToV/bGlgWYrMUDEHzKavgKqxkJL4WneXX1xlkmxardH36y5x/iLFPWyv10FgyEr0C1V3xr6ikbJJDYzRsd+3wLotAjbDSMk8V6GnYisrM9pKedv8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9o2/1mxb+L0ljiQl/EdESBVgRtCw8o/iccanDF5noO0=;
 b=G3UZ+ft63kR6wIGtJpUjYtRQ1OR1LaOmvBFC1Ns7dNkR9LY/s8hagbkZ48JTQ8T4tmD9xPvEA7aJbdvJtn21CmdLKY9UEm8XMX7ucxX48MKhgYzmM2Ka5ZacEEHooWu2Dqa+Wrzy2tthtO/AJ+b/vLn9U4ikhB3iBeqWOUPLIGo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: David Vrabel <dvrabel@cantab.net>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: CET-IBT and kexec?
Thread-Topic: CET-IBT and kexec?
Thread-Index: AQHYMkZGRiX5uAcMSkGDeNGbXVStcqy0LEIA
Date: Mon, 7 Mar 2022 17:25:56 +0000
Message-ID: <b3d74444-3f63-c03b-b9b0-792363b7abcd@citrix.com>
References: <51f25a2c-4cf3-979d-9049-f301b6295299@cantab.net>
In-Reply-To: <51f25a2c-4cf3-979d-9049-f301b6295299@cantab.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 010c6580-157a-4a22-0845-08da005f8a42
x-ms-traffictypediagnostic: SA1PR03MB6564:EE_
x-microsoft-antispam-prvs: <SA1PR03MB65641B6B26EC73EF9755EFEBBA089@SA1PR03MB6564.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ckp1VQ+jIix+gLMU8x1Rhp6LoRiVmc9dRPaJGByuVa1AEIuYaLj1vm7xjDq8vxU8XGZ0Ee5qKI65resh67wASGEOPeHKd/+E7dH67BURCgb6xZyr7p7j0knvTm8OY0N9rUKPO1OEmWxMpW1ARNi1TpbvF3Aps0b5jt0xOJ81Q5rti7y2Mh5Np9dF7rjAHBs5qFU/7aHKb1ECL6JNLKg0/ObcMyxwQ0edKPCLzbnE0BpAUjvlKaAO6eLZwenShGGHDuHPckxWzMgXSKVuKciDC/8Hh84j9aDpBuOybi2mIgjnAkOxovPHs/iDD+S+z+oxFUgFlZepenCfdwweAUZscYs7AK88rB7CXxFiiMhwfa1WnNkqTSxJRibkszz69wF/+JLsHHVBOV2llN2um0OuMZVtvB9I5EaoN/3gkQiH2ipjDYd1lQhAEF86BO7ymC2Q4+JZhykxHnOMiLY4+Slrn1NOxDVGEAarjxVOMTmpEuSZBjy+VVxnEu7ygN1wxs2lPF6POT6fPDrviq8NmLoGTUDKLD+4P1TlVgPFcancJBVE6AW9y2shgNJ1LggTvfBPq6wl904GO7mXF1Hs6NjJnel9sSWmvm5hT5WUWXr56Z/urGDQyFefgxvlAbvsmC5ecjXhmaGd0XA7Fyn8XKWTU5qm15mIz7Eid/5JCbAfAUFfMt/no0HYRWu+SIX9t4kNMQ2lL1GSMbvocRfRO/tw4iG+rDc8/7mma/rFcWj3ucM5fYKuc7S4NRD2alK3Eg3iaLyqKdLJ+Hryx30oUJF4Kg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(26005)(71200400001)(508600001)(107886003)(2616005)(186003)(6512007)(53546011)(86362001)(6486002)(82960400001)(6506007)(3480700007)(38070700005)(83380400001)(38100700002)(122000001)(8936002)(5660300002)(31686004)(8676002)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(2906002)(36756003)(4744005)(110136005)(316002)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0MyQ2dsTUN0by9Wc2QySkhwcHMxT0VybVZ6akdlWnMzN0RYZVRWUkhBTjVK?=
 =?utf-8?B?Tkd6T0NkNU04cFJkUEZwTHNaeFMvSEdiK0c2SkxmLzZUbWIvaGpzUGZocEh0?=
 =?utf-8?B?YmpwQzh1MVR3Wm5nUWJnRzFqUFNDQmpOcWJtMmZvUFA4Q3pWbm4rMTBBYXB2?=
 =?utf-8?B?SWlMcStCa09FKzNtbzc1SFUwQkt3SytkUFVFRmZhVW53Rkg3Z2lHWEFseUI1?=
 =?utf-8?B?anBnUlppWGlVQjhrYm9qQTBZMEVTbUZxcllTQ0F2UmtFOVU0SFh6eGJhVk44?=
 =?utf-8?B?dEQ2aDVsUG9pU010UDlwM3hkY0htaUtlRDJMbytjZkNJY1pTZ2dQT3BCUm9y?=
 =?utf-8?B?T0k2cUJZMXgzUEpSWU5UdDVJZmdqUUN2Z0M4M1FsL2xOdWIrQVNOcEZDZFg2?=
 =?utf-8?B?UHBEUGplR2N3Ly9NendRVzJuWDU4ZGhUYmw4dU5EbkMrOHNnUjdnRjZwcEwr?=
 =?utf-8?B?UEF5Wml3alMrYVBVNDhJektXK1pDa2JBNm9SNi9XWVJ4TmJ0QXMyWEg5Snht?=
 =?utf-8?B?d1BUMXl3N2ZOd2NIcS9PR3RGRGtOUkV1RGlkbEZxK2ozcElaelplM3ZpNlU4?=
 =?utf-8?B?YjNaZzUzOHFscUlwVHdNQkVPaHFsb3FGQ2hzQ0RlWjRDeW51dzZqQytSS001?=
 =?utf-8?B?N2MvSFNNL3lycmNZbzlOaTJvTzBqOUYvVTdlaXlUaVo1OUZDLzhOMjVvQ3h2?=
 =?utf-8?B?VXJRMmNmbTRLTnJTamRTZVNGanhUYk5oRTNReUlVY3E3VXpGRGRZVG1MRFZT?=
 =?utf-8?B?UjBnTmF0RjBBaW12ZmxXODZYZDNLb0ErVklncUYxbkZISncxQmdrQXQ5NFBK?=
 =?utf-8?B?dlRqN2hZcFZQSktEa3R4ZWZ2R2dGMGNWbmhlaDdLZFVwaU5Ub25iczNSYWZH?=
 =?utf-8?B?NFJWOE5TRnVuVEVhUDRSeWtBajdxaG1VSi9xd1Y5R3lqS3JDRGlwUVppSVV5?=
 =?utf-8?B?VUxPUEVPZlZDYnNoUDRUNnZMd0l6eGNkM2JuVnhDNWRFQ3JyU1c4KytUYlJJ?=
 =?utf-8?B?WFh2ZkdlbVpmQjl3ckVXRXBCM01jbWFjbGk0dEtxSENnRUxkQXdocnl1cEE2?=
 =?utf-8?B?U1lDazVWMWVOUVhqTXB3SFJJamljTmlKajdsd3ZGVmxKcmVRTU41aXVMMDBs?=
 =?utf-8?B?RGRVdGVxV2xSeGtLVE9mZWN3dGRGeU5pZzV2VjZxc3lDbG5nWGZNOGs5ZFAz?=
 =?utf-8?B?V0JwLy9zMUU0dW9mRVhUQWFiQzBFQnVQTEVqdEY3VjhKN2g2Z2hzOVdNZ0lX?=
 =?utf-8?B?Vmh3ZDdFZks0cDZVeXVZekptVlNuUklROUlrNCsvZW4yR3hBd2xEOWxOTVRs?=
 =?utf-8?B?TnZsa1FUSmhyVllOUGNwZzJYWVNoby9wd0hCd050elMrTXF0VmFUaWdSTDZ3?=
 =?utf-8?B?bGRyVTRNYjR5RGdOMWd2YlhmS3Bhb3U2U2FSUnBPUEhnZWtFdWxYZWI0NjFi?=
 =?utf-8?B?cGxqRExYVnNsK2czU094TVlYMmhzVUdpeTltc0dVMFlML0d3dFRMSmJFeFB4?=
 =?utf-8?B?dE9XREdjTyt5bzJNZ0xWNzhmam1QY1JiRTRLeWg0VWFRNHJFcDUvYkVhR09s?=
 =?utf-8?B?ZjlrajNIZnZQM3BsWTZWL25mZElKNVFaZEExWnNIamJIYVpzK3lqbmZWNDda?=
 =?utf-8?B?ZWtWUzJHWEdTWUQzOWJBd0ZJZjIvU2J0U0piQ2xrbWg3L1lPeG5uWldDQlNF?=
 =?utf-8?B?WDVhZ3Q0cndMZ2svL2VaYzFJYWF5N2RDNEh5Q2N2RjFvVmI0ZzZoNlYxS1Rm?=
 =?utf-8?B?QklRbDRrNHdvdDNTMmNJeWE5bjZYdExvdVZhRHF1ZVpIOFJ2RndoVlpWajVl?=
 =?utf-8?B?ZzMwQnh6QTFrSFhHWVN4czhCYk55eEEvMUs0bXcxVlZoTDZUd0QwcDZSdHZr?=
 =?utf-8?B?aGJ2Sk9YRFlWNHIzT3dIYWtBZTFQL0gxajBZc2dZeUkrUFUxYk5VNGpoc3hv?=
 =?utf-8?B?eXlkalhZZysxM21iTmVtaFlsRHRPYWJDbmpzOFFnN1VZdXlWVTNRYm90djZU?=
 =?utf-8?B?NFJTZG9tSVFlTTE4djhkRG1sdUE2c1MycUdGcU1KNEdwRHFITWE0YThCR1d2?=
 =?utf-8?B?VnZBVHRncC9JNG1GMGZXZ3g2SXVBcG9XR2JobXpmUCs3Rnl0aGFYUDdBdEVo?=
 =?utf-8?B?cXJqekVFaDlpa3FZTXM5ZFM0QWY0WWRhd0RGVFNkRDc3RnBQL2llRzQvWFhI?=
 =?utf-8?B?OVdxMnB1Mm9wS1lKMFpPRVd5bVZLbllhdHRmeE5qaGZ1R01hbGl2UERLekx6?=
 =?utf-8?B?S0c1SHRFbkJWaWxkb0VXaThaL2p3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9B45C2081E6834199104D60647C1D68@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010c6580-157a-4a22-0845-08da005f8a42
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 17:25:56.6885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpt8DqHIOSJUeV6XIr50ruVDeeR3x8ri76TB0yxUw+OAOMpdU252jmhWVKKs09dzD2rIPyf5BZn3hxpL0xwDN/A3Hso7fSR5kJVaDBOyAGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6564
X-OriginatorOrg: citrix.com

T24gMDcvMDMvMjAyMiAxNzoxMCwgRGF2aWQgVnJhYmVsIHdyb3RlOg0KPiBrZXhlY19yZWxvYyAo
c2VlIHhlbi9hcmNoL3g4Ni94ODZfNjQva2V4ZWNfcmVsb2MuUykgaGFzIGFuIGluZGlyZWN0DQo+
IGJyYW5jaCBhcyBwYXJ0IG9mIHN3aXRjaGluZyBwYWdlIHRhYmxlcy4gSSB1bmRlcnN0YW5kIHRo
YXQgaWYgQ0VULUlCVA0KPiBpcyBlbmFibGVkIHRoaXMgd2lsbCByYWlzZSBhbiBleGNlcHRpb24g
c2luY2UgdGhlcmUncyBubyBFTkRCUjY0DQo+IGluc3RydWN0aW9uIGFuZCAoYXMgZmFyIGFzIEkg
Y291bGQgdGVsbCkgQ0VULUlCVCBoYXMgbm90IGJlZW4gZGlzYWJsZWQNCj4gaW4gbWFjaGluZV9r
ZXhlYygpIHByaW9yIHRvIGNhbGxpbmcga2V4ZWNfcmVsb2MoKS4NCj4NCj4gSGF2ZSBJIGNvcnJl
Y3RseSBzcG90dGVkIGFuIGlzc3VlLCBhbmQgaWYgc28sIHdvdWxkIHRoZSBjb3JyZWN0IGZpeCBi
ZQ0KPiB0byBkaXNhYmxlIENFVC1JQlQgaW4gbWFjaGluZV9rZXhlYygpPw0KPg0KPiBJIGd1ZXNz
IHRoaXMgd291bGQgYWxzbyBiZSBhbiBpc3N1ZSBpZiBrZXhlYydpbmcgdG8gYSBpbWFnZSB3aXRo
b3V0DQo+IENFVC1JQlQgc3VwcG9ydC4NCg0KSG1tLsKgIFdlIGNsb2JiZXIgQ0VUIGluIG1hY2hp
bmVfY3Jhc2hfc2h1dGRvd24oKS4NCg0KQnV0IHlvdSdyZSByaWdodCAtIHRoYXQgZG9lc24ndCBj
b3ZlciB0aGUga2V4ZWMgcmVib290IGNhc2UuDQoNClRoZSBjdHh0X3N3aXRjaF9sZXZlbGxpbmco
TlVMTCkgcmlnaHQgYmVmb3JlIGNsb2JiZXJpbmcgQ0VUIGluIHRoZSBjcmFzaA0KcGF0aCBhbHNv
IG5lZWRzIG1vdmluZyB0b28uDQoNCkknbGwgZHJhZnQgYSBwYXRjaC4NCg0KfkFuZHJldw0K

