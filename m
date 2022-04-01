Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0659F4EED6D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 14:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297369.506533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naGga-0003A2-Nq; Fri, 01 Apr 2022 12:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297369.506533; Fri, 01 Apr 2022 12:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naGga-00037A-Kt; Fri, 01 Apr 2022 12:47:28 +0000
Received: by outflank-mailman (input) for mailman id 297369;
 Fri, 01 Apr 2022 12:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MEhg=UL=citrix.com=prvs=083735472=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1naGgZ-000370-DV
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 12:47:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e116578f-b1b9-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 14:47:26 +0200 (CEST)
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
X-Inumbo-ID: e116578f-b1b9-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648817245;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=/ghLPcuEQlzyO+59i875mOmBX4Dw5c++yzK66eXr60w=;
  b=VK+QKM03S1RdfuMit6gXGiJ8OTh7dpoWQPQm1xsUx4dcjNqrcgvAVo/J
   qcZ27bTtPxe8D56AGwZeEg8pvWRLHI8eS2vVFQEhfp9DbWCWLvgHRctpf
   lano7+nJDt0bdxnl4FTcwMl+vxamN+ZekPGz+pkpaRppWfbBZRUF6muwp
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67662523
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Emb4Oq2WFfh2+6ZZofbD5VFxkn2cJEfYwER7XKvMYbSIYQITYwd3j
 TtIBzjCf73ffDO2KOnCW/2w909T7MDUxtU3HQI9+ythEyNEoJLMXInAIhyhMS3Nc5GZEB87v
 8wTOoHJIpk9EiHR+R3xbrGx/SUni/rZG+T2YAKo1lidYCc9IMt2oU4zy4bV+7JVvOVVIz9hm
 Pv5rpGBZwb6hzMoajtF5v7d8Uhksfqrs2NA4FFmPv4S5w6CmyEZAqxEKPDqJRMUYGX18s1W5
 Qrn5Ovklo8M1051UrtJqp6iLgtSBOS60TGm0hK6YYD76vR5jnF0g/5T2MY0Mx8N0W3Vx4kpk
 r2hiLTrIesXFvyU8Agie0Ew/xFWZcWqL5eefBBTGeTKp6H3WyOEL8dGVSnaDqVBkgpDOklc9
 ORwFdw4Rkvra9RaYl6MYrIEaswLdKEHNW6E051q5Wmx4f0OGfgvT0hWjDPxMfhZas1mRJ7ji
 8QlhTVHUhvPQi1UJkwuDIsjrtaKpDrvcDtVgQfAzUY3yzC7IA1Z1bHsNJzee8CQRNUTlUGdz
 o7E1z2nWFdAboXZkGfbtCL37gPMtXqTtIY6O7C/7PFnxnGOwGgaEDUdVEehoOn/gUm7Mz5aA
 xJLpHR08PJpnKCtZtanXBinnHKJhAJCBOZ7Eao8rzGt4bWBtm51AUBbF2UcObTKrvQeWjgCx
 lKP2dTzClRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85jrtZNt+FK++jvXuBCr9h
 TuNqUADa6471JBRkf/hpBae3mzq9sOhohMJChv/YG2qzzNieJWcY5W122n5z7VQL4CUZwzU1
 JQboPS24OcLBJCLsSWCRuQRAb2kj8q43C3gbU1HRMd4qWn0k5K3VcUJuWwleh81WioRUWWxC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRPIt4wOuBJ1+U3aB
 Xt9WZzzZZr9If47pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnsPPb/V+Pq
 4cOapbiJ/BjvAvWOHa/HWk7dw1iEJTGLcqu95w/mhCrfGKK513N+9eOmOh8KuSJboxel/vS/
 2HVZ6Or4AGXuJEzEi3TMioLQOq2Bf5X9CtnVQRxbQfA8yVyOu6HsfZAH6bbiJF6rYSPO9YvF
 KJbEyhBa9wSIgn6F8M1Nsel9tU4JEX23Wpj/UONOVACQnKpfCSUkvfMdQrz7igeSC2xsMo1u
 bq70Q3HB5EEQmxf4Az+ManHI4+Z1ZTFpN9PYg==
IronPort-HdrOrdr: A9a23:2ZK+JqPb1g8Gj8BcT3D155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90dq7MA/hHP9OkMUs1NKZMjUO11HYVb2KgbGSoAEIXheOjNK1tp
 0QPJSWaueAdWSS5PySiGLTcrYdKZu8gduVbI/lvi5QpGpRGsVdBnJCe2Cm+zpNNW577PQCZf
 ihz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYpoLSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzRfBky/JlagkEuDzYJriJaIfy+QzdZ9vfrGrCpe
 O84CvI+f4DrE85MFvF5ycFkDOQrwrGo0WSt2Nwx0GT+fARDQhKe/ZplMZXdADU5FEnu8w52K
 VX33iBv54SFh/Ymj/hjuK4HC2DBiKP0AsfeMMo/jViuLElGfdsRE0kjTdoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4Go+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSivCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9FR6svM7z44HRmyGG+fIzmZ0Wf9ih33ekNhoHB
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="asc'?scan'208";a="67662523"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSfQKTGuZAFbHUANbwx1UCtHDDEGNFxuhDZO4FTw84T3IyEmXkxODEuNm2lx1JwOR+6ts/3uH9qRNad2dK6A44AjUo5Cpx/8LmKbujwWLsywGSSLnq0r9dqOdOEowiL8xldez4+2SWNvPp82oSYIIOLIXXzzZxAVM2uPkTTzfAGkItW/u3PbUwxfyqKf2lxBd5uyiQnSpGN8azTqJJyPhpJycl85pDsdoKVEgklbasDx2tE30CbZ0YYoPSIpBXbhRhMG79oHP9E6XjpCZbMiHM4r8WjGALtdC4ZbI25GIZLyvWFZNzyZzkeEFsXyTYkZtKL/22FYFObVtYoCupiNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3CEogWUl/Iv8X8F0n37ujgeDvEvj/P33m3aUItDlyc=;
 b=O8wsQttnjxEC9jItiALWdl8TgMKgKPUEOrIFa/jR2jhhsDbr5O4ON85Ax2CiokSMREgCjlHvhJ9GeYFofa8FzQOYHW8EyJR8q35pn7gcZE4HFmagTkjcXfC83ScZaiuQRfksSffYdqPycTYbGIkDtUbwm0EuMsmLA8a0mNsM/1ZMFfdfzmRSymT/ZSLWu89PcKmsKia1YJHYAqoC8rHGj70cU5X4s+lJNdFb6zBqw2eWi3ksfa+awsymTpmIk1Ok5dJobBdsTCf52CSg9TYlcw/jvDpuF6eLed+ZHTQcleEZ5apSCx7/II95pv69N8lGDsUifuy+5cgEo0J1te9gmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3CEogWUl/Iv8X8F0n37ujgeDvEvj/P33m3aUItDlyc=;
 b=dUwuB2pZgCcQUMdFvGBVV+Pu68nrA7Fx9GCS4/AYL0aQmBs2aST0M2x71aVyj+8uzbzQsRQ3dMBBTaofXZ0B1Q4TJ57CmOgEamuXgu2itroOPP+70TuGD1Q88j+Ot0bfEA85VucGwlpzOMa8pz6iZVKEyGy1rqSNTHPs4zN0tRw=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2 00/14] x86/mm: large parts of P2M code and struct
 p2m_domain are HVM-only
Thread-Topic: [PATCH v2 00/14] x86/mm: large parts of P2M code and struct
 p2m_domain are HVM-only
Thread-Index: AQHYKM3WxRAA+J80qEyImVUxoLvSJazbO6OA
Date: Fri, 1 Apr 2022 12:47:20 +0000
Message-ID: <A88AF737-14B3-4EE8-BF36-5D68F9FFD780@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 463fdb30-7c73-4b5f-c6bb-08da13ddc2de
x-ms-traffictypediagnostic: BN8PR03MB4898:EE_
x-microsoft-antispam-prvs: <BN8PR03MB4898EB15AC17521E0CD9166499E09@BN8PR03MB4898.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p953Ex7szBFMzAIex5jPq8yeI9KJbNW/Q3ColywrRmeDZkEJ6/0+HIZSf9/b70e4QdIwLma4Zevb+WZWBknRWU2FPVyp38kayg+nR7YTutUP3Us8ge0BY9Fs4YPTmIhKMu9mLNEm+f1SdGLx4Z4ntJTwPr0tUiwvbz90TYbaxjapjXaAZzaSDT4N0AD2+LuNWwfOr5rdDE7zqC+JeSAIV/W0XvGVxisWnGa0z2T4SjazdLkuJ6pO/0lWmWni1AjfC9oQzANhUekfty6HFiqnmbtUsZqN/X2Duh/zIDXYKAFC+NV6H6vdNxSpEy6lRy8nJTrzs2VIHcQ3ZQXiy2SvmSc1mCu/3mbT19e3LjgiFRrBGl/5M7z0MCZiBU5TrkEz/ZDT89c2G8D58JXUos0OpPDoHT3B3U+RFyCkVx6BosfNQRdy9WNNwrPLxCYcGQtyqS850q5vAlbkt//Cso+8EIZOf/Dp1jfjjFOz42whcaLL/pccxvn7TgG3U1hPpOqAM71aJLkC0A/JfncS6lGQhX2IxbDyRfDNEQjlh/7Zym19mBlhaDDw57mUsgQjC5niBvk+/dSTCNzmChSxFyRpx5tor8NZ+z/FLn60+9IFYkuvyn2w9Rlf43GoB+0t/vMpQTvCXJdoh2sBMef8EOkcFPPKFP5RgPMD6WQaVIvxOFuGNV7CHlreb8WLN1irXjiKjE0Xg3UXGwtgIJGKmfWXEJ9mjDI4jZOTCmHa2LcbxKkPXf3u1MCf9G6rO9E9U2WN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(33656002)(316002)(83380400001)(76116006)(66556008)(66946007)(5660300002)(6916009)(6506007)(54906003)(8936002)(86362001)(66476007)(2906002)(53546011)(36756003)(71200400001)(2616005)(6512007)(107886003)(122000001)(38070700005)(38100700002)(4326008)(8676002)(99936003)(82960400001)(508600001)(66446008)(26005)(186003)(6486002)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUpJL0tmQkhCVU1xWjc2YzIzZUIzcGVjQmVnbWJJUlg2STVTeUZaRjlSVUhS?=
 =?utf-8?B?ZjFXeXl0a2Y4UFMrVzkyYlVOOThJTmthdHFqWVJ1K3JtK3JZM1phbkFYc2FB?=
 =?utf-8?B?VjZCam41V1BOV0RkOExTZ0lnS1RWdjBxcXZidndzaWQvVExtbmRucnVOUzBt?=
 =?utf-8?B?RXFyd2hwTVNhVE0rT2lHb2lkRGJkNkFBMDhYR0V1N3djSkJRdGVGRUdiZGVz?=
 =?utf-8?B?ZFQ5cFdLOFN1MWxlYzJ4M2pnMDhaaElYbzVsMStlOTIvUlplWGRlMkpKTDNv?=
 =?utf-8?B?dzlic0tCQ0RCZEhseGY0NkJ1RVVGejVPT2pJR2RSMklaOE1mZ0FkNEd2SCt1?=
 =?utf-8?B?NDdtZTdOUFpRdzY0NkxoOS85WitSME5FS3B1YkFtMzJ0YklXanhPUDVMeWJj?=
 =?utf-8?B?dFU3SXdKM3RhYVNTaE1pZG1tU0FYVXl5Y2FLQ0RDRWQ1OXVQVUY3Yng3UUxq?=
 =?utf-8?B?MGk1YzZiQzVJb2RTSmtLSTJxQ2VMMG5mc1E1OXZjdXFpbHo0UFBycy9haHBG?=
 =?utf-8?B?Z2pNYVhtQlU3KzN1R2hNZDZBZGgrWW9PbU1oWkRlZ094cWFOMGh6cnNQSk82?=
 =?utf-8?B?djM1WmdBMGV0UHhpU0JuVEx0Z216bnVhOUxGODJDbzZDZlJuRzU4a2tROEky?=
 =?utf-8?B?RGN0VGd4TEFUKzg1aEd4TWJNWDBxSUc3eDIyby9WZWZQQXJoUjhiMDM3OWds?=
 =?utf-8?B?TkliaXFsK2JVdldNVEhOdUtKNDZpa0JQM0FMMGJjUGZ3SmZPOUcrYzRMMUJT?=
 =?utf-8?B?SDhqa1hML0xEdU1OMnJWWUJYTWZwM3I0OHE1a2RjZWs3RTZXeHN4U3FTNWwr?=
 =?utf-8?B?bitSdmdySXBSYWpTTmhwN3gzMlJMbzZLZEJ6b0t3U2RaY0RaU00vNHZiTFFS?=
 =?utf-8?B?UExuUno2QUJPTFF4elg0cmlnNmpINDNHWDZRU1BZU1JVVXZCcUhjcm1PUmRv?=
 =?utf-8?B?MkVCUFJHSUNwYS9VSGoyTTFEQlZRYXlVa0VTdGlOa0R0VFh5RVVCaHpwQzlR?=
 =?utf-8?B?em1VcVoxV1QrSmZjazFKOFNaR0xBZFg2Qnc2UGpPbE80bUl1aDd3dDRSUHdL?=
 =?utf-8?B?S1R2UFUxTlF3cTBId0lKajVMNmZsVDZYRXpENFRMK21GR2pNS3VINGtRNzB2?=
 =?utf-8?B?MjVmNWZnZXRxcm1YQlVPa3k3MEZOUGxTWS9NZkVWd3ZhdDd6U0l6TU0yK0lW?=
 =?utf-8?B?dmFubFR4YXIxaUpUYklWNFNPbDNJLytieGtacmlJNDFpdVRPRW9HYk1rWGE0?=
 =?utf-8?B?bWFJMDhGN01VcCtOOGZZSEZaQ3AzVlFlRnNuNVA2T1kxWHNnUUo0VzRYZVhU?=
 =?utf-8?B?bDdoT3hRZTlGem93R3ZDWWhlM2xGSS9jSnp3VzBUUmpOUEthWklwWFBhRFdw?=
 =?utf-8?B?cTh4QWhncnVoR1F6dFplMFM2REtDRmRtTHo0WEhFKzlHeWpQMFFQaHRqd21S?=
 =?utf-8?B?R0NyS0oxeG11STJpdyt4Q0tNUWxma0tpUndtM1NzT2JSaEFhNkVMT2NRSDg3?=
 =?utf-8?B?cmxPbjFxVUVuTWY1YkNlcFNoVmJOTXpaRUlQUFp0Tjl6VVZ2UTNQM0k5QS9n?=
 =?utf-8?B?UGlack8vLytoTEtsRTdPSGZMYnMvd0o1WnFOUnNZNTNVVGdJcW92RHZmUnhk?=
 =?utf-8?B?a2ptZTdHblBXbnU4aFAwbG9KY1JPY2NUeFdOU2R3UWxEU2pwN29MbW8wLy9t?=
 =?utf-8?B?YUNaNUpDVTA5WkY5OEMrQjM3UmFUbm04UzZ5ZzBQQkp5eTZxR3ZQMTRNTnBI?=
 =?utf-8?B?MmJFZFVWcElwTTFCczJxb1ZWWHpxWWExeVZrSlBCd2tlbHpOUUwweGJkeUEv?=
 =?utf-8?B?RTVIU1paVlhxK1IyclN6UFNGcTR2OUNHZWM2aGxyMmhNdGpmcVEzMFpSekpt?=
 =?utf-8?B?b1NJajdKTWRJVUx1VjJLZURlcnJHUDhuYU94ZWhYS3VSOHBVS3hJYUxqSnZ5?=
 =?utf-8?B?M1FkR0pVdmVLMWZSWDlRbG1wRTZSeTBpRVZyV1ZsdGpGV3djM2JycktSOWhO?=
 =?utf-8?B?NTZvZzRPNHBBb3NwaXRkZERPTm82MlRvMnRkMVpxcE5DTU5SMHNhaTBjVWsr?=
 =?utf-8?B?TXNNNk15enViMXpLWWFIKy9MeVp4cGcxV0grWVROaTRHbTZKTXFpdmwzeDVv?=
 =?utf-8?B?RUtHSFFKRUlrcEhaUjFiNXdzTnFkdmlTZlhHN2RiNHVXZG5lMFAvYmMxMWg0?=
 =?utf-8?B?cksxcVlxcENnRjNaL25kTFBpSkRZRlh3Qk5OUm9SZHpSVEtNRFBJSTgxZXZk?=
 =?utf-8?B?czExbm91QlRMRkltbXhTQzRjWmtpbXdTL0tVbFA3eEJTMWZIWjZwWmZsOEgw?=
 =?utf-8?B?ZGNSQmpiQVFGWnVRaG43NVYzaTBLci80Z0RndkhRV2lReFRnbUJYOFRrcnUw?=
 =?utf-8?Q?Z6hMBlkhiPx/eMm7u50P1szk77O+ap2OiD9kS?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C24A3BBE-6CA9-4A03-B927-C72DAE569822";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463fdb30-7c73-4b5f-c6bb-08da13ddc2de
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 12:47:20.2708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l1db9EgJJnTx6Q91riKJHWtre7VSx1L2awr6tOWb3b796LcwKc732/UgM/88x6Yi085Z3iU9AuDvEc/jMO75k/r5Tny3vWdamjoh3VuKdFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4898
X-OriginatorOrg: citrix.com

--Apple-Mail=_C24A3BBE-6CA9-4A03-B927-C72DAE569822
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 23, 2022, at 3:55 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> The primary goal of this series is to leave p2m.c with, as its leading
> comment suggests, just code for "physical-to-machine mappings for
> automatically-translated domains". This requires splitting a few
> functions, with their non-HVM parts moved elsewhere.
>=20
> There aren't many changes in v2, mostly from re-basing. See individual
> patches for details.
>=20
> 01: x86/P2M: rename p2m_remove_page()
> 02: x86/P2M: introduce p2m_{add,remove}_page()
> 03: x86/mm: move guest_physmap_{add,remove}_page()
> 04: x86/mm: split set_identity_p2m_entry() into PV and HVM parts
> 05: x86/P2M: p2m_{alloc,free}_ptp() and p2m_alloc_table() are HVM-only
> 06: x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
> 07: x86/P2M: split out init/teardown functions
> 08: x86/P2M: p2m_get_page_from_gfn() is HVM-only
> 09: x86/P2M: derive a HVM-only variant from __get_gfn_type_access()
> 10: x86/p2m: re-arrange {,__}put_gfn()
> 11: shr_pages field is MEM_SHARING-only
> 12: paged_pages field is MEM_PAGING-only
> 13: x86/P2M: p2m.c is HVM-only
> 14: x86/P2M: the majority for struct p2m_domain's fields are HVM-only

OK, I think every patch has an R-b from me on it now =E2=80=94 let me =
know if I missed anything.

 -George

--Apple-Mail=_C24A3BBE-6CA9-4A03-B927-C72DAE569822
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJG9FcACgkQshXHp8eE
G+2EjQf/eZle929xBtk0cvFvcWwegfNOOZ45bB0l0J6rU8Dr0dYWbnPnOJdcoAuX
g1Ux6sxbV+oJ5FCe57ZiXtYpfLYAHzmPPYm7YLT5vrtYojTpa9F6X0I6sMCjdzSO
nucn4V8VA/RRFIOPVs9svC4nZi3XAelcj3cI/zolwY0IGANJGjdbyPbVLdfU9noz
rxci7yx+pzfaVEvbCKO2FHc15fixWniE1iT2tkNa3aZJBUzefaBLmu2O1huRun5Q
cnk1EDV+fI84XJS3AW4mIyEvzW2+/mJuRHfONjio1yfLTlLCdMzvpwEgs79DPH4d
1B9MD/38JqbOTW/RMtfPToABiuwtXQ==
=5jBM
-----END PGP SIGNATURE-----

--Apple-Mail=_C24A3BBE-6CA9-4A03-B927-C72DAE569822--

