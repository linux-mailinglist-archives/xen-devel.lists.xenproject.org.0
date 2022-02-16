Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A84B9365
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 22:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274413.469872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKSGW-0008Td-Kw; Wed, 16 Feb 2022 21:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274413.469872; Wed, 16 Feb 2022 21:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKSGW-0008Rn-He; Wed, 16 Feb 2022 21:55:12 +0000
Received: by outflank-mailman (input) for mailman id 274413;
 Wed, 16 Feb 2022 21:55:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6VyC=S7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nKSGU-0008Rh-WB
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 21:55:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ace0028-8f73-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 22:55:09 +0100 (CET)
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
X-Inumbo-ID: 1ace0028-8f73-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645048509;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4CdaV5XZvvzfZn3L7inuYC3WF1kLNIJVIbm73IUmq90=;
  b=eSuwdj8/wBar9Gh/2g5AxlWSpK+LG0e3dNltcT+DyhAOmTUIVKRZwI3V
   /61ktEpZx6wqpaRLoiFL96PVGFU5Nf/A2l5Eht4pSZM6os1HYwWG37j/U
   esfSPChPeDZVqYr2ptLswnX/9/JXd1UwhWA5JFFJSt9kaXYWASZOdMN1J
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MGqM3qF2EOW1V3YY9EPaDikB/x1v+boGNzhdvqPMl3EMIkGPC53tCoiii3jXnJ5q5jJmQGus8e
 xCSuBpmn0NTviinhcFFMFz6BlZh9U94x4XEOZ7O/nkmMb9krZDaE2h1sMY7VxySAaayeYvPoFc
 +ghZyF4wIPToJrdKObNzTULz3b985yQ8GWm3vyBlW5du9Ah4E5MBMOEQcSzZAC+NNYNrQ9lFly
 i0V3NmROYWdH8Ruh/9BHLyiugpWAyl2xueNAG3PdSWUDOhqSHRgJP6yYuUByvmGtyxcqZEdBIy
 tRwR44zgt/KgvEB5y6aXmwLc
X-SBRS: 5.1
X-MesageID: 64283443
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7yQ6jqKrkBOON2VMFE+RCpIlxSXFcZb7ZxGr2PjKsXjdYENShDMHz
 mIcCmmPbKzbYTf9Kt5yOYXl90kHvpWBnddiHQRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3OuM5g0
 dBGi6W0ClsOYOrGwvtCVh1hRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gls3JAVQaqFD
 yYfQShycEraYgNlAHssVJAws+q1q13iVhQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfQmQvrVYRUE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCs+TkCSsNVGNMD7ELR7fST6VyGWW0Ad2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPOZJhKTysDA3CMqsyq7DEzFtW
 1BexqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wMsWwnfhY4Y59eEdMMX
 KM1kVkMjHO0FCH0BZKbnqrrU5h6pUQePYiNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9408PALelM3aNqNN7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4ACXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:G8WKB6pniY6nwQ0Ybi1LOuAaV5uPL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXbsibNhc4tKLzOWxFdAS7sSrLcKogeQVBEWk9Qy6U
 4OSdkGNDSdNykYsS++2njDLz9C+qjGzEnLv5an854Fd2gDAMsAjzuRSDzraXGeLDM2X6bRf6
 Dsgvav0gDQH0j/Gf7LYUXtMdKzxeHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX272oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF2nAjv0idurD
 D/mWZmAy1B0QKWQohzm2q15+DU6kdr15Yl8y7BvZKsm72jeNtwMbs/uWsQSGqm16NnhqAg7E
 sD5RPoi3IcZymw7RjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklWqvoMRiKoLzPKt
 MeR/00JcwmBW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNB6Vs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNaAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu4hjDlhCy8vBrZbQQF++oWEV4rydSq8kc77mst
 6ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.88,374,1635220800"; 
   d="scan'208";a="64283443"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i050TjaqKDpNXd2M9VDRkxYWurWrEGo546q8gZs4EsCvhevMf+mdO1ungpDViTGtabpKJv/TRO6EhQODQftOkojBmAa+EQ1ILgGArIc8Cn9ChYKcC/IxfPuquNbBJWFTFPXPyF7ejh3j4/eSKADP2jJ1BOkQ/Vf6NWafQYiRN28u1si2sz7fEdHjJTju1lGFl3DyXqAWfLv84+EpB505eLALpPlAenu2QNVFaebN1EcKXakEZHrLWFqcpwwSLa0B19miExZT8gWVb+Q2G45kwh8xFPloSE8lPayTc4gsYyTOTSyoa1twmIbCR39tNBhhWnviVutxgpDFd4Yad24ZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CdaV5XZvvzfZn3L7inuYC3WF1kLNIJVIbm73IUmq90=;
 b=WteRwn7ARCpIrX5kbMLVWCmvUtfbHRLZCuSZVYVQq3UKIu8FcxdJYjru+ykXvmZ0QDJAYIsuunBKK5b2TidFsZKunSwM1baJJEARKl0qUsOAl6Vc+qhLT/6y/2fMNgfpQC+hB7+Ho6lplrJP/NDAjUWXNgrpMAtHitKWTNCWbo/J1efpWL2suS0PyTjwk4h0Huvu1XCq8FciFrDukkxcRjcZ5Ai717Ez2vLGGFqyA+KZA49hPxByopDC7OmANqq2g16sae0ev3s64GK3OZju0gcKboBMPNuHreV8RJbIYdmz/RM0XJ8PwN+IzlfjjVBfhd+y4MJynwUArz/UaDJ0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CdaV5XZvvzfZn3L7inuYC3WF1kLNIJVIbm73IUmq90=;
 b=bE3XRxeNTjVzoSK9M2xIVJO5AAhyZ4ohuDqzE30bn4mO3Ngvg085YxuQF44ezaB1INoAMZ5KYjrJRKBFGQs+Q/7j0l0y5jxo9gH84nz8Ae4MNspR57Wjq8N/UfpiIU2jMvnd/E23/Q7rRTjhbPi8u9yCIcg29oFT3/fe475mEMQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 06/70] x86: Introduce support for CET-IBT
Thread-Topic: [PATCH v2 06/70] x86: Introduce support for CET-IBT
Thread-Index: AQHYIaGnWFhAM4OJ5EW/0Vr9kMg6BqyUpdoAgAIWjgA=
Date: Wed, 16 Feb 2022 21:54:56 +0000
Message-ID: <b2236a34-b20e-6706-c5ab-6be5b47b8f6c@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-7-andrew.cooper3@citrix.com>
 <26bc666b-e9c3-7f12-6d8d-256311846233@suse.com>
In-Reply-To: <26bc666b-e9c3-7f12-6d8d-256311846233@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b47e01eb-9a70-4ce1-4efd-08d9f196f879
x-ms-traffictypediagnostic: BL1PR03MB6165:EE_
x-microsoft-antispam-prvs: <BL1PR03MB61656BF2E20F4243BA2FADFDBA359@BL1PR03MB6165.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Za3SUon1bTK3KXLSI9pizlCezwGLgSljHRlN74ZIvmpn/0yZe86MP0IYfIvqYA338fxSJJ2VW8rf45u/LaU1R3+tIGPgdrn99T9X9fbg4sharVP5LDfJSDCqDK12Z/yXqngKWLyi0a6J5YZ4PSecVkObrGbyH8yOCPSWaszd8wH00Gw1d3C7nOH+4STfOsZ+kmHfzGFtF/dbwfwFa0PX/avF1Qxexb4LVrpybmFmA8uOBnn1oWQjm9e5zSKWITgFZ80RVJSBWGfFsOsWROYndrhZtZrP2VGE2n4eLMr/oswypBueySF6E+r7exOQP4MF5RX/KfdMadBNSr8HA+dvrlg93LXsBQs1ou7JFUneVINWwUl9ZBuw5ixpdOe8gK5e3fCApSLE5hRU11oVwKIFo5PDOABo9m3fI832ItpF+b6TUX3oFJO4E/Z2EqrQVyV3+/7WXaGa3iTPNAR0hbDAjW0dsXGU77hM9t+Jqhoja4jnCgRFNUmxPeilTJRwOldbB6/UoSED/TJHHh8vKqX1Ez5AzDwhV17ftjjBZeOaBZib31K4RDiDh67KkyBNThx0dErDQW5lXAaGbmOuMhfvYgaXtomk8YGB1MficeZj7bU05OIYQDjfNx9Rtbcvqo/jsQh37dDtIPg+FPcluAAM0HhJ4bSXra9UVNa8uAwGMlvZxr/lJDk3hWILFRHTbqFqYQIFKG55Tvyo9d5r8s6tcMjbX7+Jwsa27MnVT/TifTXHmz0vo92AcxlqA08OI7teBIstz/luOTY0ZOFVHMl4+fCoPPm06BrL/lCTHv640lNGnyYZ8YjgO/rTAoQ8YjXiq8aVOo7NA0hTZO9p1ZOi4zsrHbyMBr4vL5MSOQByD18=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(31696002)(316002)(64756008)(66946007)(76116006)(122000001)(966005)(53546011)(36756003)(38070700005)(8676002)(86362001)(4326008)(82960400001)(8936002)(83380400001)(66446008)(2906002)(66556008)(6506007)(508600001)(186003)(26005)(2616005)(6512007)(31686004)(71200400001)(38100700002)(91956017)(6486002)(6916009)(5660300002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXFBV2ZHL1d4WUl6dkN2S1U2eFJ1M2VISDQxWFhEZ2J5L05NV3VySGF4VXg1?=
 =?utf-8?B?c2oyMUh3dCtPN1RLb2FlZHpHakNSa3ExL3ZObXhYQWIwN2ZTUmhSLy9BU0du?=
 =?utf-8?B?L1RtUjZKbkFNRy9zZXFNNEt4ZDNhamVMcnBmZzNBNnFaanlWVDB2UnpuVWI4?=
 =?utf-8?B?R0dFMHFkRFFQMjNYYkI0YTNUU2lnYkhhYUFISzdUWlFNZDhqNzJDMVNkcjNy?=
 =?utf-8?B?bStwalNoRk9EMCtsYmtkQVdpam9MUkk3by95YXNTdVlzZ3F3TXlNc2xKd0I2?=
 =?utf-8?B?ZjRRNk9mdUkxU1ZrZVdmcU4xYnplVTZNMVZhRmpDYmxyNkpPMHhpOEwyNWQ4?=
 =?utf-8?B?bVNQMVJHUmNGdGc4VldhVVFqL3lBRDZWU2c5U1lNYVk4a3ljMGkxeFNzYWxX?=
 =?utf-8?B?dytJaGRleTZJeG5HUTBpZ1lLWVVVYllrRzNIMDdwWW5xZ3BkMHVvakdOSDNI?=
 =?utf-8?B?Z0dhYXAxL3ZXbG1NRWNscjdDTGZzbGZBSURpNWt5OVNRTlk1TWhDU1JCOTRD?=
 =?utf-8?B?UU1BcUxUdlI0VFJoVlQrdFY5T2Vldks3SzJnSkdKNS8wdG92K2dDamFaYXBQ?=
 =?utf-8?B?UUZwZzRIL3pScGNVYnhmUEZ3b0R6S2FHcE9ZS2UvRzF4M0JORzhEQjVsY0lC?=
 =?utf-8?B?MTVZWm10cU1lRDdES2UvSktlQzJ3Mm9PUGhReWxtbS9TQTFMeEJZUFZqUTRk?=
 =?utf-8?B?blVHS00vc2hmT29nMVk2SGViZk5CREg4KzFHeDgwNnpLZUYydGpBZWs3WjM2?=
 =?utf-8?B?RnlaMGlUUkpIb0tlTmJENEk1dGZIVUwxZDNCUTFaa2IyUHhhVHpZelFqUnhM?=
 =?utf-8?B?Y29TQ2tRZGwvMGkwSXpndHcrdndwd2tlcld5ZElpUU5mWmpJNEU4UjRhbkwv?=
 =?utf-8?B?YjN1SVU0eDZZbDVXdnoxSWJ3V2xWRHhUSGZ5U3VmN2E3TGtKcFlHNHBMVFhC?=
 =?utf-8?B?QVU5ajM4c1NWUzJXU0NBUFQ4MkNHQ3lGT1ZCZ3E0OWJmZWliRk1JV0lzSVN1?=
 =?utf-8?B?U3ZGZFpmTXpmVlBLWXZwTFFCdThIbXduZkpaU2kyTXpveC9oTThWU21EMVBP?=
 =?utf-8?B?V21xQ3NvQ0J1aEFCY1oxT0FoNE80LzlXTEFWSWdScVBVS1pEQ2pzQm1IRlFi?=
 =?utf-8?B?WmRJRmNIbzFsZ2RWbTNzRjJrb04xMUI3NlpyV2x2bEVUL3FoenlxMmtEZ2ty?=
 =?utf-8?B?Zi9pVnZOdmhUdkVZZ1c2T2pzQXMzczB0UHFKamFobTB5SWlqSldVckZDbVFp?=
 =?utf-8?B?ckI2YjF3U0k4SnNROXc1ei8xTzZoQnRKSUphZmwyUDM3NTRSWk0xTXVBRmI5?=
 =?utf-8?B?SDkwSERVdlVBS2pLZXRQU1hPaFAzMkc1STdiZHY4ejFmQStlV1lXVWExY3Ay?=
 =?utf-8?B?MDNHc0c5REhVc0dzRUNFS2d3SVpEUU1hVjNGUDlzU3BsUE51ZHI4UWVzWFlD?=
 =?utf-8?B?c1pKa0FjQzFpYno0eGgzckJlVEEwSkhqajhveW5yV2x1aExiU1BVNzZHbDBU?=
 =?utf-8?B?a2ova3VsVnNhMTRocDIrZW5QQVVJYVB5ODU0VXc3S2JMeVJnQUdEOVd1aFJh?=
 =?utf-8?B?NWluVTFURU1DcVN4OVQrcUNJcEdmczlmN1V1WUtoTXF0YTduM0FIU3hEM1p4?=
 =?utf-8?B?Zmxkc3ZXYUZQQVFaWmpqQSttWDJrNW9LQUFack9aMjNHRFJJMnZPbjNYM3ZR?=
 =?utf-8?B?Z2Q3eGpsUmZ4MkZCMTFTNDk5SnhuMU9HMG93Q2hKc1h3ZzVOcEhnOHovcXNw?=
 =?utf-8?B?M0Q1aE9Gc2p3Ym96WnB6VnFmUzRRS2NKZWdCYnBJdDJmL1pJL0lJUStWME1F?=
 =?utf-8?B?V0lJQUZmUy9HSGU4NVgwaUVwN2VNY25wMExwL05FeWRNWmFUcVdCR1hxbXpr?=
 =?utf-8?B?S25BMzVpUTEwSHVYaktWa3ZyNzE2ZkNFKzNrU2plUENRQTFyNXUzQy9yZEJn?=
 =?utf-8?B?RVRFanVoZlAyb3ZyaEFENnhqYTV4a1RiNjFDZkp4MkN5cTZPMy9menJld3ZX?=
 =?utf-8?B?a3dTYjJoelhVTHAwbzZOUzBYYklGeEpXK2MvVk1TL2o1dDlTVkJraFBaUGVY?=
 =?utf-8?B?akpiV1FRcHhHSEpBZHZBMXVsQUgxUDVTOEhTdXRZVVlEeEw2eWlLeWdYdUh5?=
 =?utf-8?B?MDljZnExQ0kyNWJ4LzJaeklSc2Z2eHFhVU9MeXFKczU3ejcwQUNmUmp4RUpJ?=
 =?utf-8?B?UUpVcndtUFNXWm0vSGFYS3owY01ERUIyZWlFaXgzbkQyNE4zSGZHR1UrbE5V?=
 =?utf-8?B?QytTVUxVU25mMmR5TlcyejcrRTRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1A6C3EF1758444085AB4985EF35AB9B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47e01eb-9a70-4ce1-4efd-08d9f196f879
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 21:54:56.4630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f25TS4uEmkBspeLHiXY5eyAfOI/rwOU+V/a/G+2MP1B2lGXfWgn2Pzh2NWzD5UoyAG8ySCHikYL3QMOq6Wct4CSL/mjNT2ZyhyRl1v+778s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6165
X-OriginatorOrg: citrix.com

T24gMTUvMDIvMjAyMiAxNDowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTM6NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZp
Zw0KPj4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcNCj4+IEBAIC0zOSw2ICszOSwxMSBAQCBj
b25maWcgSEFTX0FTX0NFVF9TUw0KPj4gIAkjIGJpbnV0aWxzID49IDIuMjkgb3IgTExWTSA+PSA2
DQo+PiAgCWRlZl9ib29sICQoYXMtaW5zdHIsd3Jzc3EgJXJheCQoY29tbWEpMDtzZXRzc2JzeSkN
Cj4+ICANCj4+ICtjb25maWcgSEFTX0NDX0NFVF9JQlQNCj4+ICsJIyBHQ0MgPj0gOSBhbmQgYmlu
dXRpbHMgPj0gMi4yOQ0KPj4gKwkjIFJldHBvbGluZSBjaGVjayB0byB3b3JrIGFyb3VuZCBodHRw
czovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05MzY1NA0KPj4gKwlkZWZf
Ym9vbCAkKGNjLW9wdGlvbiwtZmNmLXByb3RlY3Rpb249YnJhbmNoIC1tbWFudWFsLWVuZGJyIC1t
aW5kaXJlY3QtYnJhbmNoPXRodW5rLWV4dGVybikgJiYgJChhcy1pbnN0cixlbmRicjY0KQ0KPiBB
dCB0aGUgdG9wIG9mIGFzbS1kZWZucy5oIHdlIGhhdmUgYSBudW1iZXIgb2Ygc2ltaWxhcmx5IG9w
ZXJhbmQtbGVzcw0KPiBpbnN0cnVjdGlvbnMgZXhwcmVzc2VkIHZpYSAubWFjcm8gZXhwYW5kaW5n
IHRvIC5ieXRlLiBJIGRvbid0IHNlZSB3aHkNCj4gd2UgY291bGRuJ3QgZG8gc28gaGVyZSBhcyB3
ZWxsLCBlbGltaW5hdGluZyB0aGUgbmVlZCBmb3IgdGhlDQo+ICQoYXMtaW5zdHIgLi4uKS4gSW4g
ZmFjdCAuLi4NCj4NCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hc20tZGVmbnMu
aA0KPj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2FzbS1kZWZucy5oDQo+PiBAQCAt
NTcsNiArNTcsMTIgQEANCj4+ICAgICAgSU5ESVJFQ1RfQlJBTkNIIGptcCBcYXJnDQo+PiAgLmVu
ZG0NCj4+ICANCj4+ICsjaWZkZWYgQ09ORklHX1hFTl9JQlQNCj4+ICsjIGRlZmluZSBFTkRCUjY0
IGVuZGJyNjQNCj4+ICsjZWxzZQ0KPj4gKyMgZGVmaW5lIEVOREJSNjQNCj4+ICsjZW5kaWYNCj4g
Li4uIGl0IGNvdWxkIGFsc28gYmUgdGhpcyBtYWNybyB3aGljaCBlbmRzIHVwIGNvbmRpdGlvbmFs
bHkgZW1wdHksDQo+IGJ1dCB3b3VsZCB0aGVuIHdhbnQgZXhwcmVzc2luZyBhcyBhbiBhc3NlbWJs
ZXIgbWFjcm8uIEFsYmVpdCBubywgdGhlDQo+IGxvd2VyIGNhc2UgZm9ybSB3b3VsZCBwcm9iYWJs
eSBzdGlsbCBiZSBuZWVkZWQgdG8gZGVhbCB3aXRoIGNvbXBpbGVyDQo+IGVtaXR0ZWQgaW5zbnMs
IGFzIHRoZSBjb21waWxlciBkb2Vzbid0IGFwcGVhciB0byBtYWtlIHJlY29nbml0aW9uIG9mDQo+
IHRoZSBjb21tYW5kIGxpbmUgb3B0aW9uIGRlcGVuZGVudCBvbiB0aGUgdW5kZXJseWluZyBhc3Nl
bWJsZXIncw0KPiBjYXBhYmlsaXRpZXMuDQoNCiQoYXMtaW5zdHIpIGlzbid0IG9ubHkgZm9yIGVu
ZGJyNjQuwqAgSXQgYWxzbyBmb3IgdGhlIG5vdHJhY2sgcHJlZml4LA0Kd2hpY2ggR0NDIGRvZXMg
ZW1pdCBmb3IgYW55IGZ1bmN0aW9uIHBvaW50ZXIgY2FsbCBsYXVuZGVyZWQgdGhyb3VnaCB2b2lk
DQoqIGV2ZW4gd2hlbiBldmVyeXRoaW5nIHdhcyBvdGhlcndpc2UgY2ZfY2hlY2suDQoNCkl0J3Mg
YW5vdGhlciBhcmVhIHdoZXJlIHRyZWF0aW5nIHRoZSBjZl9jaGVjay1uZXNzIGFzIHR5cGUtY2hl
Y2tpbmcNCmZhbGxzIGRvd24sIGFuZCBjcmVhdGVkIHNvbWUgdmVyeSB3ZWlyZCBidWlsZCBmYWls
dXJlcyB1bnRpbCBJIGZpZ3VyZWQNCm91dCB0aGF0IEp1ZXJnZW4ncyAiRG9uJ3QgdXNlIHRoZSBo
eXBlcmNhbGwgdGFibGUgZm9yIGNhbGxpbmcgY29tcGF0DQpoeXBlcmNhbGxzIiByZWFsbHkgZGlk
IG5lZWQgdG8gYmUgYSBwcmVyZXF1aXNpdGUuDQoNCkNFVC1JQlQgdG9vbGNoYWluIHN1cHBvcnQg
aXMgMyB5ZWFycyBvbGQgYWxyZWFkeSwgYW5kIEkgZG9uJ3QgdGhpbmsNCnRoZXJlIGlzIGFueSB2
YWx1ZSBhdHRlbXB0aW5nIHRvIHN1cHBvcnQgYSBkZXZlbG9wZXIgbWl4aW5nIGEgbmV3IEdDQw0K
YW5kIGFuY2llbnQgYmludXRpbHMuDQoNCg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2NwdWZlYXR1cmVzLmgNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHVm
ZWF0dXJlcy5oDQo+PiBAQCAtMzksNiArMzksNyBAQCBYRU5fQ1BVRkVBVFVSRShTQ19WRVJXX1BW
LCAgICAgICAgWDg2X1NZTlRIKDIzKSkgLyogVkVSVyB1c2VkIGJ5IFhlbiBmb3IgUFYgKi8NCj4+
ICBYRU5fQ1BVRkVBVFVSRShTQ19WRVJXX0hWTSwgICAgICAgWDg2X1NZTlRIKDI0KSkgLyogVkVS
VyB1c2VkIGJ5IFhlbiBmb3IgSFZNICovDQo+PiAgWEVOX0NQVUZFQVRVUkUoU0NfVkVSV19JRExF
LCAgICAgIFg4Nl9TWU5USCgyNSkpIC8qIFZFUlcgdXNlZCBieSBYZW4gZm9yIGlkbGUgKi8NCj4+
ICBYRU5fQ1BVRkVBVFVSRShYRU5fU0hTVEssICAgICAgICAgWDg2X1NZTlRIKDI2KSkgLyogWGVu
IHVzZXMgQ0VUIFNoYWRvdyBTdGFja3MgKi8NCj4+ICtYRU5fQ1BVRkVBVFVSRShYRU5fSUJULCAg
ICAgICAgICAgWDg2X1NZTlRIKDI3KSkgLyogWGVuIHVzZXMgQ0VUIEluZGlyZWN0IEJyYW5jaCBU
cmFja2luZyAqLw0KPiBJcyBhIGZlYXR1cmUgZmxhZyBhY3R1YWxseSB3YXJyYW50ZWQgaGVyZSwg
cmF0aGVyIHRoYW4gYSBzaW5nbGUNCj4gZ2xvYmFsIGJvb2xlYW4/IFlvdSBkb24ndCBrZXkgYW55
IGFsdGVybmF0aXZlcyBwYXRjaGluZyB0byB0aGlzDQo+IGJpdCwgdW5saWtlIHdhcyB0aGUgY2Fz
ZSBmb3IgWEVOX1NIU1RLLiBBbmQgdGhlIG9ubHkgY29uc3VtZXIgaXMNCj4gY3B1X2hhc194ZW5f
aWJ0LCBleHBhbmRpbmcgdG8gdGhlIGJvb3QgQ1BVJ3MgaW5zdGFuY2Ugb2YgdGhlIGJpdC4NCg0K
VGhlc2UgYXJlIGp1c3QgYml0cy7CoCBUaGV5IGxvbmcgcHJlZGF0ZSBhbHRlcm5hdGl2ZXMgZmlu
ZGluZyBhDQpjb252ZW5pZW50IHVzZSBmb3IgdGhlIGZvcm0sIGFuZCBhcmUgOCB0aW1lcyBtb3Jl
IGNvbXBhY3QgdGhhbiBhIGdsb2JhbA0KYm9vbGVhbiwgd2l0aCBiZXR0ZXIgbG9jYWxpdHkgb2Yg
cmVmZXJlbmNlIHRvby4NCg0KfkFuZHJldw0K

