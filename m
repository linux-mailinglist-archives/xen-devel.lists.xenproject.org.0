Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8524C8E43
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281607.480011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3qN-0006yb-9v; Tue, 01 Mar 2022 14:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281607.480011; Tue, 01 Mar 2022 14:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3qN-0006wd-6N; Tue, 01 Mar 2022 14:51:15 +0000
Received: by outflank-mailman (input) for mailman id 281607;
 Tue, 01 Mar 2022 14:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP3qM-0006wX-BK
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:51:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08bc40c6-996f-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:51:12 +0100 (CET)
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
X-Inumbo-ID: 08bc40c6-996f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646146272;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FNt0PkLU/gHV1JfBMjBRBHU+/JETTyZQ8Znho2lLnTw=;
  b=ZC8xlPce1OgZolibSZuwwniMjMCnNcQ0NXnrFAnkEhcA42xMeuIKUSdc
   cuE0DtJJxO0a2XMcmAW287W6QNbgZ5f6CCT31fOPlGPpmOhnS596dkFh9
   YsAzWgT+tb4j+1CXHy9tMfbeBUoo1lhjdKndmlCgVSHoVGuQ5LKlMh/GK
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65225268
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zqjnoawIS4rT1CReRC56t+cqxirEfRIJ4+MujC+fZmUNrF6WrkUCx
 2NNDGHVPP3fMGXwe41zPt+390oC78XXy4BgTgVs+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YHhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplls2we1g3J6L3vssiUyJ7FSpiOZBl0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 pBDNGAxPHwsZTVpNRBHJ6Ma292Qg3LfTG1Bt1O1oJAetj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6C7mQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO85r6DPS1LPb2CC2OWg/bThKdNgbl+ZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZD2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1bJ5bImG1O
 RaK6Gu9AaO/2lPwNsebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGMqd9DdQ1RdCNjbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3QApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:iTNQxaFYq6Ck1KJppLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65225268"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+M8pOkHIuhicArkjVoKOb4G4PdR2CLVqCC71geT86pMgvjNDl/OHmxRPU4xF2vSkODCV20HLSl01lAhuyWLqcRZp1XTxxJNwmslHbFUtf68l0TsV1rQ41oPH21t7128NZsyQFBqqg5hVz2BqStRVaMMVQDlyyTu+WXiDa7njqye1lcqBcWPj7vLBqRbxOJOpchw+5UBfxssaa8Ro3UovXPVS1Q9faLsVPr3wcnOea3FHP+jCGHxbGaPYoZv5soCJ/ADsDfWQ+n/NJklzhWvmEsxJ/hsMTOVrwOxJ7qLOOhv7v+k5sAjwtGVB+zDv+05+389oOsQD76yWUC1LDAauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNt0PkLU/gHV1JfBMjBRBHU+/JETTyZQ8Znho2lLnTw=;
 b=jeemfDpWe+c7SOIPkznKYrPrJRCtGh/IV/7OsmI5f9WLvgN7m8pz3sZ0cO49yfnsmdyJ0E80Fp5hmsrTOVWMgR8bYkf3KwPIrJvQE/f4ofPS0/5ioxQBZIbC8PySQotpQwrrg/tWzr/PInG4yMoZCQD43q9rAdjOfnQ4IHlg5wX9o/jDQ9wWbyhAxlyfJnm5tUbS71690I2eyLXL6dWMzjsTyrUw1zFflZStd/eYNys5uNxWyhoeFTRUq3flbxJMl5ASOTceSaZ3ACiRScnvg0cf1FQJ8ISxLMEbM5vV9gV3E30sLSzCoSX8+AOF9ShcVPA/9kaCgAz/rfrn+2UwpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNt0PkLU/gHV1JfBMjBRBHU+/JETTyZQ8Znho2lLnTw=;
 b=uSy7gkxdwR4uSxVZGaoaGMB8rhMV4uLuX8i7Tu1aEw2nWD46wWNsjJIpDg9/s6CPDx3EuaDGZpmv1g1eJQorRdA+0hG1fNZiOHxo7kVjA50P4oXfxUu2CS5dQKu9fW056JTLZrreDKNej6A4qPymuH80SxA5ClpZEziLTfT1gEA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Thread-Topic: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Thread-Index: AQHYIaJdlBm1laP+30eCBtzXO5xQTKyqhD+AgAAwCwA=
Date: Tue, 1 Mar 2022 14:51:06 +0000
Message-ID: <eaa7f36f-f8b8-604a-9d97-6cadadbe6eb3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-4-andrew.cooper3@citrix.com>
 <2808e805-60a7-2f1e-0ff4-8da123c79afd@suse.com>
In-Reply-To: <2808e805-60a7-2f1e-0ff4-8da123c79afd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6c4709c-75e1-4ccb-c097-08d9fb92ea89
x-ms-traffictypediagnostic: BL1PR03MB6022:EE_
x-microsoft-antispam-prvs: <BL1PR03MB602235219B3AC18448B65B84BA029@BL1PR03MB6022.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lL4EhZA1zMEex3j9tr7jpnSO4AqewMVKrJcdP7kNqfvrWnXMZKUldB0UKueLCqMM2mV+WulvbTTvR7eG6OwZu8WLoqrO30AAg5IU43xmyrKy2RaW90Ja9XoZOCz9bF/djY0WYzDiiIo5wbaZ0nePq0pckEz8CAxh9RY3V/SNnA2uah/01xgdN+C6KHTA1V3ZP+6XPNRPOKb+YUoYSzU0JXzcENZ+xBEGKgLngH0AB+UvTVdAE0TZWOrVnnopvQPvGd8G2EVpc0wDc8aK4rBg/YngH8ImqvIBOur6U0aOg/FAEavhPZshfmPWbX7RuVPrXbhtDjtZsCc1hV/c1R9HjsY5dKO0fLgU/VvJwboOLZtgrQZv8vK4vqbvo/p/5/Oz42oMh3I9AHdsQXxjq+N0Bv3nEj2NkJrsPjTuC/TjlD7seEjuZNPuHQBKP07sQWMrWj/+6FrImQodz9pNpviRZhlyQFGoNMpSKcYqRiB2c59SqH3YEG7VFHS3bOn+J50eeaW/qywFEei/26kO92pHJTCEIw1yqX2xWKVdTVMVRgAxKVXglay9bl8hmipovqc5leNucGEhWrLYR+mSpxvYWpWmr98iehOmjODA1HDD0TwKsvLd/oORubXtMPAKv6Quo1UMhxxNvUvUpi51MrET8mF+wcf19tIRsPslrdeJaF5iAgc8hxRfRHZhcha5Bw9Maaw0Hr38LCf1WSy1fhIGW0CKVghX1WIK+GqOvpK0AxPEiC5mJRxuFXsLdMzinTI5yNPDFPUYf52B0Bh5sZAIvw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(6916009)(316002)(8936002)(31686004)(6486002)(64756008)(66446008)(66476007)(66556008)(4326008)(8676002)(2906002)(26005)(71200400001)(508600001)(31696002)(38070700005)(86362001)(91956017)(36756003)(66946007)(76116006)(5660300002)(6512007)(53546011)(82960400001)(6506007)(122000001)(38100700002)(2616005)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekZyLzBvNDFZWlRoeVQ0Yno0UHpSNkkrRFVNN29oNVdzNWZKWDFCYWdzTUIw?=
 =?utf-8?B?ZWtBSFN0VFQwbDFqNkNvdWZhdWhzaEJZdXpZZDhNM1NNeWhYNTZaY3F2WDQv?=
 =?utf-8?B?YXp6SGNTTExRWVErZGUyRTdmMmJvcmRrUWhEc0FkbC92Q3hrdEtyOEhxcFVM?=
 =?utf-8?B?SnZ3MGVwSFN5cWtCRjlLYXFJNlpiYnorblVxTmhrT2RoOUJBTGZ0ZWRFSi8z?=
 =?utf-8?B?aWV0RGk1dVpaQi9KcC9NV1hZczBTSk9lRExJbWYvVnJvNXVwZzBxVUlhQkc3?=
 =?utf-8?B?WXBNbG9veWkvczFFZkVHL0NTdmpTLzUzdGx1cXp2ck1UMys2MlRJZW81NTNO?=
 =?utf-8?B?bDcxaHpWWDF3WDIwRVROUGtlYkoranFRY0Jxb0JFSGV3MGdoQmQ5alJrOGd4?=
 =?utf-8?B?dGxnTk1TcHBvSWt4Vk5GVmc4bld2ZnZMclpUQlQ3QVJvRGRVSXBpaTd0d2Jy?=
 =?utf-8?B?enc0aUxrd3FCNi8xcUtmTWQ0a28rUzB3K0hEZUowelhINk5pUGxCMnU2UE4r?=
 =?utf-8?B?VFMxaUJhUmZEM1FEUkxIUTNyZmo4NVFoYWJhZGlxdSsvTGhMT2JLeWVIYnRm?=
 =?utf-8?B?SzlpMndObW41STU1aXJIUGdRTlVMOXgweUZqVHVqSFRIeHoxNUNDaUc3amNn?=
 =?utf-8?B?NWtJSmliZVR3bUFnYkhrNkVjdUNSb1dtV0drY1pJL2hLU1pheFJQRVpZQnVu?=
 =?utf-8?B?YXpPYXBtWURHU2tTTSt2L1lBZiswNVRDQmYyUWVoYWtHUWE1bE9mMlRvN3JM?=
 =?utf-8?B?T09xaUQ2ZU9VZjJRcU8wVGZDWTNqS3ZZZzRJQWMrdkFsM0VMeFdsMmdDT0lj?=
 =?utf-8?B?VDhzek5NcmFNcUtKK0dMWkJ0eWt0cnROWUZoN2ZhY3dObTRyRnRZQVVsdWlP?=
 =?utf-8?B?UjFZd1h1NStPMFgrcWo4MytRaVpJcCsvaTMyaGFHRmRuOHB2VEg0eGNkVVFs?=
 =?utf-8?B?VHNBMTJUTlU5NzFza2dJUlp6c0paSC9tMmYwR21sbWdNeUpJR2ZaMXBpRCt3?=
 =?utf-8?B?Z29BZ0tocThLR1lJSno5bkU5aGl0ZEx6eDB6MmpTVzA1UnFlUG1FQ2pUNi93?=
 =?utf-8?B?eCs3Z2pMQklKR1NSQnJ1elhEaWMwUkFRc2VkamNsWnZTV0VzUW93dGRySFlN?=
 =?utf-8?B?bld6a2txOHhOWnlKQXJSSXNZeU9SN0JIMVI1cVlaRE5BOVN2bjI3RnA2dHNy?=
 =?utf-8?B?QlVPK0ZQQUEwUW9JL2daM3h3eExsNXlxSGo5eUNabUJwUDNXRkNPY3V5Zitp?=
 =?utf-8?B?WUMzdzlSUXNvc3hQMnhqa2dPb2IydmNUSWl6dXhEeHBBRngyVkxGdFhXTS9z?=
 =?utf-8?B?YVdUY3ZUaEpONE5BN0lzTSt6aFo5bFBRUDc1WVdUdDRZV2IrZDFENzA5bmY3?=
 =?utf-8?B?ZHBoT3l5Z0VySW9jODhsbDFqaUdzdEpZRU5RZDVqWUhpamNNUjBKMk9rNFVE?=
 =?utf-8?B?LzlmNW0zaVVEYlIrRlNld3Vwd0NuOWx1SDdvcTBwaFRzc2J5d0RLZEdjTk1i?=
 =?utf-8?B?N245dDZyUGNINmtybGtsQUt0VXFUdzc2dUg0WmdRbUpwSCtjRHpKRmtIbkFl?=
 =?utf-8?B?cHIvSlIyQjNBZWhNWCs2MDF2QWVibDhTU1RyeitOU2oxTXNLS2JMSzlVVjA3?=
 =?utf-8?B?WVBYMEdLVU5LY0F6OHZVY2hNcTROWEx3Q21HUmcxVHBaUnRUVVdXTTlQNWNS?=
 =?utf-8?B?Z01BcWhKanFhVjl4TmMzdDd4eGQyWG52ckRNWm9qR2ZkVjdDeXhVaEtVVXp1?=
 =?utf-8?B?YUZnVG9ETHdxcVByYUN5K3FVeWFMOGpidmFGaXhESVhwbjhtRXVhQXQ0MkMv?=
 =?utf-8?B?aXBnTTRmSk12UzA0VnZQdTQ2V1dDb08zZU45YmRna3pVN1lZWUhEYkhwVEhh?=
 =?utf-8?B?NGhmUllNTDR1UkZSNUl6QnB4L3VLZkZSSEIvZFUvZWdaQ0cyVThpNmdHb2hk?=
 =?utf-8?B?SHB0RkgvbCtkaGJsd2d3NncybG96eFgvM3k2OHlnNmV6cFJvbko2RDNsV1VT?=
 =?utf-8?B?YVM0bExsWGVaelhoeHh4ckZxQUs5OXVBb2p1ZVpnWWhpelZIVWpiYW01QVVZ?=
 =?utf-8?B?c240emxqYkFzdUMwS3VBL3JaTTRlWkJCaW9mOEdsN21WY1lrcWxYUFUweDBr?=
 =?utf-8?B?ckxZalJFazlmck53T21saEx0cXhWUHJnNUJ0WjV5Q2NyRFJjR3IyRHQvSWpo?=
 =?utf-8?B?NmhrS2cwV1NBTVFsOXdtdFF2RTNzYjVHdGM1S2R4VlBha2FYd2lPcUZTNElZ?=
 =?utf-8?B?eXBuTC81aXQ2ZFNvMzdMS0hObXFBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <506250EC111C4841B7E3F1F545027EDF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c4709c-75e1-4ccb-c097-08d9fb92ea89
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 14:51:06.7079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0kAaBOdjgkPpkgb8zk9WCPGVmWKrV2GDhReK4xhWpCLB9mmmcF0P+zYJCtSqTPQuGGPmyfpb9ivQT9AIChn5qndvJ5NXgN6tOvvOzAiaBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6022
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAxMTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTM6NTYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBAQCAtMzMwLDYgKzMzMyw0MSBAQCBzdGF0
aWMgdm9pZCBpbml0X29yX2xpdmVwYXRjaCBfYXBwbHlfYWx0ZXJuYXRpdmVzKHN0cnVjdCBhbHRf
aW5zdHIgKnN0YXJ0LA0KPj4gICAgICAgICAgYWRkX25vcHMoYnVmICsgYS0+cmVwbF9sZW4sIHRv
dGFsX2xlbiAtIGEtPnJlcGxfbGVuKTsNCj4+ICAgICAgICAgIHRleHRfcG9rZShvcmlnLCBidWYs
IHRvdGFsX2xlbik7DQo+PiAgICAgIH0NCj4+ICsNCj4+ICsgICAgLyoNCj4+ICsgICAgICogQ2xv
YmJlciBlbmRicjY0IGluc3RydWN0aW9ucyBub3cgdGhhdCBhbHRjYWxsIGhhcyBmaW5pc2hlZCBv
cHRpbWlzaW5nDQo+PiArICAgICAqIGFsbCBpbmRpcmVjdCBicmFuY2hlcyB0byBkaXJlY3Qgb25l
cy4NCj4+ICsgICAgICovDQo+PiArICAgIGlmICggZm9yY2UgJiYgY3B1X2hhc194ZW5faWJ0ICkN
Cj4gQnR3LCB0aGlzIGlzIG5vdyBhbHNvIGVudGVyZWQgd2hlbiB0aGUgZnVuY3Rpb24gaXMgY2Fs
bGVkIGZyb20NCj4gYXBwbHlfYWx0ZXJuYXRpdmVzKCkgKGkuZS4gd2hlbiBsaXZlcGF0Y2hpbmcp
LCBidXQgLi4uDQo+DQo+PiArICAgIHsNCj4+ICsgICAgICAgIHZvaWQgKmNvbnN0ICp2YWw7DQo+
PiArICAgICAgICB1bnNpZ25lZCBpbnQgY2xvYmJlcmVkID0gMDsNCj4+ICsNCj4+ICsgICAgICAg
IC8qDQo+PiArICAgICAgICAgKiBUaGlzIGlzIHNvbWUgbWlub3Igc3RydWN0dXJlIChhYil1c2Uu
ICBXZSB3YWxrIHRoZSBlbnRpcmUgY29udGVudHMNCj4+ICsgICAgICAgICAqIG9mIC5pbml0Lnty
byx9ZGF0YS5jZl9jbG9iYmVyIGFzIGlmIGl0IHdlcmUgYW4gYXJyYXkgb2YgcG9pbnRlcnMuDQo+
PiArICAgICAgICAgKg0KPj4gKyAgICAgICAgICogSWYgdGhlIHBvaW50ZXIgcG9pbnRzIGludG8g
LnRleHQsIGFuZCBhdCBhbiBlbmRicjY0IGluc3RydWN0aW9uLA0KPj4gKyAgICAgICAgICogbm9w
IG91dCB0aGUgZW5kYnI2NC4gIFRoaXMgY2F1c2VzIHRoZSBwb2ludGVyIHRvIG5vIGxvbmdlciBi
ZSBhDQo+PiArICAgICAgICAgKiBsZWdhbCBpbmRpcmVjdCBicmFuY2ggdGFyZ2V0IHVuZGVyIENF
VC1JQlQuICBUaGlzIGlzIGENCj4+ICsgICAgICAgICAqIGRlZmVuY2UtaW4tZGVwdGggbWVhc3Vy
ZSwgdG8gcmVkdWNlIHRoZSBvcHRpb25zIGF2YWlsYWJsZSB0byBhbg0KPj4gKyAgICAgICAgICog
YWR2ZXJzYXJ5IHdobyBoYXMgbWFuYWdlZCB0byBoaWphY2sgYSBmdW5jdGlvbiBwb2ludGVyLg0K
Pj4gKyAgICAgICAgICovDQo+PiArICAgICAgICBmb3IgKCB2YWwgPSBfX2luaXRkYXRhX2NmX2Ns
b2JiZXJfc3RhcnQ7DQo+PiArICAgICAgICAgICAgICB2YWwgPCBfX2luaXRkYXRhX2NmX2Nsb2Ji
ZXJfZW5kOw0KPiAuLi4gdGhpcyBiZWluZyBtYWluIGJpbmFyeSBib3VuZGFyaWVzLCBubyBhY3Rp
b24gd291bGQgYmUgdGFrZW4gb24NCj4gdGhlIGxpdmVwYXRjaCBiaW5hcnkuIEhlbmNlIChhbHNv
IGR1ZSB0byBoYXZpbmcgYmVlbiBoZXJlIGJlZm9yZQ0KPiBkdXJpbmcgYm9vdCksIGFsbCB0aGF0
IEkgdW5kZXJzdGFuZCB3aWxsIGhhcHBlbiAuLi4NCj4NCj4+ICsgICAgICAgICAgICAgIHZhbCsr
ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICB2b2lkICpwdHIgPSAqdmFsOw0KPj4g
Kw0KPj4gKyAgICAgICAgICAgIGlmICggIWlzX2tlcm5lbF90ZXh0KHB0cikgfHwgIWlzX2VuZGJy
NjQocHRyKSApDQo+PiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gKw0KPj4gKyAgICAg
ICAgICAgIGFkZF9ub3BzKHB0ciwgNCk7DQo+PiArICAgICAgICAgICAgY2xvYmJlcmVkKys7DQo+
PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICBwcmludGsoImFsdGNhbGw6IE9wdGltaXNl
ZCBhd2F5ICV1IGVuZGJyNjQgaW5zdHJ1Y3Rpb25zXG4iLCBjbG9iYmVyZWQpOw0KPiAuLi4gdGhh
dCB0aGlzIG1lc3NhZ2UgYmUgbG9nZ2VkIG9uY2UgcGVyIHBhdGNoIGxvYWQgKHdpdGggYSBudW1i
ZXINCj4gb2YgMCkuIEkgdGhpbmsgdGhlIGVuY2xvc2luZyBpZigpIHdhbnRzIHRvIGJlIGFtZW5k
ZWQgYnkNCj4gIiYmIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUiLiBJZiB5b3UgYWdy
ZWUsIEkgY2FuIGVhc2lseQ0KPiBtYWtlIGEgcGF0Y2guDQoNCkhtbS7CoCBUaGVyZSBhcmUgb3Ro
ZXIgbGl2ZXBhdGNoaW5nIGZpeGVzIGdvaW5nIG9uLCBidXQgdGhleSdyZSBzdGFydGluZw0Kd2l0
aCBmaXhpbmcgdGhlIGJ1aWxkIHN5c3RlbSBicmVha2FnZS7CoCAoVGhlIG1ham9yIGxpdmVwYXRj
aGluZyBmaXggaXMNCnRvIGFkanVzdCBob3cgd2UgcGF0Y2ggYW4gb2xkIGZ1bmN0aW9uIHRoYXQg
aGFzIGFuIEVOREJSNjQgYXQgdGhlIHN0YXJ0LikNCg0KVGhhdCBzYWlkLCBhIGxpdmVwYXRjaCBu
ZWVkcyB0byBjb250YWluIGEgc2VjdGlvbiBlcXVpdmFsZW50IHRvDQpfX2luaXRkYXRhX2NmX2Ns
b2JiZXIsIHRvIGJlIHByb2Nlc3NlZCBkdXJpbmcgbG9hZCwgZGVwZW5kZW50IG9uDQpjcHVfaGFz
X3hlbl9pYnQuDQoNClBlcmhhcHMgdGhlIGJlc3Qgb3B0aW9uIGlzIHRvIGJyZWFrIHRoZSBjbG9i
YmVyIG91dCBpbnRvIGEgaGVscGVyIHRoYXQNCnRha2VzIGEgc3RhcnQvZW5kIHBhaXIgYW5kIHJl
dHVybnMgdGhlIG51bWJlciBjbG9iYmVyZWQuwqAgVGhhdCB3YXksIGl0DQpjYW4gYmUgcmV1c2Vk
IGJ5IHRoZSBsaXZlcGF0Y2ggbG9naWMsIGFuZCBpbmRlcGVuZGVudGx5IG9mIHRoaXMgcHJpbnRr
KCkuDQoNCn5BbmRyZXcNCg==

