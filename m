Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E525F0B1C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 13:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414176.658314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEbf-0002sq-T1; Fri, 30 Sep 2022 11:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414176.658314; Fri, 30 Sep 2022 11:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEbf-0002qT-Os; Fri, 30 Sep 2022 11:55:03 +0000
Received: by outflank-mailman (input) for mailman id 414176;
 Fri, 30 Sep 2022 11:55:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7LLR=2B=citrix.com=prvs=265fc461d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oeEbe-0002qN-6A
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 11:55:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4f130eb-40b6-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 13:54:59 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 07:54:52 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5102.namprd03.prod.outlook.com (2603:10b6:208:1ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 11:54:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 11:54:49 +0000
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
X-Inumbo-ID: b4f130eb-40b6-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664538899;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8YYF/cnDZqENZwZKC0XF58Oanh/6Pdqhed9NsNBsj04=;
  b=XRvH5DIwuFdEGuYAT+35z/R2hlqaVxtWA7B+Ejc+NTORRQZMf1a7m51y
   2ES7u3nl/ZdhPHkX79e0zwb+l7dhl4ADscdGZ924doDqTbGg6C34b2ov2
   5OoNaoh2k8jQPHA1/5Y1B+ZuMYTTkcHVMgA8POWyRKlu2lGxc28zEFRC6
   k=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 81352186
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5wbYuK5NG9dZ08cUEO3JtgxRtB7GchMFZxGqfqrLsTDasY5as4F+v
 mAYCj/UPfaINzbxe9h0boy+phkPup/Wyt9iG1drq3tkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPYwP9TlK6q4mlA7wdmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5qWiJQy
 6MXMgtTawzev/71xZmkb8Vj05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLl2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzXqgBdhLROPQGvhCgh6a6TcxJ0ctf3ySodiBsFOeXIoYN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACA4aud/qpdhrigqVF444VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:vYNqP6jquAoKSQ6VbxMRtT4TY3BQX3l13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3PARDAhKd/apw7gpPCcxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfZsRKEkjTRo+a07bVTHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZek6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z74HSKyGG5fIyQZ0Wf9igF3ekJhlTVfsuaDQSTDFYzjsCnv/ITRsXGRv
 fbAuMlP8Pe
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="81352186"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ngy22XyzvK9eZZG0QekNFveK6INVQS4Bo/6oEPeU/0I8S0j3KMdOHrQwDVZ40TSYPVt5KQyh1+bbA80nrSyr31G2ntpyWMWBgJp2jFR5mUIO7420Q7lUOz/Zx/dWE5df/MRzqHincij5W470NLi+xGSFxBa6G88fLFBlRVcCACdMFZK7xz94V4w+g+5m/TPzK5mArU0RsoilMZts5Slv2C1vHzM3K/xRJUv1iX34opvVnRNbeUe72HpiU04DtVo2DRxKasJRR738Ln+j3n6KVn6AmU4yb6/bsrAvwm3i9NvgnjPsEr92aGjdRagVGNx+Mqmc3UP1ZevDrMV6AchROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YYF/cnDZqENZwZKC0XF58Oanh/6Pdqhed9NsNBsj04=;
 b=fO/OaoSucwEcNUWyrMjuawSJQMGYExhdx+BIxuT1MeIc1z0r368/RUd5FHhnSlPWssrxuYDyFKJ8IwOOlfwiEzmmEjSipXBqqeffIXtD0wH0JyVO3s0WDYJD5ruI3VHw30oQ+kIPyDJ+nVs+00fcJNRNH4+HQ/XncL/PHu+TBhCSNxYq0YxL6uf/WSc42i0HvTYB1ztF5Oe6zwfLKepdOBVWtL8QWJ0MiONnsFTCWnme2IpEO7SSysyWkR0up/aD7E401lT7Y3a6zxqDmpTbn9M4eWwYSYGidc+s2l6mQHHNj2KlMT3DbDFNgTVz4sXpso2JGwpH9xTXEABI/6U0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YYF/cnDZqENZwZKC0XF58Oanh/6Pdqhed9NsNBsj04=;
 b=Y0IDtsjTL01aRX+3mPYZPYRbzGOL5nSG+eefRTmDqq0lVDtTqqb5tZaU9O5QDW5RFTXKV3MQOv+95M2mxqkW/lZ3XboqzQMzeC+cIxHpWIqgvQX9igKD7WafycHeOg5Qy+nykwtCySo8GzowJHNXUvw/2CoElVA87xnSK5i7ZoY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/NUMA: improve memnode_shift calculation for multi
 node system
Thread-Topic: [PATCH] x86/NUMA: improve memnode_shift calculation for multi
 node system
Thread-Index: AQHY0o0ZBOomZIkt5kiwNmpgdKrIoa334ciA
Date: Fri, 30 Sep 2022 11:54:49 +0000
Message-ID: <21e773a0-9082-86de-be81-9fcc8ea2e07e@citrix.com>
References: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
In-Reply-To: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5102:EE_
x-ms-office365-filtering-correlation-id: 47b9895c-8469-427c-61ec-08daa2da93df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9/VnU0zbCAHub2jsMf+zvOMlUf6f1BdPZoNpPzmtzi4x01lxSTmEH3ttqffz6yPSrjRlnHsf4uVK0WobIjthWdq9US6CoG6bQkE6xfuhYpmwPb2Pozo1+abOw3nW1yaUFrVuiuYhDp+tnKgNWhxqObvBDLmSFip18HdZQvaHcoij3A+Cp3Cyccwcb3GGAD2B10UpEkO6NKcNmRlqendENUfqXN8g4m++ik/M1GzoHeBvrNQ6UILeCsogiAn1tEZNgl7vpXJyKowfgOhFq2AHOjF7Kp5yi60kwLUHwROMKW85G6+y4Pb4I4rCKnb8zmaAjRN3Aq/Gd7iCjTV5m+h6KZcShhB+r3qDMxAg+I4+n46hbMXCD/K9IEcHqQQP1/aWt0VbjNdENfCtHI3IuiYUxRq3Y2oQ/+nLahZpo/T2kg3fOLpIWaYXuz3q4t5BciGga6gxjm/e5d1ru/naUaGBwsDzkL5VrU+IXOaIwoW1FdS2ceuWAMra8SrOh4Gf0djB7hhC7VyGn5mlGVm/s+LiXN2uP/bAVhc/6rJxla13e6g/JplwJR3XEtEnkORsTMZmB8bG/gq23COUoHNUYxxuOv6dTUCeWxWiDmpk+RVLk+dIEEaN/2W0fNyimRNaSCeJuwAQQv6OZZCJb1VVxJDWw8Q3Pbd8W4k5BHu4vvXAK17HpirafgnwAwAqTiAhnEwCW0/kSEQVC+KdETgK9kBtxS0OO5NHLhezNYAeJ2y4bGhcOQnfdg/zoLc8g+UngfUh7u245ehiSgAnejxJsBKD40GJEPlA2awzJSan32dxvNlVBbOnNl1q7jNAi5jYoAAj23jUQjHUSyD9gSOodanB3w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(83380400001)(82960400001)(110136005)(122000001)(91956017)(6486002)(478600001)(2906002)(76116006)(66476007)(4326008)(64756008)(66446008)(66556008)(66946007)(8936002)(107886003)(6506007)(41300700001)(53546011)(316002)(54906003)(8676002)(36756003)(26005)(6512007)(31696002)(86362001)(5660300002)(186003)(31686004)(71200400001)(38100700002)(38070700005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjN1UGwxV3pPVndPMWpQdEx2aTVjRzUvdy82YWJLV0dENi8rVk43dE02NlpK?=
 =?utf-8?B?clEzMHVaRWNZWUluRkhZMm83UjczSVlFVlRvRUE5dktOa3MwNXdIVzA0ZDBT?=
 =?utf-8?B?bzAzNWNmZHh6TDc0ZjBjWmtSOGpMbjZocGxVaW9DaFE2WXl3VHdqZXB0N3dv?=
 =?utf-8?B?RjU3dWgzcUZocm92VFRGSzh6NjhrU0xxZ0FUbFBCLzlVR0drSTRld1VHcCtY?=
 =?utf-8?B?NHlOWGdSY1BJdUpPc3ozeG5waFZKRlVLSFZJb2dTbWNaUjd0RjlZT1RxbTJt?=
 =?utf-8?B?WnMyY1lITThENkN6VWRqTG1wN095LzZHdWxiWUVRakV3STlHajBsYXlyWmMr?=
 =?utf-8?B?VDJ5TnU5RGE2cStvMXQ4ZUxZN3pTNUhzUUFaZmRMNmlZZG52ODBnRE9qcVBw?=
 =?utf-8?B?WThnN0swTi82Z1Z1STB1dERNeDNKbGtzSUdJQmVvc2xDZHFhN2dXQlprbjV4?=
 =?utf-8?B?WVJ3dG1LdUVKSFFlR3RjcUI0VlAySVp0YXZMSm9aZzZOeWlGdUtFdUxHcWZw?=
 =?utf-8?B?RjN5bGxPT1psWHdOK2ZqdW55eXArVUx4K2g2d0ZUeEFHdGVWUEU0SExzL2ZJ?=
 =?utf-8?B?UTBvYUZUZVYybVpSUDNiR2hPWWxiMzhNZDdmT3JoNlFnNDk4ck15VUUrNkNZ?=
 =?utf-8?B?cDFmR21acEFPckVtaXlucmFHdm1iTFFHSlpXQTI0Ukx6OHlhRDFRNGRjclFH?=
 =?utf-8?B?RkdLeG1uQ3YxU3JwUGJGTkxIN2N0WnJpTlkrWTJLSUVyclMxdkdSRGloVnM4?=
 =?utf-8?B?Nk9ucUZMUFd1V1htS3p5M3YrR0tFY09ZRGQ1QmRWWXFjVmR6TXFWYmRuZTdC?=
 =?utf-8?B?REM0YTh1UmRuNFF6Umw4SVY3WlJVSzU0a1g0TkxPWEZ5KzF3V3B3K0gyTFRt?=
 =?utf-8?B?enB1QzhRVVI1SkpkcUZaejlrQzB4T2ZTYnFOY0pxTjNaeTg1YUs0MStzQnpN?=
 =?utf-8?B?MEZHc1R3Y0daYURMM0VrWWRZTVJ1cXJLVStjejlkZVo0OEcwWFp5S3ZFWDFy?=
 =?utf-8?B?aUFsSGZUQzZhWlNEVkRzTWsyMDlQTndsN2lPc0ZBZ0RDZEt0NDJKT0lsd0wx?=
 =?utf-8?B?TlZHSWc3STlYLy8vd3BQMG1HdCt3VkxJTlFtdlQ0YU9uNnArc3JOclVUZ1p5?=
 =?utf-8?B?am9LNVl1OC9tMENvTi9ucnFvdEE3bkpYL1cyeXJBUEg5V2FtRDhUcmY3dURp?=
 =?utf-8?B?TkNBQjNMazhqNHVBdnIvR2ZWZ3pEVXpyWFRmdXNCMjVNQ1k2T0Nmc1RPdGh0?=
 =?utf-8?B?RWUxTkpVTUYzQWxvT3VvckdFK1FPem1PdGI4Y29Pd2g1VlZaczB2QlQ4SU10?=
 =?utf-8?B?SVVzT2ZwVE0wNkdUUHhqbytiNzhadDdWRkozaGpyWWE2WWMzUHFLaWs1a3RZ?=
 =?utf-8?B?bVdIN0VVRGF2YmhyV3M1KzIzMjluRFJxYW8wZWl4cjlEbmpiMlp2S2VXcElC?=
 =?utf-8?B?YlNTVk1PZXpwRTBXNS81VGVaWVNTaUV5dU5oVmpLOFAzbWI0NUNEalcxMG8w?=
 =?utf-8?B?M1ZvVmlkMDl0OTdNcFdjc2xEcG1yVHN5dWV3MHFsWFJEWk5Ed3pEenQwbTky?=
 =?utf-8?B?dEkwdTFOR000QTNCRlpEYVN6T0E5VTVoejBrNDUrdDdwdjVDdG1vSlN4b0ow?=
 =?utf-8?B?bjVFeFNtVzBRWFNPV0ZaSGRuYkNocUJXQ1dDNVhhVGREOExGdmE1LytDL2Iy?=
 =?utf-8?B?c3R6V0FDeitXT3ZlRlhuOUdwYk5XMkc5NS84UEhQVXhsdlJjSFpzMFM2MWo5?=
 =?utf-8?B?cHkrNmNMQjhTamZPVGFXWC9sT2VQQjY4cDljQWxNWER6dzYydkRTU0dHSTFO?=
 =?utf-8?B?ck1hT0NQMFZUZ0hqcHR6V0RrT2c2cElpNlE0ZHV3U1BLT29ZMmxhalJRYWFk?=
 =?utf-8?B?L0pGM0V6ZW1BUWhXUk9ueDVPenhBSXdKWHVkTG1qTVdHcVJRREVzMGY2SklJ?=
 =?utf-8?B?RlUxKzk0aThIc3I2UWlWR2xLL1V4L0o3VUYxWVdURlkvMWtrbUhJKzBnL2tM?=
 =?utf-8?B?em1CZWVsdEZpSWhNalVhS2loekFabERVRUZoeCtsZHVSSEV3VllOZkxyQjZi?=
 =?utf-8?B?OTl3VmlhSW1JNmpvRjhHYzZLUkJPZmxEcGlpckpHUVRrM3RlRXV0Y0h1dWQ2?=
 =?utf-8?Q?2sQyns//tGtOQ8zggbsTwGy37?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D018FE1A05C10418CCD65C60D9C11E4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b9895c-8469-427c-61ec-08daa2da93df
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 11:54:49.3338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmsCfkmRsAaoEgNEmKAsbHfNxDDnCAHFsl+fpuNf72I+ofoj0WbYFJGlcJrPE1P8nlX4lW5bY1CU45v5zOSiR4tjD+824W37r8GIMlgfru4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5102

T24gMjcvMDkvMjAyMiAxNzoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9zcmF0LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L3NyYXQuYw0KPiBAQCAtNDEzLDE0ICs0
MTQsMzcgQEAgYWNwaV9udW1hX21lbW9yeV9hZmZpbml0eV9pbml0KGNvbnN0IHN0cg0KPiAgCSAg
ICAgICBub2RlLCBweG0sIHN0YXJ0LCBlbmQgLSAxLA0KPiAgCSAgICAgICBtYS0+ZmxhZ3MgJiBB
Q1BJX1NSQVRfTUVNX0hPVF9QTFVHR0FCTEUgPyAiIChob3RwbHVnKSIgOiAiIik7DQo+ICANCj4g
LQlub2RlX21lbWJsa19yYW5nZVtudW1fbm9kZV9tZW1ibGtzXS5zdGFydCA9IHN0YXJ0Ow0KPiAt
CW5vZGVfbWVtYmxrX3JhbmdlW251bV9ub2RlX21lbWJsa3NdLmVuZCA9IGVuZDsNCj4gLQltZW1i
bGtfbm9kZWlkW251bV9ub2RlX21lbWJsa3NdID0gbm9kZTsNCj4gKwkvKiBLZWVwIG5vZGVfbWVt
YmxrX3JhbmdlW10gc29ydGVkIGJ5IGFkZHJlc3MuICovDQo+ICsJZm9yIChpID0gMDsgaSA8IG51
bV9ub2RlX21lbWJsa3M7ICsraSkNCj4gKwkJaWYgKG5vZGVfbWVtYmxrX3JhbmdlW2ldLnN0YXJ0
ID4gc3RhcnQgfHwNCj4gKwkJICAgIChub2RlX21lbWJsa19yYW5nZVtpXS5zdGFydCA9PSBzdGFy
dCAmJg0KPiArCQkgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLmVuZCA+IGVuZCkpDQo+ICsJCQli
cmVhazsNCj4gKw0KPiArCW1lbW1vdmUoJm5vZGVfbWVtYmxrX3JhbmdlW2kgKyAxXSwgJm5vZGVf
bWVtYmxrX3JhbmdlW2ldLA0KPiArCSAgICAgICAgKG51bV9ub2RlX21lbWJsa3MgLSBpKSAqIHNp
emVvZigqbm9kZV9tZW1ibGtfcmFuZ2UpKTsNCj4gKwlub2RlX21lbWJsa19yYW5nZVtpXS5zdGFy
dCA9IHN0YXJ0Ow0KPiArCW5vZGVfbWVtYmxrX3JhbmdlW2ldLmVuZCA9IGVuZDsNCj4gKw0KPiAr
CW1lbW1vdmUoJm1lbWJsa19ub2RlaWRbaSArIDFdLCAmbWVtYmxrX25vZGVpZFtpXSwNCj4gKwkg
ICAgICAgIChudW1fbm9kZV9tZW1ibGtzIC0gaSkgKiBzaXplb2YoKm1lbWJsa19ub2RlaWQpKTsN
Cj4gKwltZW1ibGtfbm9kZWlkW2ldID0gbm9kZTsNCg0KVGhpcyBpcyBub3cgdGhlIDR0aCBleGFt
cGxlIHdlIGhhdmUgb2YgbG9naWMgd2FudGluZyBhIHNvcnRlZCBhcnJheS7CoA0KKHR3byBleGFt
cGxlcyBpbiBBUk0gY29kZSB3aGljaCB3YW50IHRvIHN3aXRjaCBhd2F5IGZyb20gdXNpbmcgc29y
dCgpLA0KYW5kIHRoZSBWTVggTVNSIGxpc3RzKS4NCg0KSSB3YXMgYWxyZWFkeSBjb250ZW1wbGF0
aW5nIGRvaW5nIGEgc21hbGwgbGlicmFyeSAoc3RhdGljIGlubGluZSwgb3INCnBlcmhhcHMgZXh0
ZXJuIGlubGluZSBub3cgd2UndmUgc3RhcnRlZCB1c2luZyB0aGF0KSB0byBhYnN0cmFjdCBhd2F5
IHRoZQ0KaW5zZXJ0L2ZpbmQvZGVsZXRlIG9wZXJhdGlvbnMgYW5kIHRoZWlyIGRlY2lkZWRseSBu
b24tdHJpdmlhbCBwb2ludGVyDQpvcGVyYXRpb25zLg0KDQpUaGUgc2Vjb25kYXJ5IHB1cnBvc2Ug
d2FzIHRvIGJlIGFibGUgdG8gZG8gc29tZSBhY3R1YWwgdW5pdCB0ZXN0cyBvZiB0aGUNCmxpYnJh
cnksIHNvIHdlIGNhbiBiZSByYXRoZXIgYmV0dGVyIGFzc3VyZWQgb2YgY29ycmVjdG5lc3MuDQoN
Cg0KRm9yIHRoaXMgY2FzZSwgYW5kIHRoZSB0d28gQVJNIGNhc2VzLCB0aGUgZmlybXdhcmUgZGF0
YSBpcyBzdXBwb3NlZCB0bw0KYmUgc29ydGVkIHRvIGJlZ2luIHdpdGgsIHNvIHRoZSBzZWFyY2gt
Zm9yLWluc2VydGlvbiBsb29wIHNob3VsZCBsb29rIGF0DQp0aGUgbnVtX25vZGVfbWVtYmxrcyBl
bnRyeSBmaXJzdCBiZWNhdXNlIHRoZSBvdmVyd2hlbG1pbmcgY29tbW9uIGNhc2UgaXMNCnRoYXQg
dGhlIGVuZCBpcyB0aGUgY29ycmVjdCBwbGFjZSB0byBwdXQgaXQuwqAgSWYgbm90LCBpdCBzaG91
bGQgYmluYXJ5DQpzZWFyY2ggYmFja3dhcmRzIHJhdGhlciB0aGFuIGRvaW5nIGEgbGluZWFyIHNl
YXJjaC4NCg0KT2J2aW91c2x5IG5vdCB3b3JrIGZvciA0LjE3LCBidXQgdGhlcmUncyBhIGxvdCBv
ZiB2YWx1ZSBpbiBzdWNoIGEgbGlicmFyeS4NCg0KfkFuZHJldw0K

