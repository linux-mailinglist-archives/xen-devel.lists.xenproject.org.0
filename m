Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1704063F2BA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 15:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450769.708211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kT3-0000vS-0z; Thu, 01 Dec 2022 14:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450769.708211; Thu, 01 Dec 2022 14:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kT2-0000sK-T8; Thu, 01 Dec 2022 14:23:12 +0000
Received: by outflank-mailman (input) for mailman id 450769;
 Thu, 01 Dec 2022 14:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/wf=37=citrix.com=prvs=32775c42f=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p0kT1-0000Y4-4Z
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 14:23:11 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd5ae06-7183-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 15:23:09 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 09:22:59 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 CO3PR03MB6742.namprd03.prod.outlook.com (2603:10b6:303:165::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 14:22:57 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 14:22:57 +0000
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
X-Inumbo-ID: acd5ae06-7183-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669904589;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=b9+T4O/LQtmp6z20Q+XpF4+1wKsHOhN1vTCNVzR2E9I=;
  b=dDiIJ2DmDJz9wzpG63jNpxW/uioDCbb7kwiCoSLIPdFF7oEGfST8AwRZ
   fOpd7GAGX1A+2zX2QqJWftbeBl7PT0V59bPJXraDBkOTjQmE1DgXmJ8gw
   oTdrQXbabnFm6RyYwAayH2+oHuEULVmXcgcjKNFmDqWhzgH4dOrhnK2Ye
   U=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 88595420
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W5kEEaqlRIX8GBFHY1BCaP9aJhZeBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBnTPaqLMWT8edAlbNyzpBsHuJOGn9QxSQI++S8xHy4W9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzyBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD0GUyuMuvuu+oL4VfZSuJocI+bEJpxK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKJEjCJbZw9ckKwr
 WLc/n/lAxgcctiezzaE/Vqnh/PVnDO9U4UXfFG93q463QzOmjZLYPEQfWKersanrX7uZ+hwM
 lQG9REi9fIV1VP+G7ERWDX9+hZopCU0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neFls3kLSZiu7qUTTSa7Lj8hSy2ETgYKykFfyBscOcey9zqoYV2iw2VSN9mSfaxloesQW22x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:XbV+tKgXUk3IYQkHY0kAn7CahnBQXusji2hC6mlwRA09TyXPrb
 HKoB17726OtN91YhtMpTnuAtjmfZqxz+8N3WBzB9aftWvdyQ+VxehZhOOI/9SHIVycygdz79
 YDT0EUMqyXMbEVt7eD3OB6KbkdKRu8nJxASd2x856ld2FXV50=
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="88595420"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFf9frJtvUbaoS68laOT5Qi4f1a/ZvdfJahfvMLFsmOnJHI25CbBDgGnhFGzIDRlok87ipFR3qL3cWseyd5Sy7DS5GQWyfoJCR6XqECaPaNpH2DY3MsApdYt5yHq0do6pruANCcFPqFVjQlMwsNCyi0UtyqsnUggybCgwz/pp6rLS0xEu7321sdktMzmPwgyl920cfejlT7UPRGOc6P4W7+9g015OS9JSYVb8lghv9vnVvif1jBDZaiK4/tg2+VifrjDrR2LqAYaqzjIXwNPacSeyuEwcu7e2/hhEap+MVvK77RKJmndDrudXDfJQFsb5acjapceCN1TpQsmn3Z2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9+T4O/LQtmp6z20Q+XpF4+1wKsHOhN1vTCNVzR2E9I=;
 b=D1CYgkwZuQOjeRMazUmir7UOjJ83P9IzE1oZaFNyghI/Z1YwdHjuX5Ae2nrhgTQK4QfqaLtkIEOaNvlOj5cWGb8wTAw7XXcaHgCgrEv6PuRxF+Q+YXvqz742/u4vbpzGWCQCz+y+2JnQSNzCjOQRwKZQoZkh+V6J4/pCE90u/7+iwRB5i23KR8+uj6bwZ+bthVESjEGyjpF3fpIROzmMXCeE6EOfyCnwj0yhIBUvQYJjR3pTBJ2pviSbicjsHyMAaI9yfp48KTpQftEhHPXgJBd+Us2M++KeEKcTFkpfSaRwCvlJy1Xei7M2I7O+heb43aBTzTOD9FFzOlYb5TJ2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9+T4O/LQtmp6z20Q+XpF4+1wKsHOhN1vTCNVzR2E9I=;
 b=ju4Ld7J0sGi7wbcR3v1U5MZfM3wG4lRgjUfYbfqpjyK7yKq6wIhLOl9PX8SUehaQ2xu5YcZFTlCNPYx28geKY+zQTufpMoME4yNcYNzRIAKHHD947E/hIaWx8UEV/Ayi3thCTSS4mj+iWzLSl8gOXHzZlxqyxYaJn1UmNchwc/s=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Topic: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Index: AQHZBOHXzyNRueXKzkCvv/VJ69wZtK5Y7MWAgAAhHACAAAIeAIAABVyAgAABsQA=
Date: Thu, 1 Dec 2022 14:22:57 +0000
Message-ID: <B5F6DABD-B6E2-4F07-893D-78030272B424@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <63240681327af995df64b773945406b097a31d4b.1669829264.git.edvin.torok@citrix.com>
 <4ba26b93-a7b0-ee6d-f71f-6e0d78314697@citrix.com>
 <A1F15A81-492C-42AF-B11E-43EFE3FF8BB3@citrix.com>
 <08D59C99-A8F8-44B1-A081-FFB0CCA8A8C5@citrix.com>
 <DD8F6F10-D9D2-4433-B2D2-ADB419F2FB8B@citrix.com>
In-Reply-To: <DD8F6F10-D9D2-4433-B2D2-ADB419F2FB8B@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|CO3PR03MB6742:EE_
x-ms-office365-filtering-correlation-id: 9150f7cb-9b82-41d6-ef0d-08dad3a78b3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lwwvOM5xEHXH9YgN482QUXvWAx3tfpOwNBhk4Y6YfbF2ki7K9cxAQ6KdziqqwbEPtXjsY9iFvrtJKcHxKdqojcMl367KVpO1y4cQ2KvFjIyhPq619ZIMo0y4Em8QWN3rgZaju1A+F7baskJ82Opd1/QNoiwfuFbQW0W3W8vwSXgEGt6aQfOnfGsPKn1VcHWxk8xlzbgNBWVSQrzwzQJ6VbPGnaSnFSxfWpWQTgvYUvO6i/bettzxI+c7kRw/i0BQeimvj41k94+UG+oOcjK+6zHiwMK7quHAxBxCH/CK7lUe+E1M5vwTM3nika5Xevog6KEZDzDqTM5c0C5zmTeqNSZu9/H2jtnnG1CyI5Vloxn0fQ+lNZPFa6vNpr43zq2EyNIUOz8qXWPZzBEXSaQp/OcEHJGqjh6FNQtT4exqhhqBaLJOGXnpOAAxC806CBQ2p3mf4Eo4fZ2RKthfF/gBae0xqX6upb+O1G+OsS58eghqyuCtMaZd/CsWq4r/YHxLCsGl8bO++q8atb+CG7Fvb7p8Z6ToEXcsmScy50dxvZtPyfxhBiwgAYGRHK95L/4Lhb9YiHWetPbWMjQ/fTY+deFAxlNeEyS9A1Aww3E29pdJP/HD/RigZAJ+gMAynIQwqi3mF7eekd99wpWPgFB5dwcOJJsEBQzMUuqoN+Ftjq0+I73KJIw5/nsd9m+SlSHDJoRGJlwCMfo/YGmb4Pq52trfuCN0oiAoRMhW/Wj5+DM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199015)(33656002)(86362001)(6512007)(6506007)(478600001)(53546011)(6486002)(71200400001)(38070700005)(82960400001)(36756003)(186003)(38100700002)(122000001)(2616005)(41300700001)(5660300002)(26005)(4744005)(107886003)(66946007)(76116006)(44832011)(91956017)(8676002)(66446008)(66556008)(64756008)(8936002)(4326008)(2906002)(54906003)(6636002)(66476007)(37006003)(6862004)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzVSbi9vSnQ3Nk1hZHZHc2sxRW1zdzRIRDBPRWYvSnVQY1lUSXVaQUNpb1A0?=
 =?utf-8?B?M2lPZVhHTnltRmdpSWd3cTJRTDloTGp3VUppRDVoWEZtMGxzc2N6eXJuTHdu?=
 =?utf-8?B?a3o4QVE3YWNsbmZjRGRrWEVhYWcyNTZjNldmTmxyajh0WVFFRzlqMEowUVZa?=
 =?utf-8?B?c3BHaUJtSVRKN3dZZjgzOWVhR2lFSDJPd0c3SzR6OTR0Y1VLSzRLOFF6N21F?=
 =?utf-8?B?bkpaYTUrS0RvcGNGV2Z5eHdLbGtDUG14VHQ0QWNYTUx5d0thYkVJQnVVK3c4?=
 =?utf-8?B?Y3hPQ3pzYmM4ZGxDUUJqdkJjbXF3dkZrWnFBdHRyZ2d0dCtib09xdVZkd0xi?=
 =?utf-8?B?dXhPWHJlT1QyTHVtUERnWldUeUhYWWJXMDFVeWZCSDN2UWVZOWpPS09vNWQy?=
 =?utf-8?B?Zi9HaHZzRGxqT01DdTVRNzZ5MUlybHEvSVltdk5XeUx4Y2lWblN5ZCtCL0oz?=
 =?utf-8?B?dDRXb1VmMEN0NE5oZ0l1Rmo1SW9mRElJRUxzSUtMRG4zYkJFSStaSkxpMGdU?=
 =?utf-8?B?b3dlcktBbFFlUkU5SHNldFNGTjVFbjRua294QStnR1VGQkRmMWlQWlROMkZF?=
 =?utf-8?B?dkI5a0FUY1V2bVhEZ1J5dmxXcnRscUkzZG1LdTRPekVub1JuSDdJMi94RTZh?=
 =?utf-8?B?NWZXTy9pWjVBSWdIcGFEaGgyeHAwS2I5MEZ2bUQ4N1d0YlQ3djVmS2hRQVl1?=
 =?utf-8?B?OFBQUzBBVkNrdXV2R1lURm1Dak02Y0lYL29pU1MydTRYOS9hcnVLckdGdzdq?=
 =?utf-8?B?YTVwQWFQNUdzaHphRGRLUTdNTDhsc25pMDBEcjhwaFhmOHJ5a2pTRFFSNEZV?=
 =?utf-8?B?YjVRMitJVUljNTR5cFp3YzgzUWpDQldiNE1ZT2JUYUova3N6M2llUFkxeS8r?=
 =?utf-8?B?eXZkdkRPd1ovWXZhdDZnVFhHZjlkL2pQOCtJWHNnRENDclErcXdJSXpQUnd2?=
 =?utf-8?B?UUFYQ21oMnRlbFVmd1RndllDMHVCNnZBNjVWNU0wWmdPRWRCQ1d1WW80OTdD?=
 =?utf-8?B?RHRGVC9COG92N3NBRkpPSVVGa2w4NnBhVE03ZEloaTBDUjRqVm5OMUprVmI2?=
 =?utf-8?B?SGNLR3VaY2ZObzluNWQ2NXNJL2ZZOEwzVkN0TjFUVUdhZ1p2NksvQUQzQ0Zw?=
 =?utf-8?B?NnpnMkVuVFlVMzcyUlBxWUZGNWtyZXpZTmhUcmxOeWVvMnBUSWJOZDFxcGZG?=
 =?utf-8?B?V2xGMkZkTEZsai9VN29NQ1QwcGh3UXRtdWZET0VJblE2dUxPT1NsMDNTaytS?=
 =?utf-8?B?KzU1RE1qS01xaitlRWtFZnMvME1rZTAzZnlteFZ4WnZ2bmgxYmRBT1ppb09a?=
 =?utf-8?B?SjJuenc3NVFhaFhvaG9uSWlCNlh2OWlSWFFLQUFVM1lGWVBVT0dmUnpPdk5i?=
 =?utf-8?B?ZmcrT0drcFFGSHZBSjFwSGhRS0hKNkU0b3dXOVdXRzA5dk53Z2pRcDJoWDNq?=
 =?utf-8?B?alpkcVJPamxUWTY4NnZWWXNXaERKVThTU3dlUzh3d3Iva2RFWnpJQzY1L1VE?=
 =?utf-8?B?MUFPOE5zdGVZQVpGMC9zYkZZUkJZOUxKeVQrbHF5dG80WDNQMjFUZko5anlU?=
 =?utf-8?B?amR5cFRZK0RTcmYyck84VlZUcUlyRnFTd0F3YjRuSk50Tkk3NjdDR21JdFh6?=
 =?utf-8?B?cU5vQmFpaG1NQkZvcXVSRXpDTmNscGlhUkRaSWNHcnVOejBrMnZmaGp4andV?=
 =?utf-8?B?cE51cnJYU3NINCtiTWxJVXF5UzVTOEd4cEFTQkd4ZmM5VEJYV1dMWW1YOHYv?=
 =?utf-8?B?UUJ4SXRUZ09qQ1dGOUhiTXFnOXVhOW1HK0RuYTI0S1NCd01VZ1BrTFFxRzVo?=
 =?utf-8?B?MktKNUowQnE0WStqV0pGMHFnVStsZ3ZsSWJBMjI0YTlySmFreEZidG1QeGdD?=
 =?utf-8?B?enZzT3lnbVQ5ellaMVBOTG1oaUxvRURKYzFHa1ovL2RoeWhUb3JKNEkrVmg5?=
 =?utf-8?B?VVRMSlRxTVp1Yk9rZitpL0JGNUVmQmFzK01PY1VQdzZzZy9BR29pVWhEN3B6?=
 =?utf-8?B?OGdRczVDNWlkSTcrTjJhVEZlcitUWVBnUnNqVExZcFc5TExVSCtlRVl0cDBB?=
 =?utf-8?B?dGFyMVh6c09vK21KWCthK0lWak92S2FhZ3lTNDRVTTVFUTdVYm94YWNPWjc3?=
 =?utf-8?B?WXUwNTZZR29Ua2llT0FRM2lWMEU4T3dSdUh6RkFXZG9tZVJwQmRiQk1SUFBZ?=
 =?utf-8?Q?fedMtXtfqMg3Y+4o5EjQFWc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D5E3AA4BC58044DBB0DF67965FE3D0D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6jHGbxna/V6L+Z2CMkRzXdQq+byXL2zTZxh6tdkMOrYjk9LjNLWhV73KJHNbi6ExFK8u+rZaNtI53tZCQLIsDaJC5snt0xSCxJGvFd09bxfPnVFbjsj2y4eJuSbRCcbT2bfDIL2+l2CipoerrIvX4is9IAqE6jJyVRFXZVHyLDlEKtMF/MfFT9dP/J/QqoBwFPcFUfY1dFqscPsYbH1m67q4t0WPRsJZEbenqw76T/7LJLStPm8KupOnfSEqxou3Cs+rCggPVqhcpS2sp6FaDV+tCgBdkiMmXX+ie35Y8FLaMVLp6BvvZiCPkgSc3kH3tfGNDEXg8A2G3EWZ2Qp/pFLqxUdhTw/PRBAVAOolQ6vK1cdFDcaNTU3yRNBH4+7R4DgAqmLjIfLfSQSVz3vLeVPtac5WOVmM+UqvGPisbnkU9/EEMDJbn1FLBOqWEjgP46uxVkXDpcxEKFGXJojVP186Ta6r8hdpgN8KSjfn+kPEjif9uA3Y9dFfysZ9L+rnGO93qa37BqypU4FoFnE7AlUzrpvySBJU6Cj9aBpARcVnH+tibqmlEpaIPoy7lowPL5UH0hf3WpoL7zSDCFgR1BY10hFhsNbeY1g1xjLPkyCjZ4zC9B5QExAXCeVaWW9SDDaB+Fct+U/Bjmrf66l2LUc/yzKZQbsl4o2BKzhK+9ZUyk3q2W+Svc0ixErVjiqajkN0CRjfjftyndI8OXHvewI/IhkJ6+0HDlcZ6Ymbn0nGRMIKgDEn1KG9ZdYv54PdIcYvRC+Tlccv2EMwxkD0wsuxVnb/fwWy+XiYwfd09+4mH7xfh/27t0yscJ1hRdkVLQx2L8MzZ8KCGfgJe56xFg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9150f7cb-9b82-41d6-ef0d-08dad3a78b3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 14:22:57.4878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wpn7s2LhaEqc440N1iKqWFalcyvds5L0AShbLcqYjCe97h7MUiQzDI12EW0bDKVuAh+W+lcY1UYo8OeBMcXsEwCgSZVf0ncIfD2Slr0D9Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6742

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMTQ6MTYsIEVkd2luIFRvcm9rIDxlZHZpbi50b3Jva0Bj
aXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoZSBkaXNhZHZhbnRhZ2UgaXMgdGhhdCB3ZSBjYW4n
dCBwYXR0ZXJuIG1hdGNoIG9uIGl0IGFueW1vcmUuDQo+IA0KPiBBbHRob3VnaCB3ZSBjb3VsZCBo
YXZlIHNvbWUgT0NhbWwgY29kZSB0aGF0IGRvZXMgdGhlIHBhdHRlcm4gbWF0Y2hpbmcgb24gYW5v
dGhlciB0eXBlIGFuZCBtYXBzIGl0IHRvIHRoZXNlIHByaXZhdGUgaW50ZWdlciB0eXBlcy4NCj4g
SG93ZXZlciBhdCB0aGF0IHBvaW50IHdlJ3ZlIG1hbnVhbGx5IHJlaW52ZW50ZWQgd2hhdCBjdHlw
ZXMgd291bGQgYWxyZWFkeSBkbywgYW5kIHdlIGhhdmUgYW4gYWRkaXRpb25hbCBtYXBwaW5nIHN0
ZXAgKHdoaWNoIG1heSBub3QgbWF0dGVyIGZyb20gYSBwZXJmb3JtYW5jZSBwb2ludCBvZiB2aWV3
IGJ1dCB3b3VsZCBiZSBuaWNlIGlmIHdlIGNvdWxkIGF2b2lkIGl0KS4NCg0KSSBhZ3JlZSB0aGF0
IHRoaXMgaXMgYSBzZXZlcmUgZGlzYWR2YW50YWdlLiBNeSBtZXRob2QgaXMgb25seSB1c2VmdWwg
aWYgdGhleSBhcmUgbW9zdGx5IHBhc3NlZCBhcm91bmQgYnV0IG5vdCB3aGVuIHRoZXkgaGF2ZSBh
biBhbGdlYnJhIGRlZmluZWQgb3ZlciB0aGVtIHdoZXJlIHlvdSB3YW50IHRvIGNvbWJpbmUgYW5k
IG1hdGNoIHRoZW0uDQoNCuKAlCBD

