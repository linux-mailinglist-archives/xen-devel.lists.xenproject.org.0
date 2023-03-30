Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99F6D059C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 15:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516709.801276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrsj-0003SY-25; Thu, 30 Mar 2023 12:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516709.801276; Thu, 30 Mar 2023 12:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrsi-0003Q7-U7; Thu, 30 Mar 2023 12:59:56 +0000
Received: by outflank-mailman (input) for mailman id 516709;
 Thu, 30 Mar 2023 12:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phrsh-0003Q1-Ok
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 12:59:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c22beb4e-cefa-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 14:59:53 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 08:59:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6327.namprd03.prod.outlook.com (2603:10b6:a03:399::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Thu, 30 Mar
 2023 12:59:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 12:59:43 +0000
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
X-Inumbo-ID: c22beb4e-cefa-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680181193;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bpZI43ZwWrotbAdiH9DcCPgs3Q+9q81egCV50+saht0=;
  b=O8brDqxURJS+aDUVL2Uh0Ta6Sj1ta512zeSIPrbl3u0NbK0LIBjQfGqK
   oQ8iwNAsMWuHN5JJbjei4LQ7RuVm42KXmdv6BI0JO1LS15nJIxUAA4NPy
   KDFkDfhNSoNk3Q0k3qCAbNxeHUdtCy4dwTdaCFAOXi4exlwfpFJPxvSET
   8=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 103040047
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tN80iK68GHqFM+s9FBB1gAxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 jFOWW2FP/7eamPyeYgnaoy19khVupKDydVqTAA4pSlhHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasQ5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 MAxORkUQ0m6pOu7mb74Tes2xZoDBZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+GF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKT+XkrqY23zV/wEQtFyI8D0Cbi8KFixO6ff99c
 kcf5Gkh+P1aGEuDC4OVsweDiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceZxYny
 1uIlNPBHiF0vfueTnf13qiQhSO/P24SN2BqWMMfZQ4M4t2mqodjiBvKF4xnCPTs0YSzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:aMgfxa8jQHPFllexZRpuk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103040047"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wda8d0rHsYfkzVSucAcDtOEA/1XWvOsRu1Q+v96skEMWXR3ZV4fVmu2yEhUmYaAjm+uCh/IfiA0VgozGiH2RC3a5b0WPPbPnoQ6tzTwSv8AEqTmhUvbKA87UMP62PsQ+6JF0OqQXrwiGEXdoclzGl0TNd8PrV3McWOiP657ZuJDOH1Dszfgs3BFVjbYEqP2ctY5KysKT9xgpxQWTeOnyYBvGxodcVSIRLLhvgIUeu1s9OubyUANGAYU233rIWw5xkQGmCDpGGtSSvGI1afFX/QaRw/J7dy/pJX3Odo1rShopI41J/PQyG3pz1QehOlyaM5Mc/JbZQeILGZYg5zTzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydxzYJvNQNKpTgpx0Ez9ufD32XjxhTUy40rwB1NomAw=;
 b=WI11VbMWcahzq4Ix4YwIL1kdL6+P0rKfIJ4bO49rvZ0Ba75D0FMELxrko7QGubN7lGRZLXf1ol+JTybQWyMHqC72w6q1jLY36bHY4+xAxivF6FV+2HTVTgNBND07koILaz+van+Ardkwnrmb6NUrL8mtxpM58GYeit5hzm52IYqQJ9QkuDRZ8Lg+h95KnjqFrbhVCVsT1G1frL9PtY77PnxfFNtnkEkn8KeYh6l7edU6+V9QLI7p8JFjpYvGZT8roV2iM4tggoupsQu0WJyVJsKK6wbXHB4Xrib7MKgXsaYncPqJb1jeS27pXVjucdy1dKiUb0GmP5KuoWiehHUEPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydxzYJvNQNKpTgpx0Ez9ufD32XjxhTUy40rwB1NomAw=;
 b=CEPTJ2dd7eKTMyvFYcAUSu89LXfSIHbMyyS4Lr4NCGUxZGMi3a36k4e8Uq0IRbtP+QzWlYfgdI+C6RxRAt8YEX3USqJ+XHTA2BJJ5gXJ4VREC0FefC7ZxjX0qzjpx9PO9ckjUQ1vKUlmzrQdBOXjIq4PJKtPuS30S22BXYTL49o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9108a58f-da8f-14e4-de88-a7c8c8abb0f7@citrix.com>
Date: Thu, 30 Mar 2023 13:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 0/9] x86: Merge cpuid and msr policy
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <ZCVtcR5u/14/WmCU@Air-de-Roger>
In-Reply-To: <ZCVtcR5u/14/WmCU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0344.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: b73a3379-3a19-4b02-3c00-08db311ea14c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qz+MdEe7TuAVc2ky8HRnfCvOtbUWD5liqSlp9JtEVUytGzyTrpOh4Cf7zQOmVHDwTi1VWsDGrbapdH83SUzduo/48Nae2/HRB4e3saBaeF5m35MPItr97U7QhJ+395iTSfz/6ycblaLww3d1Ko93mASZn3dR2sYfv/3bk4k7Vww5LBE5kVk8u8eRmQzSVTkg0fLAOd0ywi/syUrwbMvOghHBHLDVD2++4gg2EyI02mEswy6699YlaFZl/OcmVqpuaFGl4WCV+ETyY2Tjsc4+vCi8Dc5oFgSgRoelgY/uN9vLG3VO3fsSVB1SpV8rNUImjrrfI73g0PyNlz37xvdT3czimP5yvnXey3i/sykwEQrf4zpAL7wkGjV3m3mL68fToKNLoMLnvq+A0Bl2BRPHUjZHiCHCwkZ0uPl7BPkF2AYz17I2xreHyTbArpC6xHbZ+r2TrvcXic7cKt3NOhDEFdBp3GvHF4euMKVU/1p2ORPego1YCVdQBuH6HSfAxRMvDrvb30VrT6jOrxtpuTFeogwS3E/VAq5b8EtNRX1M+egmb28RdOIrsTgkUJCke2BAiYoOb5KKS8+f7FdwguYErKSIzgUH3IM0pWkLPYhddr3inAvQd87guFPIBRozH89+9dYmfS7JvbFx2A4wz7pwww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(8936002)(31686004)(6862004)(6512007)(2906002)(2616005)(38100700002)(31696002)(36756003)(86362001)(41300700001)(6486002)(82960400001)(5660300002)(966005)(478600001)(66556008)(66946007)(54906003)(8676002)(66476007)(4326008)(6666004)(186003)(37006003)(6636002)(53546011)(316002)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUgxZUZ1clE4anFtS3UwTjlaS1F6L0hYNkxUbE8wRUpmSVVpQnJwamp6VWZy?=
 =?utf-8?B?QUJHR1o3UEVMM01DeFRRU1V6TWYySzJRQUxEMEg3eC9YNFR0UG14Q1k3R09Y?=
 =?utf-8?B?Ukp4SDV1N1BXUm94VTIvVElDTWVHczN0MGNhZVF5cjNrajdXU0lWZW9vd0Zi?=
 =?utf-8?B?SWZGQ294VWtXQUJFUTAyRmRTL21sb1BhWXh4UVk3Yjk4VlJuL25IMGJCNitW?=
 =?utf-8?B?L0NZdzAvVXMyT09CRjN2eDYyTkJFT3hOMVBzSU9BVGxZbkxSWEp3ODI3Vklk?=
 =?utf-8?B?bURwM0ZBcE43YjA5RHpiMGIrQ2VnTTFxMmdSemE0amlxWk5vdTJpb1llK1Yz?=
 =?utf-8?B?L3VLTURnZGswcmhDdnlJUk15VnNLSkFPdFRJdW84L2FVQW1ISGIzNzJ6dHIx?=
 =?utf-8?B?WWl5NHJRQ3VuRTdJTnNxcW1WV1NkRDZrZjNYTDU2UkltTkRhWGsrblFWWVJi?=
 =?utf-8?B?RVhVc3hXS25rSVJGbE1GNkhNdWxYT0dzRFE3SU04OXNzWk1wZEswcHVKUFNr?=
 =?utf-8?B?VlhPYnFrTmFvU0R0WktvaVorVlRDSkJtZjlsUlovNEVmYldxb1NsMHQrczRV?=
 =?utf-8?B?U083RmxPaGJRUWFGVjUxZGVMVlkzQjBXSStDNkw1dGZ2VldYRzdZdVdWdUlx?=
 =?utf-8?B?N0VTdXZ4clRtUjlQZVd1Wms3dmM2Zk15T1h0aXNZNTNrblRmcm1Od3pacis3?=
 =?utf-8?B?VlkwbklBRXdmNWdMa0ZnUEpJTXREL1FwMjFjUHJxbEVyS3djdStPdDhxaGpR?=
 =?utf-8?B?aEhremZkNVJUZjZqeXVBYXIrT2VqaXo1SFR0QmpRNGJEUFZRWkhwU2xtaWxJ?=
 =?utf-8?B?WE5NQnhDNVZUdjhNdlpQS1hDVGMvcmJtbnNGQVRwaWFDQ1BrRmZIWGlzb0la?=
 =?utf-8?B?WnEvdWtEYVdpL2hPcE1sbUFPNVhkUFVjWnJZcHVhdUk5a0YvSXNsUWdCSGlG?=
 =?utf-8?B?WEtkMkRobng2SU9YRGxPcW5ETVJoQVlDRjNKNWxyaVlpT0hKR2RsbG5hcW5q?=
 =?utf-8?B?M3BnTnFSWWxzSk5nanJJQzBBYmlvczRqalEvcFpGcWVMaVo2TExJYU9tV3ky?=
 =?utf-8?B?aUFqakdNYXovdmQyU0F5eVYrTC9BNGVpcWNCVXJTVVk3SVlSMStRbnd1U2VQ?=
 =?utf-8?B?cTUwWGlmMUk5aXpCaDBjMFNsQS8vL0NNTFhHVXpyUHlzUFZSU0srRlBxMDFW?=
 =?utf-8?B?WTRwby8rV1ZqRGlBeGtjblo3QWVHMExSUlZBVStKTlNWUTZaNllpQUVJS21K?=
 =?utf-8?B?Wkd2ZkFsZUhUT1ppbmQxT2VNQ2lDaWwxOWJmUGFmcXBCenpoSnRabDIyaEYx?=
 =?utf-8?B?TDJ3QVFLWUsyQmFQN1loT0N1Q0l2RVNJUXcxTjEzdEV2ak9IVGVnV2lSWnNp?=
 =?utf-8?B?OVVMend2U1RHNzJOYXozdVN0T2FKc3NyeWRYMTd3YXk1bTAzUzNBR3dNWnlo?=
 =?utf-8?B?TFh5dEJXd3NBY0lBOGtuSEdBMml5c2s1Y3NKQ05weGJXQlltT0U3MEc1aHdW?=
 =?utf-8?B?VkExeWJqYmhxNkFSUkw5dnZYbGVtelNNUHRsbXBKb0FwMDBzNERQV0pETkww?=
 =?utf-8?B?UlVxaFgzNXRpTm41Nlh5TFRhOTVuVWJ2TTV5bHRCeDJHRW5iemRteTNGUGpG?=
 =?utf-8?B?TCs1R0JnVjMvQTFQcjZSb09RVXk1ZlA1dFJ4K210WWZ0Tjg1aUVJeU80cWZY?=
 =?utf-8?B?aG1WTFM3OGVlN3ZVb2JWODd6QWdUbFRGK0dQOVJ1U3RyQy94VUpsQmxkK2x4?=
 =?utf-8?B?YzM3aVVOM21tdXJrZjRMTnU5U2IyS3Z3ZDJwWTMycmpnUFhHMCtRUWNXZVRJ?=
 =?utf-8?B?OUh0eGw2bWtQbXJSSkgrREpPOWZCVUp5YXIrSGR3aVd1OTJBK3JXY2kvMG1l?=
 =?utf-8?B?WEtra25qZDRVRDY3MDNndC84Z0VYc09NQ2NicUkvVzdXZVFacmpuSllPQVli?=
 =?utf-8?B?YWtWZ2RsNHFhcXpROFAreE1YRVRRNG02SmJJMXBBZFJLRXMxSWxReENtRXpk?=
 =?utf-8?B?RFUzUUsvRkVHQjUrUWRxMzIrb0JZRU82OVhuaEZCSmFJWlBJMktYSEwxSXAw?=
 =?utf-8?B?eWFVZXdTbjdPWlZIaU1mZklhNmJGR1FvcnJ3YS9TdG1DeXU2RzZoRDZmQmRK?=
 =?utf-8?B?eDFlbU5DckgyQmpVUjVEbUxaRDFNMHFpY1pGOTlCVGd1MXd6RWEvWGFFQ3hl?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tNHa74h+H0jeH0a++Ec4BYF+X4sSW7Zh8Fd4QqF1/MS0aMNPlxwn0Db3KKTM5gcL0gMvMKbqvDOLZMZh1vskU/c29IvFV9RqHivlMaO14gBkrFRMMnx68zpqWRUn3vRErTz14CuCMtX7zaZziUGM71JSLhvaaa3lgfnpgdc73OkmIhBpE0BzjXQpUNXFVdFr67BBKaX6BjtlwuXsPzgDRDQ7pfuli/xol40oLQuYFeFZ4BAczsNy0HW6IoaaGvWMOsRqKDlFrrRF1rcX4Vw0ba6LwwT1h8ngF0nCw/dwviXYxV6W5N0Jku05O6eTTg5RhTa6QEs2ZGUv+kv8zHLZY0pcALlDAfE0G1D/6XorYnTzNNqL6HK2MtGtdIDIaGGtK8VALbSBbJHlyTqXSd4IOJafMbuD/Wm2Pk3CrHnX55dxJHUkYBQu1SeQ8lSrvGwxcxz3CwMG5OUAG1DiTpMiXkDm30nMmFyP1VyZtU/0GU5sRvty3Kd4gbBgyS745uwkX1WwjZD4WGyzDVdy84g4zeY6GmIN0AN/B710c9DLuzRcFcJnhuf8dvDmLHLPfILjAvAd2/FBrtYBBHqSkBvUN6damftk4pM3rt24IcZL5BwnpiqY3sUI3KwY/9hFOb5VCIJ63hCeRoqGP63XGWO4+uP6nakWYrooMC5wbs0Puu1BH6NIXfOtDnbK09RNMTfQhOkMVIaZCr4u0NpONaNtQ+f5OU6h4qOxFTCogH3hDqxNkuoDUHXPmIGDg7y9dJqhKRY2V/iarXShVGWvzJE5ewwQ92rqCuIBzQjynE8r4tJol68x4mxRxSzOoxW9iJ1iTpH+PYKGmhHkSgi48S4UWA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73a3379-3a19-4b02-3c00-08db311ea14c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 12:59:43.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLHObgavwW2Ykq/v7gqBrF6It12ZerNzfGLFOKkBNOsTZWwq2ceQZ25GKWv4NNwgtSrFVDYxGF5bMnCibeYe9ZUdqbh5JFrzaRlsK51WLzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6327

On 30/03/2023 12:07 pm, Roger Pau Monné wrote:
> On Wed, Mar 29, 2023 at 09:51:28PM +0100, Andrew Cooper wrote:
>> tl;dr to add MSR_ARCH_CAPS features sensibly, cpu_{featureset<->policy}() need
>> to not operate on objects of differing lifetimes, so structs
>> {cpuid,msr}_policy need merging and cpu_policy is the obvious name.
> So the problem is that there's a chance we might get a cpu_policy
> object that contains a valid (allocated) cpuid object, but not an msr
> one?

No - not cpu_policy.  It is that we can get a cpuid_policy and an
msr_policy that aren't at the same point in their lifecycle.

... which is exactly what happens right now for the raw/host msr right
now if you featureset_to_policy() to include MSR data.

Merging the two together into cpu_policy causes there to be a single
object lifecycle.


It's probably worth repeating the advise from the footnote in
https://lwn.net/Articles/193245/ again.  Get your datastructures right,
and the code takes care of itself.  Don't get them right, and the code
tends to be unmaintainable.


>> But this does mean that we now have
>>
>>   cpu_policy->basic.$X
>>   cpu_policy->feat.$Y
>>   cpu_policy->arch_caps.$Z
> I'm not sure I like the fact that we now can't differentiate between
> policy fields related to MSRs or CPUID leafs.
>
> Isn't there a chance we might in the future get some name space
> collision by us having decided to unify both?

The names are chosen by me so far, and the compiler will tell us if
things actually collide.

And renaming the existing field is a perfectly acceptable way of
resolving a conflict which arises in the future.

But yes - this was the whole point of asking the question.

~Andrew

