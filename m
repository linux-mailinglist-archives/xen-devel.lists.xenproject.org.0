Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4136C452C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513183.793822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petyv-0003QD-7R; Wed, 22 Mar 2023 08:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513183.793822; Wed, 22 Mar 2023 08:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petyv-0003NW-3o; Wed, 22 Mar 2023 08:38:05 +0000
Received: by outflank-mailman (input) for mailman id 513183;
 Wed, 22 Mar 2023 08:38:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7Yo=7O=citrix.com=prvs=438d02f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1petyt-0003NK-Ua
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:38:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d95b0a32-c88c-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 09:38:00 +0100 (CET)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 04:37:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:37:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:37:50 +0000
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
X-Inumbo-ID: d95b0a32-c88c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679474280;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=koSEuckGgeFSPgsPxchK7FGfCjpN+n7EF6jC65HgeME=;
  b=GpiVrMXieZaX/hvwZrKv0unT1V+9rRM9etZBcag1A+Gw2bpb3eTF99yk
   Cjp+cOlCvc/HlMh8MeDoQC58deadYm8lV6gYZLSm8VtITUayw5tT+BVCh
   kH8gx3LoNZ4ML5cMnsSG51KJDQV+GMfk+ljFncQmyoHjcJ7cYX13VvilL
   Q=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 101835340
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M+4YFqrcFqfR+qlrSfAd9FivrvVeBmJKZRIvgKrLsJaIsI4StFCzt
 garIBnVbKnYY2WgftoiPNnkpE0PsZbRyN83T1Bu/C0zQSNH+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSNNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAB4EUQrdg7y2+r2YTMpB180Ac+m3f6pK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKJEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqc62wDImjR75Bs+aQaHs6im13aEf/FVO
 2MO9RY08vAJzRn+JjX6d1jiyJKehTYQVt9RO+w89gCWy6DQ7hqZB24LVTpIYpots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsTwEI/t3iq4EblQ/UQ5BoF6vdpt/oHTD9x
 RiaoS54gK8c5eYQzLmy913DhzOqp7DKQxQz6wGRWXiqhitmYKa1aoru7kLUhd5DK4CDR1XHo
 3kAmOCZ9ukFCZzLnyuIKM0WFbS06vLDLD3di1dyG4UJ+jK2vnqyeoYW5ytxTG9iO9wIfjLBa
 0bJtQRcopRUOROCaKZtZourBscCzK7+FM/kXPTZctpPZJdqcAaNuippYCatM3vFlUEtleQ1P
 8ideMP1VXICU/0/kHyxWvsX1qItymYm32TPSJvnzhOhl72DeHqSTrRDO1yLBgwk0J65TMzu2
 443H6O3J993CoUSvgG/HVYvEG03
IronPort-HdrOrdr: A9a23:GH9KRqDj9Ez0WHrlHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-IronPort-AV: E=Sophos;i="5.98,281,1673931600"; 
   d="scan'208";a="101835340"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlTqM1P70MsO9MluvT2WXAVuRE3G1RroWLblUn8nQbpmVw4rFSxPdGdPRBsroQpLksDDaKCXM2l4X1G4rbl2FXU3BoOW9CgONfWFhSeAgiW6DbRHGrXq2kT56xs9FffvZO/9DlDx0LJ1sVjkNcEmoQFDlJP//pLJyXAUts3nxsxcR2t4Pd9Z6hE5YBTkmcM2UAVKoLzg5x+gMB6FKlixQppY1262RBqoO+gQ2FyJjFKdYEr19aEROhLyx6ncTet04vp006rnDigmqI+vxPlfnxY/mlyRRp8xlWih9nwP/VxEELcfSg0EC304xZ39PW/LPCrWD6r4kEOckdjmD83Wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niFMNroS5hDwAdYUuG33SBNFdN52TSek06VmkGZu0EU=;
 b=PCkH4qzBN/W2nlsqqG1Hlq827k1uIsTbHkyKuuYkjtjqDffz873T33KS3qG8T44ejdaCNMSQ8yyhE7tRlqBFCEwt5V1SJo825YgJryocJs/TYe+IEdDna4es6tZifItTlEWbnfTAbyyux8z97AxYbX2Zn2kexK53V8vC1BdDfqXzPH8/PujyYP95wGipveLZHG2tdIfSKSdmQifhjU/RHZMpP8ujpqGl4YVZK2R274lkCKbYNRwEYUZXDfffsz4sPYKUZwGZbBrw4wcI4btXuLoblErj2JDgjZPOWZx1T/MQaac6y0J8MLK/u1ta9iWNTrIPmZQNR2E6fJSLajNAOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niFMNroS5hDwAdYUuG33SBNFdN52TSek06VmkGZu0EU=;
 b=GJlUPjIG/x3BQpaLjuUZ9wEBCxr/oQAMG+5Pb/4B+zFOzOB1SvKPyUS2dHVE2+h65cuLJPA3l7wDVpUx2plkcRWpPVzn5JdeoHGtMcN3qq0KP+UMTkY7/Cji2bXs7F4xhdmqybAAdJKYXDxnO1DSqQjPJsqTlRxShjZpAqF4VAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fa35a012-dd6c-426b-2c54-f03024b010cc@citrix.com>
Date: Wed, 22 Mar 2023 08:37:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 0/5] Stop using insecure transports
Content-Language: en-GB
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <cover.1679412247.git.demi@invisiblethingslab.com>
In-Reply-To: <cover.1679412247.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0690.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 4277c640-fc38-4694-7aac-08db2ab0b828
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HjY0QlZ/5vJ2ffdI0DIjzVpCYH+GNwy41Zy2qC87kpdxyy3JhPncQlau7tBE+dLzdgjitaSt5U4McO7SdtzY9Ra6NYURlFOJ85z9nuQytXT0Qy9pHECNR1yfrEFeXBdrloczJUNQboM3YioI97JTnSvuSi0sSHLU9uIQJEHGq/10KBZ6Dd2tOoDNAtwxA0VULsb1af7PmeCrzn6l7cAZQArWdaCPQ2j2D6sMYYP07xDHrLQj///NOq6QMP/bOw3nK2w2Uo1We0yl+9mAFUPMygGEJASEaFkZCT4IdBhZ4pplzUpSf+TxuRVrtHtPKi/bV+JeRJsjKuUJK75If8+HWs5zuvAfdyqffhAgowPYE6FGoZhaQuwCnPL4/+WwQWiyzpX0U8opAqg4mhAsb6t7CgFWVetZJSLUg1QUr0JFmZVV4Vp+zrBh4qMM4pb9QcUffnHTwRAmI/MacAzBc09jb9vm/uHNMZxAeiSuKJw1Pb4G6XLFs/JzJjTYv9kEQIbs+KFTRs8WIoyOSepm99Hrjw50SifX5FcrTDiJj1LF1IwEk2irxNq/61fiLlMY0j3PEyggdaRlynpU4jEUlhVCgz60GPx1v923W3cYzRwEOA1V/BBtL7b+iJ80QBq7dXj23jsrK/HN8C+PsM/Ep6Oqn58puC1s1q6kIcj0tQloe0JHPxcmE2+nrST+pxeMcBqZU5RLRRGeI9Vufsah06AAnv/333RVkHgg6LPkjTjLou4lO1qpYNkjUTxv8Fox8VDs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199018)(316002)(31696002)(38100700002)(36756003)(4744005)(7416002)(54906003)(66476007)(8676002)(66946007)(5660300002)(4326008)(8936002)(41300700001)(66556008)(86362001)(2906002)(478600001)(82960400001)(31686004)(6666004)(53546011)(186003)(2616005)(26005)(6512007)(6506007)(6486002)(966005)(43740500002)(45980500001)(376185003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVFHSFdoVDllSFJUZlV1aHNOZUhXbmlXTGtsRTV3NG8wZVduUkx0K01PUit5?=
 =?utf-8?B?YzcvdTVLMWJiTWd2bWlsMys5cGFWd0ttUlZuSEFueDBNOExqWXY0TDRDRllF?=
 =?utf-8?B?K2ptTjZCZ2hTTlYzUVY1SmVVV2FnQkRRRVdxWldLaEZacjRmdmI3MFZ1Rk1l?=
 =?utf-8?B?M3FRaVJtN1pOZUhPYmo2bU11U2EvbWU3WnFQRXh2QzJxcUxNUlZSVEllNXlr?=
 =?utf-8?B?ZitjWU9oVnprdnU3eW5ld3M3WndVcUJoNG5vaHJaYkdScTNrZ1M2VWx6RWRo?=
 =?utf-8?B?NXF3eWNyOC96TU9KVkd2aStwKzBDNWQ0RWR0TXZtY0xsNGoxWk00Y2Q0a3B5?=
 =?utf-8?B?bVc5bTR1MkxDNU1KdjlwQTE0Vm1UYzZzdDdnaG50WTNVUkZkam03NSt5dHlh?=
 =?utf-8?B?bHcrQzRwMGhpM2xkOUt5L0N6UXpRVi84YnhoK21QdHBjRzREdlJDSDFRMHdv?=
 =?utf-8?B?U2s2ZHVIRUpVejArMUV0clkvbnh4TGV0S08zNmVPYktKd2R5WkJxanFwSVRu?=
 =?utf-8?B?dWFHUnJCbHB4NnRSWjJPMy8wOHdlMmhuclFFWEhCNWFKaFltS0J1bzV4VFNr?=
 =?utf-8?B?KzRrdkgxdko3clFzbEtuNE55MGNDaWVRMGNVQlRuMkxwZWNNZ3lrZTFrVmhk?=
 =?utf-8?B?QUNrVlZhU2lWMGJRQzk1eHF5TlY3Qy9iMFN1ajY0cTFhRDN3M3o5QVhxM2RI?=
 =?utf-8?B?dWpsbWNnUEl0dmlDOTNjWFI2eHlMYy90ZWt2ZU5LdWliL0FtYnovQy9FLzhW?=
 =?utf-8?B?bHE3aHJQRS9iVjc4MDNoc2xpcHV1KzhQY3ZxbzA2RUkvc2xCdGVmeHFpOEJW?=
 =?utf-8?B?dW9iM1hpcFZGb0VTeVVpSW95Nks0eWxSL1UxVDBiTnVlclgxWVBlQ3FYUjZQ?=
 =?utf-8?B?MHc4SW9UckwyY3R1Nm1sTUpnZ2I4WVY1NFd2RzNLN0kwdTJKMzNMeVdGN3ND?=
 =?utf-8?B?YW1mUFFzQlVtZm1WNFhBMDIxamJwYUNZRExQWmMwSDZnSFk2QzlITlRPcTNW?=
 =?utf-8?B?T3hnYWVnQkM3c1RwcmFPenp6RDhVRlJtOFhuZElsNUgyTkFDeCt1NGdBNjRH?=
 =?utf-8?B?MzNYV2NzTUFneGoxMHdWRzdwdCs4Y1ZzSG9WWEtiTkcwN2VvMlE4RUNHQUUx?=
 =?utf-8?B?NlhmYVZqTngyVHJ4NlFTcVJzNHNLamZmaWluMk5ZVkE4LzcrbldMb09lUXBT?=
 =?utf-8?B?Q25ZL1p4c09HU1F4T1ZBdnhra1FzQ0JqMHJKbnBCTHBUUUZCTmZ3SjZYN3l3?=
 =?utf-8?B?M2pIT1RJSzd5MFZRRlJPY0NwYXRjaVozVFQ3TVBmUE85dCtMdnBVV3BRT3po?=
 =?utf-8?B?MzlEeE5ROVNEU1NWbkdjc3dNVTkwZkxRRVJHQ2NPV291ZkJiRVZmcnZXNysy?=
 =?utf-8?B?NlEzbXRnamkrNnh5VmxpVEFvQVQ1NTg1ODJvaVVrLzZERE5pRlBVRFFlZml2?=
 =?utf-8?B?a3I3cjRWc0Ewa1RuMGt4cmYyT3pieXNmdlFSV3hjTFdLalJPWjRrQWd4Smpr?=
 =?utf-8?B?dENHeFRQQ09tZXowUUVjSVpMdTVIeGR4Z2pybHQyb0R1L0pDMlMzYmVHUVJw?=
 =?utf-8?B?YkxsSkxWekRZWlVLS2J3SysxSldLdGhJQ3FEUE5YaVY4SDRseVB1bGRzQmsz?=
 =?utf-8?B?TXMyOW9yV01KN2ZiK1piM3VaR2xzRW45Z2I0dzJKZitzRVZHSTZOYWFFdzZw?=
 =?utf-8?B?anJNRTBrakxrRVlQTjU3QXhiZXFFNjAyc1RXMlU2ZFYrZklucDhxa0Nuc0RT?=
 =?utf-8?B?K3huOTFiUlJqM2FMTUlJOHpySnJWdWhIMS9FQmtlSzVqTUpCQ0l5L2E5Vzg1?=
 =?utf-8?B?YnVpYlFoTVBIbGR4ZThSVE1aK0pyNXFHYzErVmtvV1JWR1BqclM2T21vaG1z?=
 =?utf-8?B?ZzE1QzlIQ2wrcEJ6eVhTdjdyL21ZSW5oR1JkTGxnUHFleTFMckcwbzBMLzFF?=
 =?utf-8?B?WnpoUGREV1IxUjdCSlZnWnUzM0ViZys3ZEw5ZHh1ZmtKNi9UdFRuanlqR1o3?=
 =?utf-8?B?dEVpTGJXdm5XVlFSNEl1eVdJL1FXSnAzeTFhdWVGajR3WmVvRDhRL1QrTytQ?=
 =?utf-8?B?eFltbG1ZeDZNT2R2VDJ5RWg4V0x3bFVnTkNHcG9Ea2FuWk9zdjZsMTg3Mjc0?=
 =?utf-8?B?TzZZYUdvMS9KeUJ1MHJNT1Q1end6V000UjRGTjU4TlhOQVovcUdvSEJrcWJN?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?NzBmdEZlNXlCRjRBazNpYXNSUzFmWjY5T2VFaEpmdUM5VHkyUGlzTzN4d3lO?=
 =?utf-8?B?SG5XakFFekxjRGs5aDZ0UTdqR0ZpTlJxRFlxVHRiZE9WS3EvVWtuMlRuYUw2?=
 =?utf-8?B?NDJrVXRkb0JQQVU1L2ZIMlFKS1R3RTV2dHNiYzUwS0Y0SXRYK1IxdGZtaHdU?=
 =?utf-8?B?UlI3UTJvZDI1WVFXNWM1NzFPdStsOEJmWE9VcnZ4TFJ5enVIODNwWmJrRDc0?=
 =?utf-8?B?RW5SQTBPQk1yVWVaTHRQN1o1K05vaTd1M2NiMDNhdGtIZEIzeWdSYU5YTUQ4?=
 =?utf-8?B?MFhPU1Q3UDZ2V3MwY0hYc3J3Q3d3WTNESXhhZlBnRFhsZit1ckJPTForV1Br?=
 =?utf-8?B?bVJmZ1VuU1lZQXhTOHl6bUwyMUVwajV5RjRzRDdPOUM0eHJ1SW4zTDR6RUdm?=
 =?utf-8?B?YWJXcHNZbkxyUTdPRVlpUStDeFJWV1Znam5IQ3plWFp3ZWtYRFlQMkRWT0Fk?=
 =?utf-8?B?RmtiZ2ppYW44Y2xJMG45Q1lZNUQ3UVYrR3p1V3BFZXdYamM5djNlWS9uMW1X?=
 =?utf-8?B?K3JhRm92TUVma3FabHl2M2VGT0lTMytJS000bVBrZE9aWm5od3dseFpGOXhG?=
 =?utf-8?B?czRxQ2kwTll5Lyt0ZnFmcjNOKzBnaVlQcU9vZ1M1eXJLbVo5OUdISFhPVTVQ?=
 =?utf-8?B?K056SjVWT3R5RnVLOWI4UnNVRUVidHFlKytzQ2lkb0RGdEJKbElNSmE4N2Zm?=
 =?utf-8?B?YmZPV3hTRXZBNUp3bmxWbEFKbDNCaXRaTzJNUXJiV2tISXd1ZkpjNktES0Qw?=
 =?utf-8?B?aGl0Z3V6T0hvc1Ezc1c1dmYrSWVqQlpxa1NDajNjT3Nxdmlwcit5djBNQ1BJ?=
 =?utf-8?B?RnhMTG1iWjhHK0s4N1FkMFF0cVZUamZpRCtPbWphSDM0ZVdEUWhhUUw3RWEv?=
 =?utf-8?B?Y2dOTmdwQXdnMTdLY2UvcFNLenhmTjFrOGdyTmJueDg4aWJGMFVTdHhtRitZ?=
 =?utf-8?B?WjVqRU1nN0ZsU01QUmgwWngyZXJaWEZxRU9LNWxpbVFYdGE4VDBXb3lCSHc5?=
 =?utf-8?B?Vnc4MExJRlFvMHZxdHA0WUpZSjcxcnp3d3VMUjlnZ0FQYWRQeVkyODZiclIy?=
 =?utf-8?B?eWJOQUlwU2lRL1VQeDg1eGRVNXdBT2xTMS9yeStpU0lQK2RDQ0RIcTd1V1Nu?=
 =?utf-8?B?T25YL3A3ZUlDOFJvS2ZuQzVLMTM5ZS9HWmw3R1BQWGIyUFViTWhhU1Vrck9C?=
 =?utf-8?B?RVQ0RVlDSVJHZmI1dFc5RllxQ3crWTRjajRvMXo0ZHZjc1F3NGV3QWRwYm9C?=
 =?utf-8?B?ZFlwYjJrU3NaanV5cWVxWHl3MXBYb1MwaFFVUmVyc09wUWZST2cvS0YrbUxF?=
 =?utf-8?Q?2FDtl9RtXmYGiGUuHSnnW6MaBZLsN9J6yY?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4277c640-fc38-4694-7aac-08db2ab0b828
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:37:49.9703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmUx4nA5TEWBDWqLc5yGXx9ZtSnKYH7BqITSvXWRc6YJw/O9DnQ77w9Oobj+PLWeo2ATrjA2aCkXI99ZK6M8O8/i2NBM3weBl/RQhv2Icwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

On 21/03/2023 5:33 pm, Demi Marie Obenour wrote:
> Demi Marie Obenour (5):
>   Use HTTPS for all xenbits.xen.org Git repos
>   Change remaining xenbits.xen.org link to HTTPS
>   Build system: Do not try to use broken links
>   Build system: Replace git:// and http:// with https://
>   Automation and CI: Replace git:// and http:// with https://

https://gitlab.com/xen-project/patchew/xen/-/pipelines/813510934 from
patchew, so I think we're good now on the containers.

>
>  Config.mk                                   | 20 ++++---------
>  README                                      |  4 +--
>  automation/build/debian/stretch-llvm-8.list |  4 +--

Except for this, where I thought we'd already dropped it...

~Andrew

