Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A836B1DD
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 12:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117552.223473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1layns-0006RB-OU; Mon, 26 Apr 2021 10:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117552.223473; Mon, 26 Apr 2021 10:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1layns-0006Qm-L1; Mon, 26 Apr 2021 10:49:24 +0000
Received: by outflank-mailman (input) for mailman id 117552;
 Mon, 26 Apr 2021 10:49:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yA5=JX=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1laynq-0006Qh-RY
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 10:49:23 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 753eb2c3-2ac8-40b8-a5ab-d67f7bea699e;
 Mon, 26 Apr 2021 10:49:21 +0000 (UTC)
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
X-Inumbo-ID: 753eb2c3-2ac8-40b8-a5ab-d67f7bea699e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619434161;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=F6t4cpHDHqQ8e4+WkFTEt44Zj39tPKO/tE3ckr1xr0M=;
  b=FJ4a7BZh85bbaWAzV+Asj3b7X//4ESnfen3u+/DDRDBEtt6y9Y5a9Aki
   jrI7VULKAE/AmH8rvL/WuUbwpqMhfzJNb+xKfs3rAy5xZN/MM5kCCLvBG
   sG15A+yqN/ez2fpX3OE8ZK94JJMrH8f6pA3OSCE8X7SvGEhfpf+RQHZea
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v31iT/diMpuBHCQ0TaDi4Qbzfd0trqqJynGLNkpfR6qjOYoVk8H87ZGAih0qxQZzd9Z3nHXBR3
 8wPfI6XUtcvqyHRThBIgWzSpsu1Il23n4p362GvZJhZd8ABGD2/WpXZfJvO2t8XdEHYeOGPR83
 9ug60fJu3gHHbK02pM5EggzF27YTDuXKjNwBEDCzvMigKQFdOfs8z/Savia4DPU5N+M6elAiUs
 ISfuYmqQX9snre6wUn+20dzHN+ZzT8BN/7PqHmMpsNCtfrrtQdFhhES1mteLZwKC2Xn3W0QwZx
 kck=
X-SBRS: 5.2
X-MesageID: 42513194
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LNLMVaihbYoFVw+nks0VP1CZ/XBQX3hw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGzGdo43Z2j+Kenme/Rwx5WPHlXQotn6Bp0DRveMmAefngKObMSEp
 2A6s1b4x+pfnoKZsq2b0N1JNTrjdvNiZ7gfFo6HBYh8gaDlneF77T9Hhie0H4lIn9y6J0l9n
 XIlBG827W7v5iAu1Xh/kLwz7ATotvuzdNfGNeB4/J6FhzAghulDb4RPYGqkysypIiUmTUXuf
 3thztlAMhp8XPWeQiO0FTQ8i3tyiwn5XOn6XLwuwqbneXDSDg3C9VMiOtiG3OzgStBgPhG3L
 9WxGXcjpJLDHr77X3AzuLVXBJnnFfcmwtGrccvjmdSWYZbSLhdoZ13xjIzLL48HTn34I1iLe
 92DMu03oczTXqmaRnizwtS6e3pek52MgaNQ0AEtMDQ+SNRhmpFw0wRw9Fatmsc9bomIqM0qd
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnLqcaIHjAwqSHoYkd1aWPQtgl3ZEykJ
 POXBdzrmgpYX/jDsWIwdlt/g3SRn6+GRDg0NtX6ZQ8mrCUfsuqDQSzDHQV1+ewqfQWBcPWH9
 ypPohNPvPlJWzyXYlT2QnzXIRTNGkeXMUZts1TYSPNnuv7bqnR8sDLevfaI7TgVRw+XHnkP3
 cFVD/vYMVMh3rbH0PQsVz0YTfAa0b/9ZV/HOzx5O4I0rUAMYVKr0wQgVS97cebNC1avsUNDQ
 9DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PoxQLPUPyebMKoM6eZmhWwXuCKnZEPoDrOT
 8ag24y1bO8LpSWyyxnIcmgKHimg3wao2/PU40RgbSZ5cDueooxC5EvXKAZL3SNKzVF3SJR7E
 tTYg4NQUHSUg70gaK+lZoOGaX0bN9nmjqmJsZStFPSvUiRvtsUW3MeRjKiOPTnxzoGdn5xvB
 lR+7VaqKeckTyvQFFP+tgQARlpUiCrJ55oSC6Cf55Zn7j3fhoYdxb2uRWqzzcpemTr8E0OgH
 fGNiP8Q4CSPnNUpm1Y3qH28Fl9a2WaeAZqZmpntJBmfF62xUpbwKuFYLG+3HCWbUZHyuYBMC
 vdaT9XOQ92wcurvSTl0AqqBDEjzpUqMve1NsVeT5jDnnesIpaPj6cIArtd+4tkLsnntoYwIJ
 SiUh7QKDPzEOUy3QOJ4n4jJSlvsXEh1fflwgfs4mT93HkxB5PpUR1bbqBeJ9GX9G7/QfmUlJ
 1/kNIupOO1dnzrdcTu89CjUxdTbhfI5WKmReAhrp5Z+ao0qbtoBpHeFT/FzmtO0hkyJNr9/X
 luC5hT8fTEIMtibsYScyVW8h4ymNODIFAivwb2DuU9FGtd+EPzLpeM+f7FuLAvCkqOqE/sIl
 GZ6TRa5OqAUC2Z17IWYphAU1h+eQw58jBl8+yDfYGLV1nveOFH4VagMniyNLVaU7OIHL0Mrh
 B8p9GE9tXnBxbQyUTVp398JKkL7mOsBcW1CwiIEfRT89O7NU+X65HalPKbnXPyU3+jd08chY
 dZbkQeYcRIlyk6gOQMo1mPY72yplhgjkBX7j5mnEP8w4Sq4G/UGkddLA3S668mLgV7IzyPls
 TK8e+RyXT77nxEwPD4ZTltQu0=
X-IronPort-AV: E=Sophos;i="5.82,252,1613451600"; 
   d="scan'208";a="42513194"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjjaS4XpFg1QCcFMyx7XMJ2rKLViEJjvGyLdhecXIGCCf4+VopMfk03T1FNCVU542ClXCbaNIsQpRqkQ254VJ1uXlGrIW0AGLJwqn72TGEdGa0FvSc4pEIkjquyzqmvyEzlKmr4J5zVEbyUSYem2W7a9XGK6muZ6FfgiQLmVl1I4WQ2zG8gMk1xGmSTimqD3S8yhejSRpwCBnx+IsigGfbttH4uXEMvKtytPV4rIx74gqzRlvD6gvsi848mytCLn9Vdg5rJz8ww88In1e2hQ1KpUldMzxBVbonAKZPsNiEzgtivIoXw/J5hCJ06r3I/iF6v2KmopgFf7zFj3jmThEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6t4cpHDHqQ8e4+WkFTEt44Zj39tPKO/tE3ckr1xr0M=;
 b=BJAj5jKAZALLIYKiaQF1OZMc7HpcU1GlZY7wPDELYUbv0KQUJjUDVimEYwXYWqqEH5BbZDo141mdvQc/Syt9VDtp3a5LB2bOSpG3d+YfsmNIUmGRv2WTe0/cQfYBZslr1GXweqDUOX6MJXbZlTxdt0rnNfL9ML0K76kbHCnAp5enrerISk9aBVmrC2YAzO1ly7Or8as0uKOfcSH3lvFlOPqlD/fyAmk68uXuWqkbPFUS52An5DVNyXGmBb9LUxVheciR7N7igrupeFhp30feZBt4kll8gfq1fOm4kLPRoMtthMbKMYinLOpCEHRmJ2Yn0QHnDk24oUqTY4iD5b1e3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6t4cpHDHqQ8e4+WkFTEt44Zj39tPKO/tE3ckr1xr0M=;
 b=XI2zImarNG+cWxa5Vjf1/XGmR7f7R/kG4hncMK/9I1l9rZW4NnryGXB2WqFKac37mANDEq/GCckEUmKT+OYebus5k3XmqT7MRYKGERTwbvEfZkAGcjSSvccZDGePckU82mfFwGZU8s2oJrCJmKBGOIbaHIZlt2NzwZ4LM+OAPrM=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "security@xenproject"
	<security@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: =?utf-8?B?UGxlYXNlIFdlbGNvbWUgUm9nZXIgUGF1IE1vbm7DqSB0byB0aGUgU2VjdXJp?=
 =?utf-8?Q?ty_Team?=
Thread-Topic: =?utf-8?B?UGxlYXNlIFdlbGNvbWUgUm9nZXIgUGF1IE1vbm7DqSB0byB0aGUgU2VjdXJp?=
 =?utf-8?Q?ty_Team?=
Thread-Index: AQHXOonPQTvGiS9KVEadp4399FYPdQ==
Date: Mon, 26 Apr 2021 10:49:18 +0000
Message-ID: <53BA2BDF-86B0-45F3-8F20-15DBCA72AF89@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b13f2065-85e7-4f50-4bab-08d908a0f1a4
x-ms-traffictypediagnostic: PH0PR03MB6349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB63498565D668D32401D2115699429@PH0PR03MB6349.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KSPxpF4o6KCwgyc4KShu5SwtylXcXU+H0vf48JsPPB1XvC2NmjTp7n9JoepIGafkcZzMYvbVOZSjDgk6kE1dxsRA8fpUhggoijr30nXxscMmJMo1heT2wH+XINGLFnBh7qYY3kkN8rxTfQeU3zdOF/QjSb7v7YMTqRqROO1b1DwRIxstrERioV2Qr8qpdL3IV07oHigY42SWOXTIkN1ZSpKGL0UE+d3875stQM0rAWI4tJyehGCzZQ0GVAFzNcDCRCeNJRKmBbmYt9BP2erznodGgVfjVylO5v9v0oPQprNKnWPR2Vdgod9GhCb/QFvfv6c7Kw+Yl3Y+AAvg4HqDuBinWGbTKoiX0GodWB0u2fXRQ8ozaxNnYXlfYc1W1QLadDtmsx4fXPz96m2nti+IuaM1qn2criJsD9WIsXvZcMW0OJlPZw4Xb1fqha5kNJz7kqK3cRKu+bhirQD88LEiMx6WV7+WoQnwVv5Bgbb/WshdhWq8O37zN0UOX3dljRet2lCQ0r2RVqPl8WKAzUxHLxbAHA7uXPFA884XLvK5tPV9LZ0K9mBNP0MmR0okUAC76PmKEiQ2X0KrMJwAwojaguG/b3pDLf/N3rtzW0JdVUMd5s9QbS9/JSxVG3knUmRe2OCDRjyi/gVC8MUaqTAEz8FkvqCSZs0sjTCwPwB3tn8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(15650500001)(2906002)(33656002)(8936002)(6636002)(2616005)(91956017)(110136005)(5660300002)(83380400001)(64756008)(6486002)(66556008)(122000001)(224303003)(186003)(66946007)(316002)(71200400001)(26005)(38100700002)(66446008)(478600001)(6512007)(36756003)(76116006)(6506007)(86362001)(4744005)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VXhxWjRxbXgwRDdORHZDd1FYNUVwRU8yQXhXN1JuKzQyaVN1VklnY2ZPVmo3?=
 =?utf-8?B?VXBGQWdRdGpjc3hBZGlwUzdJN3B2UExvN2wzbkJNUGtFZStkSW5wbng2ZG0z?=
 =?utf-8?B?R29YcHFaYU1xZ2o2OXFQV0JGQlZjZDIyNEhNNlMydEZGVW1GU3B5cU5jbnFq?=
 =?utf-8?B?a1hGT0dGTFJwM2J6TG95aTVBb2o4ZFExOENwQ3hqek9XYTdqWkhmc0xwSGtQ?=
 =?utf-8?B?a3VlUlhNN1ZmMXIyTU5BY3JhUmdvV3dCek85U003RkxBb3dlRVMxeTZoTGVs?=
 =?utf-8?B?Y05kUlBuQWhkN0F1MHBINlk4cmU1S1gxUTVVV3NkSTZDTVZDb1FsYUN4Wncw?=
 =?utf-8?B?U3RiaTYxK1F5bUZmZW01bGJ4OVNkR25PMkVpU1hxUGhPNzJubkxza1l3cG45?=
 =?utf-8?B?N3hpOVovKytlU0tEY3V5a2lWUWNXVUxVUmFzM2JYRDg1NHRXTmRWc0pveGpI?=
 =?utf-8?B?dGdSYUh3NHF6S0E4V2Z4cktFUDlZSTY5YldMRmExT1lmejJNaTlPVVhkK001?=
 =?utf-8?B?cnErYXM2S0YwSHF3VGJvTVU4MS90SDVsU2VvYVNmcXl6cnZzeGtpQmVud2ZU?=
 =?utf-8?B?VXBOU2laRU1abmtiQ25CekdrMnlqalhMSUU2Zy9CeGlIcnp6MDJBZGUyNHBu?=
 =?utf-8?B?VXIzWFdsTXZydVFaTkJQWjJCNmhNRThGdVBhU1UwNGdrVTI1aGMreUxSUEtk?=
 =?utf-8?B?SzJnb0VpVW04bDJJa1V6Z2RqTlZWVk1ScUxOSEh6bVU5ZnFHRWhva3BUM2JV?=
 =?utf-8?B?K3M2aVMvc2RhdHJvaUpscWdhMEVOOHVVbDUzMkN6d04xM2d3UWdweEw5RG5E?=
 =?utf-8?B?bXpVTDJWdWV1eWVjVUdTQUdpVWUyMWg5dTVBZHlZQm1JbXU1L2NDR011R0NL?=
 =?utf-8?B?L3lUM2EwZlRqVHVuaDI5WENPeGREM1FadTZWb2wwVEJSK3VhZWFwRTdjZTg1?=
 =?utf-8?B?cVJ1aGJSVHhuT1M4UStwNnhkaWg1elI5cU9HUGhiRVNsWWlQWS8rbmhHem1C?=
 =?utf-8?B?NlJKWWdlZW94WTdKa1RycVA4OWxUeWJMam9Nek9WMjI0eW16N3plRGoxQ1Qv?=
 =?utf-8?B?S0x6OVNSUG5UWWkrZmJibzRsNHNTZldoZitaNGdXQnFBdGhKQ1VDbnk5TWxW?=
 =?utf-8?B?YW5lTFhVQmp1MThOQ014YkVjMU5NYm9WRkpBaVVSYjl6Sm9yUEpUdzN0Vjhk?=
 =?utf-8?B?M2pNczNBMFRJRERVUnhxenYrNVJ0b3FwZ0VMVk51M2h0SFJoVmhFcXpXZWFi?=
 =?utf-8?B?eDhDS1MxU1Ricno5T0VSa3lRTjY3d0hRbDVhcXNyYXFvejR1RWsybG5Uemcx?=
 =?utf-8?B?Tk1TNUtnVzEvaWQ2U0RFaUJwNDR3enNhY3RyRjNFV2h1a2tCWVFjdXNINzRQ?=
 =?utf-8?B?cTJQWUlERDJOUnRnUEMramg2NDlzMUx1cGFjMEYraFNTOFlxTno5cDljZHVP?=
 =?utf-8?B?bmRSN285dGtWdWtlVE5QRFo1a1YyWmE4TFBwRThQc3A5ZlFCSkxvYzQ5QnBl?=
 =?utf-8?B?VzlPVjBwamFuOTZrSlJGL1BqMytPZHZLT1hIMjZUSzdvaldOWmk1eXNlbXc5?=
 =?utf-8?B?cnh0dWJOa3dPM2dCcXR1cy9lZ1Q4NTlSQ2tHemdURHFWb3RiVXI3RlB3bjRw?=
 =?utf-8?B?WUE2cjRSbWUxVXMyRkVGNEJ4Szk5N2M3UGZ0dFRvb1YyNDdoMG1qTnJGMnA2?=
 =?utf-8?B?VFpTa1h4OFhSdy9CQVBSR2xnQUJlSXpHK0xncFFiTUsxdmNka3dTOHNyc0ZR?=
 =?utf-8?B?elJkQnUwa3U3K21DN29GVFpNNjE5L2g3YmpxZ3dUTWExK0ZnaDQ0RVI2b2hh?=
 =?utf-8?B?SXN2UFBmOEhYcUlXb0hpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B503E37D4E89F40B1D539C4D58465AC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13f2065-85e7-4f50-4bab-08d908a0f1a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 10:49:19.0028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbp2S1Qy7+qJe7YB4oJxt6KAfdMXEpot7Ne4yHymiBhctRtdH/+l1y60sC4naCPyRN9OjVvs9Fd6EZ4sCByLgA3H6q4GwY4gV9jA740vhTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6349
X-OriginatorOrg: citrix.com

RGVhciBDb21tdW5pdHkgTWVtYmVycywNCg0KSSBhbSBwbGVhc2VkIHRvIGFubm91bmNlIHRoYXQg
Um9nZXIgUGF1IE1vbm7DqSBoYXMgYmVlbiBub21pbmF0ZWQgYW5kIHZvdGVkIHRvIGJlY29tZSBh
IG5ldyBtZW1iZXIgb2YgdGhlIFhlblByb2plY3QgU2VjdXJpdHkgVGVhbS4NCg0KUm9nZXIgaGFz
IG1hZGUgc2lnbmlmaWNhbnQgY29udHJpYnV0aW9ucyB0byB0aGUgWGVuUHJvamVjdCBvdmVyIHRo
ZSB5ZWFyczsgaGUgaXMgY28tbWFpbnRhaW5lciBvZiB0aGUgeDg2IHN1YnN5c3RlbSwgbWFpbnRh
aW5lciBmb3IgbWFueSBYZW4tcmVsYXRlZCBzdWJzeXN0ZW1zIGluIExpbnV4LCBhcyB3ZWxsIGFz
IGtub3dsZWRnZWFibGUgYWJvdXQgWGVuLXJlbGF0ZWQgY29kZSBpbiB0aGUgQlNEcy4NCg0KQmVz
dCBSZWdhcmRzLA0KDQotIEdlb3JnZSBEdW5sYXANClhlblByb2plY3QgQ29tbXVuaXR5IE1hbmFn
ZXINCkNoYWlybWFuIG9mIHRoZSBYZW5Qcm9qZWN0IEFkdmlzb3J5IEJvYXJk

