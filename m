Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38FF6B76FC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 12:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509245.784649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgmr-0006n4-4T; Mon, 13 Mar 2023 11:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509245.784649; Mon, 13 Mar 2023 11:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgmr-0006k4-0g; Mon, 13 Mar 2023 11:56:21 +0000
Received: by outflank-mailman (input) for mailman id 509245;
 Mon, 13 Mar 2023 11:56:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koCJ=7F=citrix.com=prvs=42903c55b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pbgmp-0006jy-2I
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 11:56:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eb2c4e2-c196-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 12:56:17 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 07:56:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5160.namprd03.prod.outlook.com (2603:10b6:610:a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:56:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:56:03 +0000
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
X-Inumbo-ID: 0eb2c4e2-c196-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678708577;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VEvFrNv0eJ7kvUNpkCPz8M63r6FsgRHURGslvTPK5Bo=;
  b=JNCOdjiIgZIQj6UiF28WRRd9qxvRFjh5YpWX1W1Wuoa6r3VqkfhSWJ1v
   kRTvujyZlFockXIoE7kGmAIZnJ1eLb0Buyb692NphPGLwFlnttYfYQ/K9
   OKS8r7xYtyDa4HDNyXBwg7I1/qXNG4tRzMgPxgc0epiXkTk8Nudqu5z9h
   I=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 103012085
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ixtqw64ES41LPfa0nWEPFwxRtDjHchMFZxGqfqrLsTDasY5as4F+v
 moZWm2OOf2DN2LwcohzaYvg80kE6MfRnNBhT1Y9/ik1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 aMoEgoSchu6pf+P0p+FW8heh+ceM5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojuiF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKT+XhrKY63TV/wERCAQU/Rwq0n8WTsUrhdstSJ
 UML4nYX+P1aGEuDC4OVsweDiGSNr1gcRtNWHMUz7Q3Lwa3Riy6bDGUZSj9KaPQ9qdQ7Azct0
 zehhMj1DDZitLmUT3O19bqOqz62fy8PIgcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxAA3g7gDhMgH2r/98V3aiDKhvLDASwJz7QLSNkqu7hl4f5Kkboru6l/W6/dPBI+cQh+Ku
 31ss/OC4f8HF43LtC2JTOgHBriv696MNTGaillqd7Er6i6/8nqkcYdP6RlxIU5oNoAPfjqBS
 E/UvwxV6Z4Kenu3ZKl4S4u0B4Ihyq2IPdb4UvHdKMhOa55+XAaC8GdlYkv490LsiUkll+cUO
 ZqdWc+pATARDqEP5Bq7Qf0Ml4AiwC8WzHnWA5v8ynyaPaG2YXeUTfIPNguIZ+Vgtaec+lyLo
 5BYKteAzAhZXKvmeC7L/IUPLFcMa38mGZTxrM8RfemGSuZ7JFwc5zbq6etJU+RYc259z48kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:ks8cqa8DfBj03mP37cluk+DJI+orL9Y04lQ7vn2ZKCY5TiX8ra
 vFoB11726WtN9vYgBDpTntAse9qBDnmaKdg7NwAV7KZmCPhILCFu5fBOXZogEIEheOk9Jg6Q
 ==
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="103012085"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/wb8VQF8N1OwC20f3SyuKUta36yzLl0sd+xprhhe2FUgMJkrQZCN8fcj6YBswOUvqppVRip9AECLqwf+EtLXLm769vvuX021bt9/xzTAn0Fxu+kvbd/20lDbv8bOgC3pvNtG9Ou3ONN1Z/RkBKVVSnFl7Eo5QKUu8GWPir7TXoRCoTMMEcb40Y65NRC4UlELs8bP+98zRJ8qsZ4MhjUgNZbEW7I3XGxcyowajlwPaxvAleiwnZEvVgP9MU8vOXT1jYGvYusWqERMVocMBNNoSPgZ/Dz7iL3Wl522CgvXs+j6lwjX+LDDzaeH8NAb0q8KPm7Q0n4A62FGDLtPW4dhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEvFrNv0eJ7kvUNpkCPz8M63r6FsgRHURGslvTPK5Bo=;
 b=TflFIa2uVriMs1a89sqMjIrHAPd0et48qNdQgGt60eGf7BUMp3AYh6bZEAAqn7N39CVaaGHxWhMAyprUwnRoOwP3H79eMVCOGEB652Z5QE4CI4XTndRu0Auj0I1jZpzgcJCoBLMxWN8LNkNx5MlI0wrhw3C1wvSCFxURoz1Fn/uyuhuxiJhDIYYVC1gZymqDsXAqioNu7VzR6J+dTD+JbhLKsCvlSSZoATXEqg2FRfrIuG/jhk+ZNKYikLDsHhi7y8tJJQiN8/ZcCKKA4Q62g07oSKkQsNJc+GgxkwlzVi+LwhqZ6ioNY+GixG67/dd9FHRwkCBD4RzHeLjWyvkrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEvFrNv0eJ7kvUNpkCPz8M63r6FsgRHURGslvTPK5Bo=;
 b=bg7o0Y1xbktTb1s+D/dxS4+RYCkmLYZcDkMkw7fRhJJwReRBKsrQMcrorB0GnGECMVgr2H3o0icBrmxiKi2JPH1fyFvqzx8ZZSPJcbat+K6QxsAeh42inkh9x9lFLJT3rJId8+eHczRwzD4/hdRkEXMbWjyqd4rYZWdklI+KqbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <682beaa7-736e-432a-3525-1368891641c6@citrix.com>
Date: Mon, 13 Mar 2023 11:55:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 1/6] x86/pvh: report ACPI VFCT table to dom0 if
 present
Content-Language: en-GB
To: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Henry Wang <Henry.Wang@arm.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-2-ray.huang@amd.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230312075455.450187-2-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf4aef4-b0b2-463b-8b79-08db23b9ebac
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lkvHxZ79TBXQL9uCtnrLjxE8yuGqnmCfFykxDBhpq6oOO+RXlU37t+EqTXBt2QM1M0PRsL6TrP2fY6/AnKznohbwqn36B5w5VRRdYHgiEqox3qFSMPfnv83/3OSa//RSbYQmjLVVAUHRu0TUVBTPB58I8hK2OyU8O4SWj+wmm6LnYuxKWPfVYeKw0Dj0/oIhP1W8he0Yq9H89ycfT15WcfUgx1DOo3YBZH3WLwjLWiLHYn/bFJqtY1slyEa3giI/Q111c9OxPGBwl0iUkwMOjxJMYnNEIH4F4M8rbPZB3m9x/BJZmoQlvq8cWszvwwakYYvM1V4zPsZ4vvVs+5o1rEX49vEiYxDvpDcw50xuQTHXYbKYCdUHw2UNzXPan3e9bEirWL9caQwi/vYVSQQCzWZw/Zjts2/EzwY69XQUsIDk6pT0iO5z/bMlN8Vwn3Ae+W+0lACAGKNNDPSb8qqZpb0CgichcnJc7lbcyht8mBhYJRR3ETrKykXBl8LxN7ieiNzlzjnXjHJSC7ZC/CcIoPG+jeKuCEZeuE258h5wVmpeo5MPOML4qgLhGFjDAPKaPuejOdNZS755CZRLaAAmmbbjzZQXpgvvRCAHuYzV+iCZM09tdIyz+pM+K4YMUIaZkPfSio2Dg0aBV4LyUSKVoLAFSbwqPAh3kcCNZHJzz1mG0geIevNPiG/fufEPqhVnav1QF5+dQQQQa1rLDbfYQRa29kA39ME+JtkXvI2D1zQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(36756003)(86362001)(31696002)(41300700001)(186003)(26005)(6506007)(53546011)(6512007)(7416002)(5660300002)(4326008)(2616005)(8936002)(316002)(54906003)(478600001)(110136005)(8676002)(66476007)(6666004)(66556008)(66946007)(6486002)(82960400001)(38100700002)(2906002)(4744005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjlKZjNNdEFEeGZjRXBlY2FGUmpZZDgzM3RqWEFoNmV2S292STAwM0ZlWEVm?=
 =?utf-8?B?WklxQTJYcWxTajNXczFEd0ZjVUFoajJkWXUxQ2kyUTdSL2FaQzFscVlRSkVO?=
 =?utf-8?B?Y2NpODc1ZUtQREVvOXZEaGhVQWFyd2RpWFYveFRFVWUwM1J3WGVJaFNuWG9l?=
 =?utf-8?B?NVNHUDB4bmkrTzR3MkgzNjRhK3Q4MmxwVmpDYmN4SHhxS01UZ2lYL0k4RGJ1?=
 =?utf-8?B?REIzbkNTR0tNK1h3Vkl0TUFGWExscVNWYmNRQ0xtKzlxbmExL21ubmJsN1F6?=
 =?utf-8?B?Y25OaHF0bVNmQ2ZoaWYvcmh6UE52djRFbTFxM3Q2YVF6dXEzUGRGVDFONHpx?=
 =?utf-8?B?NmxScGtmNS9MKytPOWR6OElSOFRVUjdQOUVTRW1nL04vT2xtdU5QT3ZPaWYr?=
 =?utf-8?B?MnpZczkrbHoxSkJ4NUI1bzhTMVVJZGVEUzJRcTBuY0I5YytxVHphWGp5aFV6?=
 =?utf-8?B?TzNpYU5DdVNkcjVrWUxqUjM2anFXWEhSOTBoUVZvRG9ZbTVzblJMbFYwZXVm?=
 =?utf-8?B?NWdpaHNqU2pXbTR1RFcrTzZNREVJSEh1cTExTURuVmZJSjFyMDNsdEFjYXd3?=
 =?utf-8?B?c2h3THBsODAvUk5obkh0VWhoaWQvdmpsdmw5UCt3UExlOGl6aXpFUms5WDNx?=
 =?utf-8?B?VjN4SnRmUmJwTTM3SE5LOVJDOThiOTVxaUNRTGtlbDJ2S05mZEJTZlBlL1No?=
 =?utf-8?B?RWJyU3krWlZOQWNSR3E2NUJRUEFsZE5hNXdzT3JvSkJxblpIanNBWWhNVWxF?=
 =?utf-8?B?cXNlejV0Y09hU2RSTU1Wd1ZiN2JTb1RHR05nc1J5dHgxQlYvN1U0RXF0b1o1?=
 =?utf-8?B?ZDdMaE9LRU5wUHhBYll3TUFGdjJ5dE5oYnFyYzE4S2xYRTg2a0t6L1JHTkFj?=
 =?utf-8?B?MzFYUXRkMTFtai9LaEdIQTBxOGNaaGZ4TW91QkVnNVcyQnNTUjJEdjd0WHIx?=
 =?utf-8?B?MUd0MG41aFVCb2pHS1BtYzZERStEa2krMld4UWE2eGc0Q1Z0SFBlOHA4dUM1?=
 =?utf-8?B?QkgvdTBVcmpWYllYWC8zZFpsb2cvdXJuRko3ZkFrVkJiVE0yc0hnYTRrTGRU?=
 =?utf-8?B?SXZVSEk2UFI5R3NqMVAvTDFKMi9XMnRSMk4yRkg0M0FHZFBwSzFUV2ZndVV1?=
 =?utf-8?B?UE9JS3I4bjJMRzE1QzI4bTJDRmpCYmJIK3ZNekhmcndpT3NhcTgzOTB3OE5a?=
 =?utf-8?B?RU5BQ1kxaHJqU3Exd2QvblErR09HakppTm9KU3BuR2t6b2RwY0RyZXVMbDhT?=
 =?utf-8?B?UFBSenQyMWdPeUtMcFZkZUR3WUpwUVcxektELzZMTk5qOHBzZEJqRHRnUEV5?=
 =?utf-8?B?Z0crdHBjRnhvdXpNSnMxRWE5N3RuOEJxdWx4MTRzaTRsNkk5MVlNZDRhcmxv?=
 =?utf-8?B?dUpwbGxpSUJxZDV2ZDV2TjQyNC9YTDBOOHRWcGRSdkt4QlpHZE15NnM3bC9Q?=
 =?utf-8?B?TTB3TkFNMjBKZHZoZE9qeVNxK3dzSWM4NWlLcmRMWCtCL21JZ0JwNC9DSkFW?=
 =?utf-8?B?L3JvYTg5a2xxa3hzTEwrazBDa2w2YkRqZm9uSlZrSDdIV2lnM2VaVnZON1g3?=
 =?utf-8?B?MmtPeW5HY0YrUmU1d2FRd2xPa1NKTUd3TENBOCtaVE9SYjlCa2pIWStUL2pF?=
 =?utf-8?B?N2JPQVI3WHozeFllUVU3VS91WGxGM0EvOU1kVmZVNnZCNHpuNVkyMk85U09D?=
 =?utf-8?B?N2FKR1NDTGJIMFVCRVlMV0YzaEJMZi81aE10cDNlRmlMTXdLUkFCdzNnd3c2?=
 =?utf-8?B?WG5OQmcwdzJGc1pnZmZwaFhPeVdTOGgzYjQ0b3NULzZnNVNjZVBjYnpXN3Ra?=
 =?utf-8?B?MTBsQytOaXp2U29vdFNMSVZnbG5mb1h4ZTZFYXBTQXdLT2JVZld1WVloTnVP?=
 =?utf-8?B?RGRxaUNBRFh4YXpoQ29VZ2dXcWk5a2dCUm1uVnh2bXZwVldjbDRjZWlxNVRE?=
 =?utf-8?B?QThqVi93RzlPMU1JTmdGZDdKak82dnVvUWdZWkRvWTBWRHhDVUpYL2NjR2J0?=
 =?utf-8?B?aEJtNEh3TGtmVDBYSi9jekdsNUJMbVZKRzlWQjBGT1EyQXZtS3ZocER6VGlo?=
 =?utf-8?B?NnA0SDdSaFVDNVB3WVdZaW5aQy80c3EyU3puVzlQWW12RCtjRzRYcytSZk5N?=
 =?utf-8?B?d01GWklpRVlSN3NCL1hkOTJVdjgrMmN0RkdnRTFvNUtTaWFxdGZxNkFyWnRM?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Uc+xrTFd2ruRuKKQsqUM4vz9O2poqtRgIlp2wAPRj0VAAWiL6Jf+GYMMQ4JAZKK+yzs/u1GkCp+BPAk7gePipKS2tGpggu5yMbSeWIbEq6WMliVyCmGx4XktwxeUPAy9rMRDne6K82Leg1LrBFemY8Efp/ygDWyH7Pqnyt8KvlGFKgiPcdpjaaMonBDonnAae9KoxTssmohxeZeWHn6kedop5nF7XRpP0OA5M4PG/F7pMQ3mVnc/hEaaIUzFvGFBzOf0ipJGJLIZt5qi7WewB93nki6AY9Z9qkW3Nnl4wT7jF7gxmRrImjxnFOdtDwLOv7Km1kY182gswYYi9L23xdyXlahMM0m8u+IxLPC3JierC36642RrwjaROxJpA/7bbyxsdtLmga71VTd1rpfXIMuwJ0Sd/Vn2vLkA0ZR56vX2lsNNmVd4tzjbh1iw0jVBHm+pKXJb1vZMRi5+ftGRFbPXYGfWhRZgLL7aezwBxCF+bLY/008X50oopYDJfhmY/NrL94uKILkFHpb8jNHzAs4CqdvOop5uCr0eYF9F0mSsflGUPCkD0BBGYsJLLAGD00FWymjL6ARXnvibWkFBX5oe2xUKUydz6mkTyz3TE5IJSWRzc9oJjiy7a5nnajVrCh05zVMj7hxq+7DI7mXuBiYkp3TngORehKbqsduadpVMYsweLRyC4eUiwpa/RkI51X1F5G7pAuaZg3ycscBJo6WRMpYjauQMQvrSvZ6VRvBskzJLH8Vj62jmjTpCcoXGEs3sRtvIf7ejwWskfZcGQBZ8coGI8fTOqpPVybx1xHsOx7nj3i3yilEg8XnSPjjgY5CzGxd9WvuOp0BixHpaKAwhzXJ0mFfedwzeQ92lGzjrW/x7TwGmihXhhp1iaAt9Qy9DKu75hEzdyrT3XDPXjw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf4aef4-b0b2-463b-8b79-08db23b9ebac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:56:03.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Meuyb62y95+SwPvgk6Z9h5Upk+HUp+oNRL/BPwqoNZPWjWACArcWi+u4qXkujaQ/QNYqhpaKLDOCXHBj2j8uFTt8CMN6zye/RoZKkPPMkfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5160

On 12/03/2023 7:54 am, Huang Rui wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
>
> The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
> from the firmware instead of doing it on the PCI ROM on the physical
> device.
>
> As such, this needs to be available for PVH dom0 to access, or else
> the GPU won't work.
>
> Reported-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-and-Tested-by: Huang Rui <ray.huang@amd.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>

Huh...  Despite the release ack, this didn't get committed for 4.17.

Sorry for the oversight.  I've queued this now.

~Andrew

