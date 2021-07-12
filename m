Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A33C66E7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 01:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154890.286063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35Fg-0008Vh-HQ; Mon, 12 Jul 2021 23:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154890.286063; Mon, 12 Jul 2021 23:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35Fg-0008T7-ED; Mon, 12 Jul 2021 23:22:16 +0000
Received: by outflank-mailman (input) for mailman id 154890;
 Mon, 12 Jul 2021 23:22:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbkG=ME=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m35Ff-0008T1-8V
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 23:22:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd72ca28-e367-11eb-870e-12813bfff9fa;
 Mon, 12 Jul 2021 23:22:14 +0000 (UTC)
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
X-Inumbo-ID: fd72ca28-e367-11eb-870e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626132134;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cIelzpufYg9nItQp7ba1nwJVA5XICTgXKeIOBei7J3M=;
  b=ErV3hqOaatkcxTVC1xQI567hCz+yI02l43KLTc67GWH32jKdPPHo+mSr
   0oVquyyW0Hdiwn0zZROX8A9/9EEDaAW7wMbQl49c0uHxChX7MZ9UDr6UB
   VtDGaAqNoS3jXopjty/2vI50G2c5bsNQZqYBdn1jSx4bVhHrfcvqEo2cr
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LcsHe/Bpj02iJPKX6pbhtXXkD2/pFkWy+NkKDI/4kGG+3FnZ1PqxKelkyB20zKqwQlxoDAerT7
 0NPXwN9Kvr0DY/t7Pks6Bydz+xdGYBVyBhGkNMlW+tVLZ07vw9Vn3Da4j22llEHSWZQOSRMvBx
 IFiDb4ig1mw/uzLQigw3CSZXXT+JvRtTkvprz4gXrpAtd/MJozsVycYd6tA1CaRi1Mk51fOJnM
 vhs9k317S+dU6VI2nAbpUrB5CnLg88Ndixa3jzF+h4rCBJkfVRp8o5fRius46k1c03FMe1CCu4
 1E0=
X-SBRS: 5.1
X-MesageID: 49754033
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Bt12uaHAcv4M/fgkpLqFHZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pat854ud3APV0gJ1XYJNu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nEPhTS0N1EtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87ysIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsAuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Ts5Vma/pdVFZtl/1bwKsMe61wWB4SqbpXXt
 WGNfusp8q/KjihHjfkVgAF+q3eYpwxdi32CnTq9PbllQS+p0oJu3fw8vZv10voxKhNPqWs2N
 60RZiAtIs+BfP+PpgNTtvof6OMexrwqFT3QTuvHWg=
X-IronPort-AV: E=Sophos;i="5.84,235,1620705600"; 
   d="scan'208";a="49754033"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSkgTTOs4TclajAeTEYqEygHlLwtVcIzsJqwY0ZKnMlzln3Ipy0CqlAw7jm+EBZKlZUGEq6F/zGOryBR98au/o8M8Usq1Fsf7tyNkKNAwlvTlV4OJ9+VislGf2ZVwKsLUWyvD6oSvkobKQsb39dpou0UP9bcMNF3mq5JtcikJNQSHLIHuoD5WxZW4rCBpsmBc4Tr5YdAOiZQ/oDgSM7WtQHoO+foVFXgYDNVWHZNP7EcjJDdHCS/JYeyC14PEP45wFRjoahJDgp9Tri0BmIf+Bohsrm7D/KLGXk752YLJMm+EUzSpjpPn18knctmSiKaHnalg0tEAEnBdRN5BJyJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIelzpufYg9nItQp7ba1nwJVA5XICTgXKeIOBei7J3M=;
 b=n1oIgmZHXaDKZSu1EiExa6c6mjOGNYKkp/vAhHQpqUGymmD3gKovvRwbc5p3mv2y4hoLsY4NiBg7CJuvUa9aLeYVTqCxBqN/KMt6BUDgVuYtC2rEAsisaKlgZ0bq0XkRCsPG8tT/eSaDxHHP4S4EK2ymP2EM0q4LbMOb0tO2nQLRRIExnL9gV0pvHhuDPqrdCXu18AVwcnvAmbfaL7eingtAUQ9++2sg/ojd5Y53uVWKbJ/mWRTeXzBc4GWdXFknWk+Rri/fUSCePQQDZHVI8e+Czr/DCowUidk0I6B7IvLZYwh9uCg9JZ6VKogO0ojIZOiqk/mDUJ3WDbZbs0HmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIelzpufYg9nItQp7ba1nwJVA5XICTgXKeIOBei7J3M=;
 b=sksveIqHgs5vBXyFnrHwUM6bpQi15a7lDHmF3+4fdyZQSjItT0dnUkqXWg6ed730mvb6SsvFMw+AheNilAiwirW+ChbIn++s1FrXqeRj0ZWvK1tKetf/rQ7pUr9hoLITBLPYgjXM17HPIOvFgjxdkenZEEUlsOG42GVb7BKP5/8=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-4-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 03/10] xsm: remove the ability to disable flask
Message-ID: <d7b3baaf-15b2-d991-a380-9524ad37a118@citrix.com>
Date: Tue, 13 Jul 2021 00:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210712203233.20289-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0400.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f1b743b-5b73-4e99-26a1-08d9458bddfc
X-MS-TrafficTypeDiagnostic: BY5PR03MB5282:
X-Microsoft-Antispam-PRVS: <BY5PR03MB52822E5E1EE9BCE51AC8CD08BA159@BY5PR03MB5282.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OvaOdbmlmDGGxFmxyEHABFkKuRjCDs3uAwcM9pCGExeOxMWkwh+v8Mck/+vf4RmS78G0Bgxd8VTLSP+WCOW1DbPNIGrRGBSrVz6Xo5NzZLhNO9vlYxJg5IiBd9viFJpWGEtt91NMyMwD4bdV5iXYyxC+SJQl0K1PF+q6Ut677jcZ5vibXKUUyOXZdM/EPxY8UJ8YQuTFWVxOJEn5Hknii301+A1t8SO2IGxTWXRnBguhsVC3B0f+Gtb4cI5sNumuoV17Aqy1cWTw1NvTdevOLn/w7o8AQNveaOAf4bzKTOsJay6XNHbJPKE2aMSO+bhB/0LdLGTFfrnzh2cgsH78ENx7gGG8mscwGNzqC3b+EuvrH8vEjzp7XFipnu8sxm1CGdWYzfqc4Np1IeSsnTaRUAC6MtqjFNiFHGtgqYqTgHCWMU7ChnWAGetsKhr/fJuKOAshBiaH6lvTuYCSKCBBZsWw4uh8XtHSL16esfhJ+yrA6aPBvM9/iUrNkg5/x1me1NCv+QgkSTyQmk/IR5wSFFtbG8OLkrhamzTJApSlM953Cb06vTNYcpXqYmb93Bxv1MqkxB1VfY//TOgruf6//3vzLsuMoDzdi6HElUyn8wG9eoZvgr+p8BH3pbvILkznxuVU8zICOCX54g4doGoWCvNjrAi/sWEnO1lmVzcfP8H9ZJVLQsq5/O0CounkDMOFB3P644j+L3zIvfJ8e7lNFrjoLnXhHWlTd6PZgmtL5vI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(4326008)(6666004)(86362001)(31696002)(478600001)(8676002)(31686004)(8936002)(4744005)(66946007)(5660300002)(66556008)(66476007)(38100700002)(16576012)(53546011)(316002)(186003)(26005)(83380400001)(6486002)(2906002)(956004)(36756003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0lFZ3kyaVY0N2FDWDNQdDRqWDYreEdXc2IxYkhMSy9PWEZCS1B0WVVBNzlT?=
 =?utf-8?B?WFQwMTY2WnRwdHE4MXpjOEU1Y3RBOWVJRUIwUnJiem9hS1lnTGtmMGVoTG15?=
 =?utf-8?B?QVZuRFhwUHlndlhZd29wUHFJZ1AwcmdocFlPR1JnTnRPSmxJL3hoTUVrOUFp?=
 =?utf-8?B?cEZzdmNydHBTa1haQU5reG5FclowWTlsWjB5NElsSVB1Y1haY3VEendKRVBv?=
 =?utf-8?B?MWgxUXR3Zkw5NUQ1RFJENjJYbUdlU1Nlc3ZqOVd0TldXYmJjUUUvOVcxd0R0?=
 =?utf-8?B?WXpPNm9ISUhveGZkQmkxdnh5Y2NTbnh4WElpS3k3dEtPYjFmUDkzdzIyczJy?=
 =?utf-8?B?RWJaaFo3a0Z2RkJhMEhFZjBFcEk4UUVwZmZYM2pYR2dsbnVQbjRWTHRyeTlt?=
 =?utf-8?B?RVp5ZmVKRThCYk12Y0hUSUVFSkpSQ051UjlGZExJVjRESVN4ak10b2F6d2Y5?=
 =?utf-8?B?ZG5SVzkwajV3TFRnbFN1TnhFYk1UMll0ZkZ3UjhoNDVHUXdLVnNYZGpQczdG?=
 =?utf-8?B?b0RucnFFMGx1eWVGMTN4ZGlKbEV2eGZFNTFRNXpkMkJ4WnJaMStXMS94ZDY1?=
 =?utf-8?B?UXpqUnErdS8wTUJ3TGhIbWJoZkNnN1VXdnVUcUVSdDErN3M0bTVqaXlnL09D?=
 =?utf-8?B?MUtqWWdjam9ZTFVEMFNmd09SZFdqcFE1RmNtMHBrLzJCbktQWGVlQSt2M29E?=
 =?utf-8?B?S2xqTHN6Z2htTmdKV1BhKzJ1Q1BRQU9oMzN1d2M1Zm9TUG5sMElYSXpFQk9o?=
 =?utf-8?B?OWJxencwcU9hellhWnlFTGdPZHB5MTB1cW5HYmFvVDIwS0ZYa1QyQ25nVEla?=
 =?utf-8?B?Q2cvbzJncnhVTDNYNTd4Q0JXM2pnMC9xOE4zRXVoUENudnY1V1RDN2hrMCtX?=
 =?utf-8?B?VmF0Tlp4Y1BSVEphejNqVzlwN0pHVDRiUVpTMzNPRk9reDhHWkVnMkFEWFF3?=
 =?utf-8?B?MWZOeWkxMUhpOW5tSzQxaUJGd3N2SnBhMGtoK2RRUXdaK2x0WGl6ZTlNdktD?=
 =?utf-8?B?TUZEWjRqK25LY3BkcUhSL0xzTnp0V2VIRXdoSExQeHVvOG1qdGdrV0tnSWNi?=
 =?utf-8?B?YXhGaEFqOFYxYXdjdXNrNWo5WWdmNzlidVlLWm5kMWRsUW5SWkdMcGhic1R3?=
 =?utf-8?B?ZHhzZUl4MTlsV2NVbE9GaXBpRUxQdXM3K2F1dDJWSERnSjh3Q2FKblFBeVpk?=
 =?utf-8?B?M1JhTjRFSXBjeWRMWkJoQWhqUjRsYmk0M1FaYWJaZ05ueDVwdEpKVmlOSTA4?=
 =?utf-8?B?L01MM3JWQUZIR1N5US9Ea2R4N2dYSndiM0xCd0Frc3psTkFJdVNkVmVZd3Vu?=
 =?utf-8?B?QWhJY255SHMrdDh4cDBZelJ6b2FmZEp1MVMwdEVISTNoc1hvRWNsVU9OL2JP?=
 =?utf-8?B?MXBKV2FsWHVHMzEwOGh0cGliTU1yNGUvTHRocjVDdFJCMGdiU3NpdUNISEtI?=
 =?utf-8?B?VkV1V2p4dWI4TkJFRStmQy85OTM3ZTVaQVRBVGZlWmxCV2h0QU1mQWI0UTNu?=
 =?utf-8?B?MjlJelV2TS95SFgvY3B2REZRWExQS2VoTkNac1RMS1B4QnRvQTNPQ2N5NVNl?=
 =?utf-8?B?UkNBcDhvTFVmMm9uSkI0ZElXTEl1akRlRGh5VkZCaTVmS09Cb01vNm84RVVm?=
 =?utf-8?B?YzB5OGN2aFZNSGp0MTJhb1RnZ3BwSXQwQ0RqQlNlb1cyRFFZeW5LbE1jcGEr?=
 =?utf-8?B?emt1dmFtenNSTzhSRGRMdTl3akxTSzhLZDZwWDNyZHBscGxsWlRSQXZGZVgz?=
 =?utf-8?Q?akECqqtXgCAjTUh/t3h36RkV/x6PvzYc5zqN+7c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1b743b-5b73-4e99-26a1-08d9458bddfc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:22:07.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjoAkTtMFF5fWDtNijwxBx9JlI6//tfsf6MvRuq3D5y0+RpMs3ooaxK13VDXZCXdAZGn3zJlzrW4aey7FgXQWnH3PavFYmIXf1DfvsoD2NE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5282
X-OriginatorOrg: citrix.com

T24gMTIvMDcvMjAyMSAyMTozMiwgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOgo+IFRoZSBmbGFzayBY
U00gbW9kdWxlIHByb3ZpZGVkIHRoZSBhYmlsaXR5IHRvIHN3aXRjaCBmcm9tIGZsYXNrIGJhY2sg
dG8KPiB0aGUgZHVtbXkgWFNNIG1vZHVsZSBkdXJpbmcgcnVudGltZS4gV2l0aCB0aGlzIHJlbW92
YWwgdGhlIG9ubHkgd2F5IHRvCj4gc3dpdGNoIGJldHdlZW4gWFNNIG1vZHVsZXMgaXMgYXQgYm9v
dCB0aW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0
dXNzb2x1dGlvbnMuY29tPgoKVGhpcyBwYXRjaCB3YW50cyByZW9yZGVyaW5nIGFoZWFkIG9mICJ4
c206IHJlZmFjdG9yIHhzbV9vcHMgaGFuZGxpbmciCndoaWNoIHdpbGwgcmVkdWNlIHRoZSBjaHVy
biBpbiB0aGF0IHBhdGNoLgoKSW4gYWRkaXRpb24sIHlvdSB3YW50OgoKZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3B1YmxpYy94c20vZmxhc2tfb3AuaApiL3hlbi9pbmNsdWRlL3B1YmxpYy94c20v
Zmxhc2tfb3AuaAppbmRleCAxNmFmN2JjMjJmNzUuLmI0MWRkNmRhYzg5NCAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL3hzbS9mbGFza19vcC5oCisrKyBiL3hlbi9pbmNsdWRlL3B1Ymxp
Yy94c20vZmxhc2tfb3AuaApAQCAtMTg4LDcgKzE4OCw3IEBAIHN0cnVjdCB4ZW5fZmxhc2tfb3Ag
ewrCoCNkZWZpbmUgRkxBU0tfU0VUQk9PTMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEyCsKgI2RlZmlu
ZSBGTEFTS19DT01NSVRCT09MU8KgwqDCoMKgwqDCoCAxMwrCoCNkZWZpbmUgRkxBU0tfTUxTwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxNAotI2RlZmluZSBGTEFTS19ESVNBQkxFwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMTUKKyNkZWZpbmUgRkxBU0tfRElTQUJMRcKgwqDCoMKgwqDCoMKgwqDC
oMKgIDE1IC8qIE5vIGxvbmdlciBpbXBsZW1lbnRlZCAqLwrCoCNkZWZpbmUgRkxBU0tfR0VUQVZD
X1RIUkVTSE9MRMKgIDE2CsKgI2RlZmluZSBGTEFTS19TRVRBVkNfVEhSRVNIT0xEwqAgMTcKwqAj
ZGVmaW5lIEZMQVNLX0FWQ19IQVNIU1RBVFPCoMKgwqDCoCAxOAoKdG8gbWF0Y2ggdGhlIHJlbW92
YWwgb2YgRkxBU0tfVVNFUiBpbiBjL3MgNTU5ZjQzOWJmYTNiZgoKfkFuZHJldwo=

