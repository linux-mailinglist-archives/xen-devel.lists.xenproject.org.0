Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AF4BF6B7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 11:54:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276644.472871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSoW-0000TR-Pg; Tue, 22 Feb 2022 10:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276644.472871; Tue, 22 Feb 2022 10:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSoW-0000R7-ML; Tue, 22 Feb 2022 10:54:36 +0000
Received: by outflank-mailman (input) for mailman id 276644;
 Tue, 22 Feb 2022 10:54:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMSoV-0000R1-6q
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 10:54:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d04b9e50-93cd-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 11:54:33 +0100 (CET)
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
X-Inumbo-ID: d04b9e50-93cd-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645527273;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GFaI6nSJKdNx7VzF9bzjMSUNMRy0c0wLRen1E+fsKDY=;
  b=HvEotSkD3ka7d/FEIQFodvSb0WaAN9wJ4uTnJ4uFugd9Ld6aE1I+0bCx
   MFWxLgPXFWMSlOJL9od6MKfFVxKnMmFcO0BWkfHd3WJ2Vmbe42oF7oUIA
   X03WZT677dYgQkSVyjwy/EbTTZ6/Xsj7l+QBTLVLk8zrQlWukMQu3G3Zh
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66959630
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v3dIAqxb5j73/oRZMvZ6t+clxirEfRIJ4+MujC+fZmUNrF6WrkUOy
 TcYUDuCbKmIYjSmf9l/bI/k9UgOvpPcxtYwTQJoryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy24LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npltoe8c1xqIbPwvL49aRxbGAx/Jp1I0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 ZtEOGQ0NHwsZTVvHl0dUJAjvN6RuUClKx9/jlCLjoMOtj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6C7mQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+4h5DvWibXK3yLDJlIBTTVsaccWuuZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZP2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1b5paKGK0O
 hOK4Wu9AaO/2lPwNsebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGNr9ZIdAhSdSJT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAVzihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:lFLtTq3njdpy3Giuv8MF4AqjBRxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hfAV7QZnibhILOFvAt0WKC+UytJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZi6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngcOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4kzEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXMISaCUmRQXee
 v30lMd1vdImjTsl6aO0F3QMjzboXMTArnZuAalaDXY0JTErXkBerV8bMpiA2XkAgwbzYtBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIfLH4sJlOy1GkcKp
 gnMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNxd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDhRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvP22J6IJzYEUaICbQxFrEmpe4PdIi89vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="66959630"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6dmgfTAx1zDfqssuht7HC9ufb1N6DYi3GyoVJDRlEDUiRLoMTvQns+zuMDgCPH4mlFqtz+HOEvNtUoXClNUepAQXEq9MoTDSdxbttsuHZ6gLqcjNubqQt0obBv6b95p8/M+jV8Tu0aTtilZ4epsaIT+H3j64N+OrhFbXRlnBowcF5C005vedKsxpoCMBRyLTMt0DNuGj53JVcdhZmbNe6f6PtrKz8OMz8CW4MPrGdaliKBGIRLYHyg2e8biwfNzDvYnji6YTob7TDO4vCIb/jYJpkzfzeIAZ6w2/Z0y1gTobWDZwKdn9o/H9ibZA6KRid/aJxtLmGeBE2FEyAv7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFaI6nSJKdNx7VzF9bzjMSUNMRy0c0wLRen1E+fsKDY=;
 b=Tlkialn8NpevDcIUzTW31Mv3q4k1QeMXntVsXh0m+YZo784kvb+8Mtw2xPVqzhaawOt3hUdLrFwISwFnbM64t6IeMDko63V0FnkSDVwdFhU3g1SQlW9XYR6t2HdWdBSax0x9dbsFWCfhXg3XrkV17+1SSylGOuVWIyXYls9DYVo+C2XPecJ6VhEddRq8mpg+eo+CZCw1Gdt7OUWIrWggoMAEGOSIRhZRhijEMW02vO206s5byWNqOmhT5zUl92mbaOTr7cHBsdCdAOPIunWD+hASEu/WqQC2EQJGdR26ww0YmH/nZ9LZA1orth/wVkxm0z/DjbeXylLccra7AheTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFaI6nSJKdNx7VzF9bzjMSUNMRy0c0wLRen1E+fsKDY=;
 b=Qw1ErGi8FiHthdOUj5/xDl4R/pvJgkF73h2GueyMTKAXSLFLufJmgSevzArrY3spv5bWXfKjU48b8ihQuDLNx/5SCRrqD2W986yguMalPHKvzO0yDJbqoSqQ+fh3GD8z4J9k30xQUgbL61BAhHn2PLekmO7NhRpm+GAdtt9mRKs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Topic: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Index: AQHYJ011tWngdwKc2UG3RuxDqKou56yfTukAgAAXlAA=
Date: Tue, 22 Feb 2022 10:54:22 +0000
Message-ID: <9e442a8d-ef71-3776-e655-8c8a226af706@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220221180356.13527-1-andrew.cooper3@citrix.com>
 <0c253fda-c5f6-b7ea-df6c-8b43b86c6a59@suse.com>
In-Reply-To: <0c253fda-c5f6-b7ea-df6c-8b43b86c6a59@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b93149d8-bfc4-42c8-0b1a-08d9f5f1af4c
x-ms-traffictypediagnostic: BN7PR03MB3810:EE_
x-microsoft-antispam-prvs: <BN7PR03MB3810DA600867636B9C247325BA3B9@BN7PR03MB3810.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 27T0ludaGsI3z0mRTJZV+v9PH6/jwcK0MQtv1EmPTiuOfAIydSl40aKrvMlCU4CepHPB7XjXFGDns1/M6nln9goX8Ok0gFEHsxJ9bnGCasazsUZ1+tM7EtUtMUny3Xr9/v2XPvnFNfvBbekL6AZWkX73rghAxeJ7F+hW0JrHJwaSxwf1HTf5eldVihY1Uczzkbpx7jzzytRHlJLCbpeP0M9pEXwnpNg+0ilgU4bM6t1pTFPugyjWjc25sVMDcc6rQmCfyHFxfvmB4OjxPnNvQNZKZ9JwjroiKGlfagy4tDJIk41ZowscBMvh9oLUXt7Av7VklC3/bR584lHbybRaQ/2FcFbwXEAaabkUf5JyGFBj0csqaCoJfTaYxV+g0v5te2BmBEmhFjZi29iOCPiHj4tsswv6mEVdRq4tUurXzDfY5jauhV+0f6LPaofJng5z9z0Xq436e2kB6zzLnOFueeS5ho6/h9Wm8U5CZ+IUHeH/5qJPSzMMhiqE7b0ZKY8Sszf/OG60PVF8PAoYfoNC7VwvgLfBYHB0LkDJqtiOhaAhqY4tFlA5a24uGPdSC7Ocr0EVnLmAMwkC3mUVu4+4jvUrXE5p4IM3amRP+0dwgSMyoamxvHcJnPWJCKwh1L+3sdbimdA6IIf3/V1e8YGwxhV0UmnRIC4YjHKzCdNABlRDG963WfEbfauNIDv5fgck5DdL61cb5CrsEcvq0GPfwP5yOp2VUruAQDFftoEP/nKIF3INm1ukHoPdQiFCksOS5Zxrwc3T4QyVa3Mwf8tymQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(82960400001)(2906002)(122000001)(38070700005)(5660300002)(31686004)(8936002)(36756003)(83380400001)(6506007)(4326008)(31696002)(66446008)(66556008)(66946007)(64756008)(508600001)(66476007)(8676002)(6486002)(91956017)(76116006)(54906003)(6916009)(26005)(71200400001)(186003)(6512007)(316002)(2616005)(86362001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGRkaGtPTkpFVFB1TkNqcUNoZVpNNEJBd3NDV3p2UFBCNFZZNGhDODh4N0cw?=
 =?utf-8?B?VUVBR3JQV1dRRWZ2YU41K3hzTFc2S2NROWt5ZVV1KzIxQjBjRk1rZHEyeEZU?=
 =?utf-8?B?SnBIZWMxNDFYUTJWZ25veVdZUHk0T0ttMHp2OGNWRGI5VG9vMGlHb0lxQlNQ?=
 =?utf-8?B?bUlXclFoNFMvYmFMQTU4K0hyVHF0MlJwd2pCOW9QZlBvV0JtQVFndjBxMXNw?=
 =?utf-8?B?L084VXBqeWNmaWxlUDNtRzg1M01aTUZ2eU5TOVRrV25XM3BESE0vczFiY0l4?=
 =?utf-8?B?OXRPRmEyZEd2SFFlaTk2dVF3NmZQTDdaS1hiZjdiZFdWVGtHNnNYVG1zcUR3?=
 =?utf-8?B?QUt3UVBRdVEvMk5RS29TakxIb3VKZnV3YUVBZnlpaGYyUUwxM2RiZnhCZTVS?=
 =?utf-8?B?YjRPNDhGN3l0WG15dzhjaEVQNGZyK3UrZTkvazBJOEJBZmt2WmZzZVV0WElW?=
 =?utf-8?B?MGRpMmZWeWo1WXNlNVhJazQzZ0ErTU5VYk15V3VjQWUxZmJ6NWFqR0JaVWdC?=
 =?utf-8?B?dWN5VkZJU0ZzQllQWXR3ZXJhbU5BbjVpaW5XTE95UEg4Z2kyQXdRRnFYeDJM?=
 =?utf-8?B?ZW9GQ1VUYnpReFBQZXlkVTYvcG1sYkEwRnNBRHpoUDNsQk80MThydmd0disy?=
 =?utf-8?B?Z3RweFhPZ0N3UXQvTHBJOHhPYTA1dUhpdUExUjNoeHBjRFM5QlFDcVppTHVn?=
 =?utf-8?B?WEk4NjFLSDB6d0Y3NTUyVTcxVWNpV0h2dHZnanRBSXc3bHd4N3NSRVU3TUhl?=
 =?utf-8?B?VGdSbHhWV2Fya3RSWlRJZmRRMEF6ZUpFREQrcS9IYndSQzVSWFlIV3JLUEp3?=
 =?utf-8?B?aU1QVTNCWXdVZC80ai9FWGVVTk82aFZGdkl0Q1VIY21pakQzclZLendVWWtX?=
 =?utf-8?B?aXFPMXBRT042K0ZHTGRVblB2Zy9FenZ6T1pFVngxUXlKVlROWjY0SCt6NnN4?=
 =?utf-8?B?LzVrV2lEV2xUL0xuMkx6RFNEVnkxWWg0Rkoxck95VUJweGJTUjhzREExUml4?=
 =?utf-8?B?Wlo4TWFwQVRoVkYxY0RObGU0enBSMjRVbG5YSzk0YjBtb205Y1BjOGlGS3Rn?=
 =?utf-8?B?TDBOdmtMZjNWVFdCbjd1eEVGM1h6Q0tmdnZ2MDUvbWFvcERkZDR4SlNaenEy?=
 =?utf-8?B?OWZaSGNPY1BiLzltUHBHQlN6RFVOT3ZVRDF5U2pGYW5paDVORCtnRXM5R01E?=
 =?utf-8?B?WkNpWE5sMC93OTBMKy9UVG5kcTlZS3MyRDh4ejl5TGNlN3FUMFNMOWVSMk8y?=
 =?utf-8?B?a2dXUTBrdTdqdUlTS29ybWpTRE1DZ3MxR1JBbUpyZW5Yamowa3JrbXhWOCtX?=
 =?utf-8?B?T3RkWVhkdk00MkJZVDN0WnE0Y2Iwa2hvYW82blRjY3BwZjdYcVJwVWJjck1h?=
 =?utf-8?B?ZTM2QnhqNXkzbG5WK1cvL2FObnV6MjBlTUpBdVY1WjhZYUtIaCsrbWluZDNL?=
 =?utf-8?B?VkJhVFMwZkwyQ1JhU0U3UmhuNnRzcjl5ZnlOVHZQd1ZjSkJaR3B3U0ZOak5J?=
 =?utf-8?B?Tm14R3drNER6R0pBalZST1cvY3ptdm8xV1hDYnVXa0l1VDNFby8yS2NjNUZY?=
 =?utf-8?B?cm91YTBSREF4VThNTGtucmpEMEg2NmRXNmtXN1NDRHRhTVhrNGlFcXN6SWg3?=
 =?utf-8?B?QWY3STNHbVdodUxLSXFZdzZQMnVvdG5DR1JLMHRiSDg4QnRJdnJjZ1lvMHpP?=
 =?utf-8?B?NnVESTFNY2FwdUhIS3RZY3V4SmZlLzVtMktWcVBTOXN2RFBJUTVHWkk3bXJn?=
 =?utf-8?B?Zk1XOWhOdkNKdTBLRzl1T2t2allIdGk4bTV1WERHT2VnNU1TcHZONldwc241?=
 =?utf-8?B?RE5qSTE4QjQ5Q2pXbU5vZUJSbGNmbElSNCtjTVA1blJBSkM5Nm0xbFFpWVY0?=
 =?utf-8?B?Wnh2eW5PZ3k1SU1VcUZlcWNrTFFuQityalhTbDJDdFBwSEJMVTZEMXE2RHg1?=
 =?utf-8?B?c3lLbzhldVo5ZVdmMWR3U0NSc0RrdGhJcUJEZSt5TURrZVRoWHQvbVFkRHdO?=
 =?utf-8?B?OUhoamNDTzNpTWVlRDJqTU5kTFhFai8rTUltODNZUU1wZjhVV1hFbUxPNXZI?=
 =?utf-8?B?Uy9uMEYyeFBkT1Vsd3FNdmo2V1ZadGk0TDYzN1pmUCtac09zUUhkN1hqbUNa?=
 =?utf-8?B?dm00NjFISXBjbkxESUY2aDVIRFllakpCSlhwVDQvbTc5QVVVRExnbXBLcjBq?=
 =?utf-8?B?a3d1aHVIZXNuZ0t0N0QvRmJySTdtRm4wZlAzbnlOVmpwd0xwdUlBUC8xQkFF?=
 =?utf-8?B?K3l5dENFaU04VFBrNitxK1ZTYzhnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84BA569D4928074F9A6B403EDA98952A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93149d8-bfc4-42c8-0b1a-08d9f5f1af4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 10:54:22.5305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/ZNiAcEHEoiVy+rSufw0rwJFb9GF7mxgmXs+E/82RKgpStMwU0CyklVvOrNe1zIDkQn86cKA9MckSMLqJuyHa5Kz0qB20Nn05hrPpGZ/tU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3810
X-OriginatorOrg: citrix.com

T24gMjIvMDIvMjAyMiAwOToyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIxLjAyLjIwMjIg
MTk6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBNb3N0IElPTU1VIGhvb2tzIGFyZSBhbHJl
YWR5IGFsdGNhbGwgZm9yIHBlcmZvcm1hbmNlIHJlYXNvbnMuICBDb252ZXJ0IHRoZQ0KPj4gcmVz
dCBvZiB0aGVtIHNvIHdlIGNhbiBoYXJkZW4gYWxsIHRoZSBob29rcyBpbiBDb250cm9sIEZsb3cg
SW50ZWdyaXR5DQo+PiBjb25maWd1cmF0aW9ucy4gIFRoaXMgbmVjZXNzaXRhdGVzIHRoZSB1c2Ug
b2YgaW9tbXVfe3YsfWNhbGwoKSBpbiBkZWJ1ZyBidWlsZHMNCj4+IHRvby4NCj4+DQo+PiBNb3Zl
IHRoZSByb290IGlvbW11X29wcyBmcm9tIF9fcmVhZF9tb3N0bHkgdG8gX19yb19hZnRlcl9pbml0
IG5vdyB0aGF0IHRoZQ0KPj4gbGF0dGVyIGV4aXN0cy4gIFRoZXJlIGlzIG5vIG5lZWQgZm9yIGEg
Zm9yd2FyZCBkZWNsYXJhdGlvbiBvZiB2dGRfb3BzIGFueQ0KPj4gbW9yZSwgbWVhbmluZyB0aGF0
IF9faW5pdGNvbnN0X2NmX2Nsb2JiZXIgY2FuIGJlIHVzZWQgZm9yIFZURCBhbmQgQU1ELg0KPiBU
aGUgY29ubmVjdGlvbiBiZXR3ZWVuIHRoZSBmb3J3YXJkIGRlY2xhcmF0aW9uIGFuZCB0aGUgYW5u
b3RhdGlvbiBhZGRpdGlvbg0KPiBpc24ndCByZWFsbHkgY2xlYXIgdG8gbWUuDQo+DQo+PiAtLS0g
YS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaW9tbXUuaA0KPj4gKysrIGIveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2lvbW11LmgNCj4+IEBAIC03Miw3ICs3Miw2IEBAIHN0cnVjdCBhcmNoX2lv
bW11DQo+PiAgDQo+PiAgZXh0ZXJuIHN0cnVjdCBpb21tdV9vcHMgaW9tbXVfb3BzOw0KPj4gIA0K
Pj4gLSNpZmRlZiBOREVCVUcNCj4+ICAjIGluY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPg0KPj4g
ICMgZGVmaW5lIGlvbW11X2NhbGwob3BzLCBmbiwgYXJncy4uLikgKHsgICAgICBcDQo+PiAgICAg
ICh2b2lkKShvcHMpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+IEBAIC04Myw3
ICs4Miw2IEBAIGV4dGVybiBzdHJ1Y3QgaW9tbXVfb3BzIGlvbW11X29wczsNCj4+ICAgICAgKHZv
aWQpKG9wcyk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gICAgICBhbHRlcm5h
dGl2ZV92Y2FsbChpb21tdV9vcHMuZm4sICMjIGFyZ3MpOyBcDQo+PiAgfSkNCj4+IC0jZW5kaWYN
Cj4+ICANCj4+ICBzdGF0aWMgaW5saW5lIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmlvbW11X2dl
dF9vcHModm9pZCkNCj4+ICB7DQo+PiBAQCAtMTA2LDcgKzEwNCw3IEBAIGludCBpb21tdV9zZXR1
cF9ocGV0X21zaShzdHJ1Y3QgbXNpX2Rlc2MgKik7DQo+PiAgc3RhdGljIGlubGluZSBpbnQgaW9t
bXVfYWRqdXN0X2lycV9hZmZpbml0aWVzKHZvaWQpDQo+PiAgew0KPj4gICAgICByZXR1cm4gaW9t
bXVfb3BzLmFkanVzdF9pcnFfYWZmaW5pdGllcw0KPj4gLSAgICAgICAgICAgPyBpb21tdV9vcHMu
YWRqdXN0X2lycV9hZmZpbml0aWVzKCkNCj4+ICsgICAgICAgICAgID8gaW9tbXVfY2FsbChpb21t
dV9vcHMsIGFkanVzdF9pcnFfYWZmaW5pdGllcykNCj4gV2hpbGUgdGhpcyAoYW5kIG90aGVyIGlu
c3RhbmNlcyBiZWxvdykgaXMgeDg2LW9ubHkgY29kZSwgd2hlcmUgLSB3aXRoDQo+IHRoZSByZW1v
dmFsIG9mIHRoZSAjaWZkZWYgYWJvdmUgLSB3ZSBub3cga25vdyB0aGUgZmlyc3QgYXJndW1lbnQg
aXMNCj4gYWx3YXlzIGlnbm9yZWQsIEkgdGhpbmsgaXQgd291bGQgc3RpbGwgYmV0dGVyIGJlIG9m
IHRoZSBjb3JyZWN0IHR5cGUNCj4gKCZpb21tdV9vcHMpLiBQZXJoYXBzIHRoZSAiKHZvaWQpKG9w
cykiIGluIHRoZSBtYWNybyBkZWZpbml0aW9ucyB3b3VsZA0KPiBiZXR0ZXIgYmVjb21lICJBU1NF
UlQoKG9wcykgPT0gJmlvbW11X29wcykiLCB3aGljaCB3b3VsZCBjaGVjayBib3RoDQo+IHR5cGUg
KGNvbXBpbGUgdGltZSkgYW5kIHZhbHVlIChydW50aW1lKS4NCg0KSSdtIGhhcHB5IHRvIGZvbGQg
dGhhdCBjaGFuZ2UgaWYgeW91IHdhbnQuwqAgSXQgb3VnaHQgdG8gb3B0aW1pc2Ugb3V0DQpjb21w
bGV0ZWx5IGZvciBiZWluZw0KDQo+DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+PiBAQCAt
NTQwLDcgKzU0MCw3IEBAIGludCBfX2luaXQgaW9tbXVfc2V0dXAodm9pZCkNCj4+ICBpbnQgaW9t
bXVfc3VzcGVuZCgpDQo+PiAgew0KPj4gICAgICBpZiAoIGlvbW11X2VuYWJsZWQgKQ0KPj4gLSAg
ICAgICAgcmV0dXJuIGlvbW11X2dldF9vcHMoKS0+c3VzcGVuZCgpOw0KPj4gKyAgICAgICAgcmV0
dXJuIGlvbW11X2NhbGwoaW9tbXVfZ2V0X29wcygpLCBzdXNwZW5kKTsNCj4gVGhpcyB1c2Ugb2Yg
aW9tbXVfZ2V0X29wcygpIGluIHN1Y2ggY29uc3RydWN0cyBpcyBhIHBhdHRlcm4gd2UgZGlkbid0
DQo+IGhhdmUgc28gZmFyLiBQZXJoYXBzIGl0IGp1c3QgbG9va3MgYm9ndXMsIGFuZCBhbGwgaXMg
ZmluZSBpbiByZWFsaXR5DQo+IChhcGFydCBmcm9tIHRoZSB3aG9sZSBpZGVhIGJlaW5nIHdyb25n
IGZvciBBcm0sIG9yIHJlYWxseSBhbnkNCj4gZW52aXJvbm1lbnQgd2hlcmUgbXVsdGlwbGUgZGlz
c2ltaWxhciBJT01NVXMgbWF5IGJlIGluIHVzZSkuIE9yIHdhaXQsDQo+IHRoZXJlIGFyZSBwcmUt
ZXhpc3RpbmcgY2FzZXMgKGp1c3Qgbm90IGltbWVkaWF0ZWx5IHZpc2libGUgd2hlbg0KPiBncmVw
LWluZyBmb3IgImlvbW11X3Y/Y2FsbCIpIGluIGlvbW11X2dldF9yZXNlcnZlZF9kZXZpY2VfbWVt
b3J5KCkgYW5kDQo+IGlvbW11X3NldHVwX2hwZXRfbXNpKCkuDQoNCkkgdGhpbmsgdGhpcyBtZWFu
cyB5b3VyIGhhcHB5KGlzaCkgd2l0aCB0aGUgY2hhbmdlPw0KDQpJIGFncmVlIHRoYXQgdGhpcyBp
cyBub25zZW5zZSBvbiBBUk0sIGJ1dCB0aGUgY29kZXBhdGggaXNuJ3QgdXNlZCB5ZXQNCmFuZCBz
b21lb25lJ3MgZ29pbmcgdG8gaGF2ZSB0byByZWNvbmNpbGUgdGhlIGNvbmZsaWN0aW5nIHZpZXdz
Lg0KDQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPj4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4+IEBAIC01Niw3ICs1Niw2
IEBAIGJvb2wgX19yZWFkX21vc3RseSBpb21tdV9zbm9vcCA9IHRydWU7DQo+PiAgDQo+PiAgc3Rh
dGljIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG5yX2lvbW11czsNCj4+ICANCj4+IC1zdGF0
aWMgc3RydWN0IGlvbW11X29wcyB2dGRfb3BzOw0KPj4gIHN0YXRpYyBzdHJ1Y3QgdGFza2xldCB2
dGRfZmF1bHRfdGFza2xldDsNCj4+ICANCj4+ICBzdGF0aWMgaW50IGNmX2NoZWNrIHNldHVwX2h3
ZG9tX2RldmljZSh1OCBkZXZmbiwgc3RydWN0IHBjaV9kZXYgKik7DQo+PiBAQCAtMjc5NCw3ICsy
NzkzLDcgQEAgc3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sgaW50ZWxfaW9tbXVfcXVhcmFudGlu
ZV9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+PiAgICAgIHJldHVybiByYzsNCj4+ICB9DQo+PiAg
DQo+PiAtc3RhdGljIHN0cnVjdCBpb21tdV9vcHMgX19pbml0ZGF0YSB2dGRfb3BzID0gew0KPj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNvbnN0X2NmX2Nsb2JiZXIgdnRk
X29wcyA9IHsNCj4gQWggeWVzLCB0aGUgY29udmVyc2lvbiB0byBjb25zdCAoYW5kIHRoZSBkcm9w
cGluZyBvZiB0aGUgZm9yd2FyZCBkZWNsKQ0KPiBjb3VsZCBoYXZlIGJlZW4gcGFydCBvZiAiVlQt
ZCAvIHg4NjogcmUtYXJyYW5nZSBjYWNoZSBzeW5jaW5nIi4NCj4NCj4gV2l0aCB0aGUgbWlzc2lu
ZyAmLXMgYWRkZWQgYW5kIHByZWZlcmFibHkgd2l0aCB0aGUgZGVzY3JpcHRpb24gYWRqdXN0ZWQN
Cj4gYSBsaXR0bGUNCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCg0KVGhhbmtzLg0KDQp+QW5kcmV3DQoNCg0K

