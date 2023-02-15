Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE1697DDA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 14:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495996.766489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSIBt-0007Vt-Cz; Wed, 15 Feb 2023 13:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495996.766489; Wed, 15 Feb 2023 13:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSIBt-0007SW-9g; Wed, 15 Feb 2023 13:51:21 +0000
Received: by outflank-mailman (input) for mailman id 495996;
 Wed, 15 Feb 2023 13:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSIBr-0007Ri-68
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 13:51:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf9e0c52-ad37-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 14:51:16 +0100 (CET)
Received: from mail-sn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 08:50:49 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6485.namprd03.prod.outlook.com (2603:10b6:a03:398::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 13:50:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 13:50:46 +0000
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
X-Inumbo-ID: cf9e0c52-ad37-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676469076;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Nzr/E63CLkwbLbM8rRfPLLeICwFeRymXzxCY8Ltgq8g=;
  b=LrB+aO3yzze8dxIY+amxr6bLS9fnwP2wj3hssHzBCYCQHxcxseaRofCW
   KUu3C5eTFChkHrL+jNtPjBElZcompJVU2+zCD6F3aLHdVTagcgjypXaoT
   Zae5FeruyWmaA1CNqXugh881zFtU2vhr4Yhurr5/j61nyDZLAiIV/JgXP
   w=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 97061230
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VvlooatDx4EQxrwlm22mM4NQiefnVPpfMUV32f8akzHdYApBsoF/q
 tZmKW6GMquLZGv3KtgiPtmw/UsA65KHxtJlHAdkrXg3QXlH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWHyiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGRNSPgivob6PmbOQUdVen/U4MNDLM9ZK0p1g5Wmx4fcOZ7nmG/+P3vkBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/6xabI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReLgqKcw2wX7Kmo7OQwNBXaioaiDhk+Ddoh4F
 GJO0BgVov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xDG8eTyUHb8c6rsgoXj87/
 liTltjtCHpkt7j9YWLNqJ+XoCm0NCxTKnUNDQcYQg8Vy93ippwvlBXJT8YlHKPdptj0Hz736
 yqHoCg3m/MYistj/6+j1VnDgj+q9t7FQ2Yd6gzJUySl5wViaYiNY42u9Eid7PBcIYLfRV6E1
 FAUls7b4O0QAJWlkC2WXP5LDLyv/+yCMjDXnRhoBZZJ3zai4Xm4ZqhL/SpzYkxuN645lSTBZ
 UbSvUZK4sZVNX7yN6tvOdrtUoIt0LTqEsnjWrbMdN1Sb5NtdQiBuiZzeUqX2GOrm08p+U0iB
 aqmnQ+XJS5yIcxaIPCeHL11PWMDrszm+V7ueA==
IronPort-HdrOrdr: A9a23:MR01W6nQevs04ZVeyn8CnMS6nQ/pDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="97061230"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG0gpcQvntOpqcLXbc4Qz6pgJ6aB2GyiB2+QgJE2rBES21wAHtM3Iv5KAgMN3m+XxijJEZrKgnKMjphNRAd05YyD2V+nFtP/xP+AgD02nmrBG5GXTvzmkrOQ898ICNZkmrq6Zw3xvKPJOkFVta6KQ99Sz7WeU/13j7ruXi3QoUji6TIfcdwUHiA2uQiueVLcrL6cF30Z+BPvgZ97Aot+0cESxYAYC2ZERJFTcaQX0ZzmH1lC8PkT45KXRxPluoTzISFLrGkvo/dDtFdh2tULfIEtKbQJpyjkVyFOel00bmr4suIuMxVl1fhaTFHR1Z6PnWD7N8npqtDC0IH1OX/n7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nzr/E63CLkwbLbM8rRfPLLeICwFeRymXzxCY8Ltgq8g=;
 b=ZT/AeA81PLXdlX1lesLDOg1Bd4pJdooM4gVq5Y48ddoZkX0dIQQpxck8AlAlgKl7JWkSqWISzTKaYuCVNHCfHk7rtjvS8IqLsz1RvlbzhQqLInD1HIySCCeJtsiAf0VpclsGUAXfRaEZcLqTr7UkSqiyqJtU+2lpw99KFb0tQERAGrPTWjsuB8FbrouQSYMsQKJgCSQm9JcxS4mnUC0Uq0I/nIBxhU8VNYzE/v0UqYtK7B+AbX/rJlxYHEHn4RZ3eMepF0OakIZrMOwdF+7uFhhhWNHZHJqt8m8cQxvwculdZuixQERbLSMMZIO8QWb2O5SfLEzZUiHm4NRB9Isbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nzr/E63CLkwbLbM8rRfPLLeICwFeRymXzxCY8Ltgq8g=;
 b=JU6owQLJ8Wc1S6ZYJSU5a5G8SpyQaA228rrR/v8g/PN5YLiQIFKx1myEGtb2UYETwbKvbhqjWiQjyIzlJCSQEC4OLo7lg1XQyLCRxMU4yAlaph2dUEI8ELl5dZexmXaSZ5P9qCu9M5Z903aZ5T6YwQxL/dOqgIeAwNDUErUu3tE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8a4dbaf4-880b-5689-1232-11d7ce96b28c@citrix.com>
Date: Wed, 15 Feb 2023 13:50:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/Xen: tidy xen-head.S
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
 <28bd8aec-cd41-7b5c-0f32-12c79595134d@suse.com>
 <7b0ddd99-4093-b72d-ba5c-ea145c0bf2f4@suse.com>
 <6abdc32d-5a18-20dc-a300-754f2b164fb7@suse.com>
 <6b0b2163-a8fd-4eaa-2219-972c02aa6e49@citrix.com>
 <ae6aaf10-baa2-673f-50ab-4b85994eec48@suse.com>
In-Reply-To: <ae6aaf10-baa2-673f-50ab-4b85994eec48@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: e471962e-97c7-4386-b84a-08db0f5ba324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1z3a8BmZQ39BxbQBzhEu0eProCw0MFxI5/0WbwTQj4x2Jod0NBwLK8iTk/JTC8VKlgHmyLTViWPgCNYanzupeLvd+X/759J5yJ1ux6TlWIpi2fQVW+ugJFNwxi5K7a+X8D/tKAgYrKGb8WGvEvJAyyy5d+85CgAHoIII8QUQNI0QdfKepM9QLahBXccCDcKPoTuwZcd3fFe3KJ7pO4Bm2eFpFxS4GhFZkYaWI3wHpyBbGXXFvuNe/t41FKJwwvQQes2Rj0ttyAIjB8L3ioOAUmnQZ1kEaPtctRfFle+G2fUhjvHFO6X5kRSv25DjwPFop+CuUIC66nbnIj5iXkB0Go9LlVTsdoyPwo+D8eUAzhWyem++dEe7kcSZxucKhmDLdZnLlDXnTqWeSPgO3bcn+oycvOAVD1CWW5tNbP3AUoFFbylZGM5nJXUKGo2vs3Up0dNjKERIPycAJfR3sY6CeVrTYa6QU3Bny1dELDBiTcp5msq7uYEFSRuTMB+RDhGemO0eUHTJJjPdKOPOsx/PgJyYSXv4pOuqaebY4qncGAsSgdcNn2KeDpkXo58MgAnGWhbFsGikAA7p3HoqX5pQiantjCyEWLUtU5eO8MUfyl1D4i67xlnnTJ0IC+GCAQP0fZPcqjEOGCnh5w8de316/Qsay/+x7s8qI7lTumF5Mo/RWH3JDMLseKRMee/oBATAUf/MZbWNnEuNfw2bXQeihIOgyNiztTztrsWBzIYrEmU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199018)(36756003)(41300700001)(66946007)(31686004)(54906003)(38100700002)(5660300002)(8936002)(316002)(4326008)(8676002)(66556008)(6916009)(66476007)(4744005)(86362001)(478600001)(6486002)(6506007)(6666004)(2616005)(31696002)(82960400001)(26005)(186003)(2906002)(6512007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkVWN0MwQnJhN2l2bzhKVmxMN3N4eUdrOVVnN0lHZDE0TUZHTWRaZ1V5N0N2?=
 =?utf-8?B?L0FpRkppU1N3eW9vaDN1Z1FhY28zejdaSEdnL1lBVEV5akFIS1FtL0JDTGJZ?=
 =?utf-8?B?andqQ3ZvYVhtVFlObEh6RDI2aWtqc29Sa3BiREtVTXR6UnQ5UnNHVCtEY1J5?=
 =?utf-8?B?amhWWHpaVldDWFdmOWlzRHJHQXJoTUZNRzF5RDlhTGtSRTcxSFRtRmpISFR0?=
 =?utf-8?B?aTlsWGRsU1hQSnFHZjRGVmttMjZDMURmRko2a3BwMnNQUnZJSVBQMTRjdWNt?=
 =?utf-8?B?VVY2b0JvdjE1N2NXN3BGeEFjY1RIZmgvMldkVHpuMWxVVkpOQmwrZ0VQRUpY?=
 =?utf-8?B?MFJiMjQ5UENkaUVVK09mMU5TVWNDMEJPaXlDSVU0bFhKNzRzZHAyNmd6TnVi?=
 =?utf-8?B?L2cwSWxQdXExY0s2V2xPeWdmSG96Y3Y3V2lOZXdsbjFhRlB3T1E3cXBvbHZi?=
 =?utf-8?B?bUlzM0RoSVY5R2pJWmtwSXkxUXB0a1BEbGJOYzBZMVJ6U0o4MUgyQjk1Z1Fo?=
 =?utf-8?B?ZlQ4OCtVZkI1V1pwWVB6Zk1xUGV5RTBnMnp1eUk4QVhkK08rMkFycDZlY2o1?=
 =?utf-8?B?MmpjbURZbWFsdzNSQWNXMzhQWm4weUNlRWNMU2F2MktaR0UwOUFpU2JNRWRo?=
 =?utf-8?B?WXVTTzU5dkkrbnRZMFVMcW9IRmNkVTRrVTB4MDVtSWV1aC9jOGZZUHc3VElp?=
 =?utf-8?B?YzRjQVFBTm5NUEdsWFMwRHVPUnI1SWF0YU5Dand5MUNVcGxDSTI1eXo0SUQ3?=
 =?utf-8?B?Y1hPdlNnR1BFZ25raVpuaFIwTlRXaWJJRk5lNHlGbjVCdXN2c2FZTURwUzRk?=
 =?utf-8?B?Qy9abzZ2THEwWWlMQzAwQ04rb3V1VGV6NFN1bENXTm9tanF4UkZpUHRBWW42?=
 =?utf-8?B?bGVzbjVHM3ZRUStvdmxTVXFIbHJpa1FzQVh3UllLeEwvWUt6S0pNbVJnQlBy?=
 =?utf-8?B?MENnZk5Bem12L2dQME8xN0JDNFpnMGo3dTVVN3p4K3p3ZmYrRnNidGZXNERq?=
 =?utf-8?B?MG12cEt3SGVDYmRVU0VsVXZ5bjRQVklKcmI3Mjc5T3Q0SjZmVkg1N2x4UXA3?=
 =?utf-8?B?NDc3Y0pYRzlhQ1o4RWlBdGt4MkE3QUJyT2pHOTF2NDF2VDFZZG1WWGcrbHc0?=
 =?utf-8?B?M21IRXMvRkxMYitiUS85MU5Ld2VjeXRkZDNNck5QTnlVV2NtRnpVUGwvN21p?=
 =?utf-8?B?SitCZnRYTmNJYUZrTnI5THgxandoOWlqbEZpTUxmc01uRUVuRTN1SUZqc1dQ?=
 =?utf-8?B?Zmg5MTJDNTFRcURGVDZUT2kvTjJZTGc4TXpZTzNQZVR3NG5uRS9BNUFXSkhF?=
 =?utf-8?B?TGRtbzFlYmZjNEZQdXpmYmVzNm9nWGRqdzArbTJLMk5maDNCQklwZ2RoSTVQ?=
 =?utf-8?B?NUs3NVZDd010Ym42M2lKaktpb2tOT1hCOWlQejFqM3MyRXQwcS80Z3Znc2oz?=
 =?utf-8?B?S2NIcitpbU5FVVhzbGdVbW9aaGloZzA3YjRBVENRZElWVmRqdkxFc2lpbEdS?=
 =?utf-8?B?MG5WcUpnd1l3bGxSWGxlUkZUelJvS1M4QmlkYXFrV1FuSGxmU25wcmt2ZnFv?=
 =?utf-8?B?eVBhN2xZQlZyTkFQL05wVzN0LzFOeG1LcFgxN1RhWWVHUituUmNlU2pDNUpB?=
 =?utf-8?B?TmlNb0VoY3FwMm9VNFM2aDNaQytQVEdONElQK0RiQmg1NDdnM3ZwWTNNRVZl?=
 =?utf-8?B?TWV4TUhDY3pVZHIxcm1maFQ0elduUk5paW9aVi9QRjcyVHhXRUpIcVZlRHZG?=
 =?utf-8?B?SGtKWTZKcUJ2N29YWWEyVlN5VnJiWitmZ2NQQUZDb0tiMmZuVjRick5rd0Ji?=
 =?utf-8?B?OHU3a1UraXk3RFhyQndwdVFzT1kxSlp0U1p2RnZzcTRIdGQ4RmpHN2w0bGVy?=
 =?utf-8?B?enFtNTNENmJENzA1NGNwMzYxREhvbHdIZk9QUG9vZVpFZG0vWmMzL3kxMGpl?=
 =?utf-8?B?dDhuRk5taE9OVnY5WGwwM2JJeXlaM01ENklLL2ppaWYrWVlhcmxZUnFYK3pX?=
 =?utf-8?B?RFJMNVhqbkJXL1FxdVVVTXhORUtpOE4vWkk5SHVoZFNDVEpnNG1DVy9zR3Rs?=
 =?utf-8?B?SzB4MHRzZC9nak94bC9oKzFINUMwcHVwT3BFamR0UDNCNXBFYU9Tc0ZFNGd4?=
 =?utf-8?B?TklwTjZUeDF1MWxtdDNaU3diNlpyVTEwSlNVQno4UGdyNTFrV3pKVFNldkxQ?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?RGF1TWlFRlovakRMbjR3bE1kNUNxM2REakg3RkloWlN6U3EyRWtoQmIxL2JR?=
 =?utf-8?B?bWIwK3d3WUlabnU2T1Y1ZVdBVXZkZzlwRXZnNDRzMGRqYXg0bm1vdVlsNng3?=
 =?utf-8?B?YTZmVU8zN0kzVzNDYTRYR29wSkRja29YU1hjRVdrMjVGeEZ0eW9FNGpKcmV1?=
 =?utf-8?B?VnBVY2E5UEd4dWNzeTgvWFVZL0hqN2dWMWVUd1AvaXFLRFNiVFhsZ1l4eFlI?=
 =?utf-8?B?MkpUaVdYWkpZY1RDVjRpcU43YWxUSWNiNk8rbVlpK0dwRldneE01clRML0Qv?=
 =?utf-8?B?N1JWN2JDOFBxeHVheHdoSWU1Ymwzakd2MFJsamxMVlpWVnZQUzBRaXRFZnNq?=
 =?utf-8?B?MXJzazI4czRYb043eE51V0RXQzlVR25hNThON1VydDZiN2J2YU5qV0t0Y1Bz?=
 =?utf-8?B?NGNkRWlCemtiVkFlZDdEck1rdE9JYk5lN3lBME83Z1RKS1MxTFp3YUVINjVr?=
 =?utf-8?B?bERNYmV1OUFvWHBxZ2pIWHdjRmppUkVQR0xTRnZXNXQ1ZlNaZVQrQ3FlTFBN?=
 =?utf-8?B?M200emN3NjhuQ0JMR25NTCtzMFNUek1hS0g4bld6cXVENWtNdTJRNDFKaWdX?=
 =?utf-8?B?R1Q3MFIyWUVqT3FLRlVUZzdqUytVdXJtYzNMYUZGOXlOTTh2a3Y3c0FlbmM5?=
 =?utf-8?B?a3p3NVpDU1RYdTMyWDA1OXRCSFhRL3dvZ3MySGdSU1dqOE04clZXVXhDbUxZ?=
 =?utf-8?B?ZjhoRmVxR1VjU3RHZVQ5UlJGcHNzSFlSMlA4ak9XZlFqSEkzMUZNaE5RaTVW?=
 =?utf-8?B?dnAvT2k0dmtZUEx2QVpDSjlucU4yS0d1d1dSTmhCYlkxZ2RUekE3QlpEbXZ2?=
 =?utf-8?B?enIycVFvQS9QZ1JsUERQTjNiSXZlc0JOc1B2d0FYWUd0SXNkdDRXcW1OeFhP?=
 =?utf-8?B?SWVYRWdUWTRJQXQ2eHhyYk8wSEJ5TUJONHlXbktZVkNDVVl1OGR2ZHdxTy85?=
 =?utf-8?B?TUxoMG5JZnAzZG1jSmVVZVBVdTlTd29oR2NNM0VDVnhNQ0lnaGM2R2hJTDFI?=
 =?utf-8?B?MGJyM0dUOVNQZHdibW1wR0x5ZEVpaEhHLzlnaVJVUGQwelB4WDljT2l5SFhW?=
 =?utf-8?B?Y2hST1JORUg3d3J6S2t6djdSb09KZ0ZwNEZXVTBZamhSdmM4bU5VR00zeFlR?=
 =?utf-8?B?QUF2Nm1Jd1FBNlZLMm13RUFUQTVCSzR2NjB3TmJLbWE4MFJCU1IxZDdsYnN5?=
 =?utf-8?B?QWpQRVlZWDYxSjVQdGRaL0JoaFBTQUJzUVpDbTlxQjU2ZTZDY3lscXRtRHJk?=
 =?utf-8?B?bmpPMDZ1bFJ2Q0E4ZlVEVXExRzNDZ3FoMDVxVy9IUXloUnBSREV4UHFUQ1hR?=
 =?utf-8?Q?uLD8KTux8FBmi11UWF4uVDJG+IBFi6/l9A?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e471962e-97c7-4386-b84a-08db0f5ba324
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:50:45.8933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGxpEHwMzAu33gEJZ/5++bvN3+LSOt0QWDlpKa7lPKfml5+SDkUs1n/lq9+DLiU2SxbzhZ9QTUiGW+WWGoEb4PQj937xccPvAAF9cKhuafU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6485

On 15/02/2023 1:36 pm, Jan Beulich wrote:
> On 15.02.2023 14:25, Andrew Cooper wrote:
>> MOD_START_PFN is PV only.  It's not applicable for HVM/PVH.
> It isn't right now, yes. I continue to be uncertain and would
> prefer to leave it as is.

Its the wrong address space to be applicable to HVM/PVH.

Not to mention that HVM/PVH already have normal ways of passing the
module list, so even if you fancied respecifying it to be usable in
HVM/PVH, there would be no interest in anyone using it.

~Andrew

