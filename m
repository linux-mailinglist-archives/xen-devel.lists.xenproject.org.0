Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5644C43E5B9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 18:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218173.378495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg7sQ-0007sf-Gi; Thu, 28 Oct 2021 16:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218173.378495; Thu, 28 Oct 2021 16:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg7sQ-0007po-DT; Thu, 28 Oct 2021 16:03:38 +0000
Received: by outflank-mailman (input) for mailman id 218173;
 Thu, 28 Oct 2021 16:03:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Bw3=PQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mg7sO-0007pi-LJ
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 16:03:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a459020-3808-11ec-84ad-12813bfff9fa;
 Thu, 28 Oct 2021 16:03:35 +0000 (UTC)
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
X-Inumbo-ID: 9a459020-3808-11ec-84ad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635437015;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9u2H7nk240qRYpc+lqJG6AT9egmxsNEET0ohJROM+CY=;
  b=aF2wJJHXf8ahhbaxt+qmwIXaH4NAadUEqs6Vow8wc3U5R7qjvxOCWm5K
   V3t0wcTBtuQhv1S4Tf8xRu58HV6OgN/tuwczht9BWD0DRRU6LATowOAY5
   leY2gyeW0wNawfk2KR5y9jl94CwYOv0YrbwYaePDYYgXPNCTtJe1CXJjh
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bgvn3qQYvAt+QNLMLRsBLPnkJc/SoQAL5VGe5uZHPt3qCalmF90qKeWvJu3MAgu984UB35S/Mj
 ZreV3XibYCrxA5JzYNJAWD9GmiJNcd10lr7od2wkLs6+5znTGmJgOSRLrOnO/2oVBzGbTGI4Ae
 H6bhxHzPzlBdheEUHyg3nFNXXNox0xs2pTzL65wpBoutUqVinloQCNrDbFdEofZZ3xXcfUGqKT
 81v7/9GDMlCeb5n++CPUma9zJY9Gptss6mMBA05HjyxMnr75FrghIH7ukpxdp7zMTJM9LHmNRp
 GgLh51rKeyRqIAtFAY+pK3Rq
X-SBRS: 5.1
X-MesageID: 56570357
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sOTDLKqBJgYH91h7UGzKYZ8EC4VeBmJTYxIvgKrLsJaIsI4StFCzt
 garIBnQbqrcYWHxe9lwbIm09hkCvZ7XztYxHFBu/C1jHy4SoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2YLpW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYOPEC4rHoPhpNReTkl9EGIkBrB34bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0QQKmGP
 JdGAdZpRCTuSUR3PUs9M6J9g6D4212vU2QB9WvA8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSVxCCZ6HuqiqnKlDniRYMJPLSi87hhh1j77nYaCAASE0C6p/a5okekXpRUL
 El80jE1saE4+UivT9/8dx61uniJulgbQdU4O8o+5QKWw6zY+TGwAGQeUyVBY9wrsswxbTEy3
 1rPlNTsbRRtrbmURHS15rqS6zSoNkA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 w1mtwBn2e9V15RSkfzmoxaX2FpAu6QlUCYq2Vz+XEKLwz9JJ5P1Qo/rs2PG3O9PedPxoka6g
 FAInM2X7eYrBJ6LlTCQTOhlIIxF98ppIxWH3gYxR8hJGyCFvif5J9gJsW4WyFJBa55cIVfUj
 FnvVRS9DXO5FECharNreMqPAsAuwLmI+T/NB62MMIQmjnSccma6EMBSiay4gz+FfKsEy/hX1
 XKnnSCEVi9y5UNPl2Peegvl+eV3rh3SPEuKLXwB8zyp0KCFeFmeQqofPV2FY4gRtf3f/V6Lq
 4wEaZral32ztdEShAGMqOb/ynhRdBAG6W3e8ZQLJoZv3CI/QAnN9MM9MZt+Itc4zsy5Z8/D/
 22nW18w9bYMrSavFOl+UVg6MOmHdc8m9RoTZHVwVX71iylLSdv+t883KspoFYTLAcQ+lJaYu
 dFeIJ7eahmOIxyakwkggW7V990/Kk7z31vSb0JIolEXJvZdeuAAwfe9FiPH/ygSFCun88w4p
 ryrzATARpQfAQ9lCa7rhDiHkgjZUaE1lL0gUk3WDMNUfUmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8zvoO9p7JTwgl+Mm/MalCnVuFpLnWchJEdvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2CLv/ovIUj86Ctmx5a9UB1fb0uWlShQDLppK4d5k
 +0vj9Ebtl6kgR0wP9fY0i0NrzaQLmYNWrkMv40BBNO5kRIiz1xPbMCOCiLy553TOdxAPlNzf
 22RjavGwb9d2lDDYzw4En2UhbhRgpEHuRZryl4eJgvWxoqZ16FvhBABoy4qSgl1zwlc17MhM
 2dmAER5OKGS8mo6n8NERW2tR1lMCRDxFpYdELfVeLk1l3WVa1E=
IronPort-HdrOrdr: A9a23:ul2GT61hBhQ1t1ZwArHqHwqjBShyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhQdPT2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.87,190,1631592000"; 
   d="scan'208";a="56570357"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpXOSbhBZcb9qrdMhJiRrMQU/rrq1cpgki5ZmgTJwUl2FCJSnJF0XkGGBCbIQHuPXOphEWH/C+43OGc5Iq2wavcUgmRDnW/Q72ZleVF0QsA1y9SY8TPhiYUWuwi7nqdv5TSwea1wm5b/c5aO8dDge5SHIXXgTIY9vP6Nd7c//7tsGavoDySkSCQhqBgIeNHlxuugxGe5iUoxUqXkoahgldHRRaRhTgvdKuj2QBI0eqMLs/jGZdnWJe6lAqE90LsS8VSUl3cQp4sA/2LDJ03MDr553SFfpcVHyGwXNKeDKX0fGRYlImPs6qidmr6MiCS7/SaiMOo5xcVSFxktQV7pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp1YNTGO7VSpDzDXzb4cjwnAwSTAIA/DAPMZwjgNhkM=;
 b=J+Yc34nmP/ZTsTUAzmaQG4ogD2+cNNOtaaMCblEBQBZapQ2Uw7MCmK7YXEG8nrvjovVA2JxrCkHO4C4fNjY2xazG+EgThL7PP2I93tkaN8TsM3BzJeNf0RNgvkANgMrh0HqVArKEZOGIiNe0JDSqNAZnn/AKoF3eo0L6EOIFCcdHVpdDIhzQyAw3DG/UbU7BH8bDfj3oPz1roi97gdcuojHKbprdALSyAZSAIBGkquedIbXXoVU3K4p+PuqydCUaNK7CxR4zosd7OYOzsHqBfho/uyvLbO1B/n0oOJZ4PcT9tMpT+Wen1ZtrQcjQeVBdY5DYej33CAHIvO7WHujJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp1YNTGO7VSpDzDXzb4cjwnAwSTAIA/DAPMZwjgNhkM=;
 b=T8C9Pec30r453mP1dcIgHbxDGrVNQkXhzbvVfzMMDSZzUPIgUz075zkGTrlHgHl7m94iMtwwANBP3WUD5DfQ2gjJTsdncUaWV54jREwgpGxOOASthxi2WDPryYwaT+pCwuEr39i44UndaG/TiWywHuHX5XmfdFUXGxqJzOAQ3pY=
Date: Thu, 28 Oct 2021 18:03:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "iwj@xenproject.org" <iwj@xenproject.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Message-ID: <YXrJyLMiMxaNmFAs@Air-de-Roger>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
X-ClientProxiedBy: MR2P264CA0070.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d458d62d-9b41-4f81-0705-08d99a2c7a02
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-Microsoft-Antispam-PRVS: <DS7PR03MB54458B675B6612C0C1B034F28F869@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tqSQ+4POXHgw5e0M1WSczkDas+YjIHoSaf55wwIVHQHhfHOY+bQArgmcjPhoH63Gaar3s46jW2Sfri3ibUZ2Lk+jCccd0qKaU1oc63dTeyHRFK4I9dJwTGToH+mQm+M7gPdEswsC0rLWlB2waKCKNKUyvr9teT76zmpgp1TNphjMjM5huWq86uNW9K6yTasNyAq2NFfo8awuIqKhNaG3lOtiwraZbTefctBgjsI068lS8q6XVyasOGTAdIRdGVYXd+ZpNJV8HYE5oeQQkJEDleIs2bWx5CcPllqnC1zIUKnYL6kEyKJsFgt922fPCygL4WgwTCkehSqybgkUhW0P84tmrmQfZGfnTwT+SwvxEdZqAz/vUndY7C78+Cnt+F5v7NrK9dn2MjE1e94y8JYCK4gpsSnzYog3o6qkc3eNIxNfF/Vv2YLjeK/w1lkuCAIbHg4CIxDxy8QwRrqZs9clQA46l5dRrrDKZ9NgXtMCqeopoPlvaPOVuA6tH7ka05o/m3TAmBCttUcxOEUocMeVLFQCpUbsI+nco6kWGaq+4V2JVlZ9SO1xMB6knZAvxOZacZE4TnLFtsQQfLOnPD0ELKwLXZtkJWmYKpwVz5rxVgffkTRte40nhM0t8sHRoblkmvURdL+b6/j4/fFfehzAfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6666004)(53546011)(33716001)(2906002)(38100700002)(9686003)(316002)(5660300002)(83380400001)(6916009)(4326008)(186003)(6486002)(66476007)(85182001)(26005)(508600001)(6496006)(54906003)(66946007)(8676002)(956004)(8936002)(82960400001)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2swTEd1bGwwM1FpQVRsaW4vdGVQaUx5TXA3VlJnVHFFN25Wc1k3VVpwOVJ1?=
 =?utf-8?B?VEplZ0R0aDNiRWZWQUpvQVJrZGJDQVkxM0tzc3czVWRxeU1UOVFUVWVMbnFz?=
 =?utf-8?B?WWpJUVZ4WXIxbHVKL0RRVnZLZEJFUHJQaStIK05HY3BWSVpXbVJnQWZjbERh?=
 =?utf-8?B?akRLWVJjVGo0bnEwVFQ3SGdKSFRkYy9HK0FDZTlBM1hOV1p4QVRlcnR0bHFt?=
 =?utf-8?B?dFRIdnNkSHpXTTQ2WjJOeXZkVmhWbDNlVXJFd2NuTVVzeDZnbGxMWkRmNEsv?=
 =?utf-8?B?Q2J2UEdOa2xEaWwrc1RwZ1h0dStPU2ljMTNEK0hKNmwyaUtYWjI4STg0ckRK?=
 =?utf-8?B?eDVkbnk0NWIrb3Z6UTlaMHN3Tkh5VWhzOVhZK0QvdVNKTmsrRHMyenQxWDJw?=
 =?utf-8?B?RlVCM1M2Yk1jWGhBK0dmWWQycDhKVmQ0YjVraVBBZlVxWU54aEcweEN0bzJp?=
 =?utf-8?B?V1oxSU9aTC9zejdYMzJhQ2ZGQWVaSC93VXlERThjdkpYb0RNUGgyb0N0RlNj?=
 =?utf-8?B?eUJjckNLc0ZPaGRrUmNFaVRhWE55VEN1bTVDSHNzYVZDQTI2MG1NQXYvaDk3?=
 =?utf-8?B?SStuWmxKM1BzVUJGMHZlUlArUzFpaTJLV2V0dThzZnhNRWpJZjJmSVQ4N0Rw?=
 =?utf-8?B?UVBSTE5RWlU3RTRoS2x4Y3NDL21NS0dqTnpMRXh1L0tKVURWc1VIeGFoMTFt?=
 =?utf-8?B?eGVBUVZ1UXVIQ1RrQXBiRDFjTW56dEM2MU8ra3JxTm8zM1FyWUNySmVFVEwr?=
 =?utf-8?B?TnEvMXhJSG1ZNWswT2xNdW5Pc1pDSU55akFKOGhhMkpjTTN3TEhPcE1RNGtm?=
 =?utf-8?B?LzZhZzhyM08zNHp0N2ZVYU5SajIyci9saGhhVThiQ25CNVFGaTMrZnAvcmpM?=
 =?utf-8?B?SUQvNU5MaHJ0elBibjdrU3AxbHBtckxkbWlwS01LSmI4bDRZUWxYTnFIRXBL?=
 =?utf-8?B?bEttM2I1cXVHdkFzdTlIUnJ4SXN3Z2FzWjVSbWhxUlR4ODl1c1pjelJDTzVV?=
 =?utf-8?B?M3FoNnFEMXlQSEpKWHZBU2xOTTU5Y0FESFZxM2NZZVlZOVBBY2YrVE1uQW5z?=
 =?utf-8?B?Q2htcHdIL2tQN2VhQW1mU3ZmdXRwYTBKVHRGZVkxQ0Z6RFhYR0FPcDlIT2E5?=
 =?utf-8?B?dm5hN3JOV1EyNlg4WVdSWDFRZEdOSXJDOVZwQUw1bzBkeUJEL3RyQ21CMnRz?=
 =?utf-8?B?TG1Wa3U4Nmc5eGMxclJueUxVSjFqcjVpTFhnaDAyaERjL1c4RnRVS056ODM5?=
 =?utf-8?B?dEFOR0srVjdMQ0ZtYlpNR1FMaWZnRGY1TzAwcm9TWGF0ZmlrV2EyZ0Rwc1BJ?=
 =?utf-8?B?a0tROHlNVXRqaFVlbUYyVzNrQUJSTGE1T3B1VnFlL29uSlFPdCtLR0VWYnZQ?=
 =?utf-8?B?T2E5NGlRd1QzMnBDdzIyYS92YmRKbTBQMTRQR0lPL2J6L2tURC9IQzJKV3RR?=
 =?utf-8?B?YkdWOGswamlSNUxGRHRPUjMzRFVuMWZPYXRzKzFxdDNGY3Bnd2tsa3BUbGVU?=
 =?utf-8?B?RFArQzFuSzFWTThHZENMTGJQcHBOVGMyWWR3V3BjdGhJYnRTd0I0RzZmVCtW?=
 =?utf-8?B?UUtCRVBsV2QwMTdnVmVIR0hYb0JhTi95amdBdTNPOWQ5VHFyMjh6cWptLzBG?=
 =?utf-8?B?aitQTENQcXU0TmR4QmhDZFF1V1hUeWQ4RFVZYkxNU05EdVFiQzdOWTloOFFD?=
 =?utf-8?B?VFV5aTcrOGU4S3ZTQXNEandFUWE2M3hZa0dLNzhPQWl1VEdTMEMzZEZqL3Jh?=
 =?utf-8?B?MjhRNUg0QzQwSVo5VGJ4ajI0UnoxYXNkd0NaaFB1NWVKaDZFWSthWUdLckRH?=
 =?utf-8?B?TFdzMU94TDFkQTVEZjRad2kvQytFU1lUYk1IWVY2TlVxNG5JUEsyNjhZRjV5?=
 =?utf-8?B?R2VnTmw1UVV4ODRiMFRvbmtXVER5aDZtd0xnMmk4SzZPQnMxdUt3TWo3aDdy?=
 =?utf-8?B?YVFiMmdCSWxDQWExWXU3c1BlMm4rTEdHVWZQRmR4ZmJJb2FVZEF5RWFPV2Qw?=
 =?utf-8?B?b3JxQit4MUpEMGthTUhiUlllVFk3REV6RWcxTVBYOXhnRHIyZDdqeXpOZ28y?=
 =?utf-8?B?T1JRc2JsVnNyL2RGL2JUOExMSnJZSzRhUTVuVHBzTjRaZEIxSmkwT3h4bVZM?=
 =?utf-8?B?UUlTK3dnVnRvWitnU2lwNEppb0dYcTNnNWdZbHQyNzVJWEdqMWFtL3h5bHgx?=
 =?utf-8?Q?3fbJT44DJQ3H+ERvUCX+EzE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d458d62d-9b41-4f81-0705-08d99a2c7a02
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 16:03:26.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDD9VAaUN71vEdirhy3Az7vNJzdqGHAdQpUTqt3NHoTjUgEVnUlfPj/GxbWeyNiVvLSLP9023yX7OnBw1OdjYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Thu, Oct 28, 2021 at 02:23:34PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 28.10.21 16:36, Roger Pau Monné wrote:
> > On Thu, Oct 28, 2021 at 12:09:23PM +0000, Oleksandr Andrushchenko wrote:
> >> Hi, Julien!
> >>
> >> On 27.10.21 20:35, Julien Grall wrote:
> >>> Hi Oleksandr,
> >>>
> >>> On 27/10/2021 09:25, Oleksandr Andrushchenko wrote:
> >>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>
> >>>> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
> >>>> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
> >>>> the base address may not be aligned in the way that the translation
> >>>> always work. If not adjusted with respect to the base address it may not be
> >>>> able to properly convert SBDF and crashes:
> >>>>
> >>>> (XEN) vpci_mmio_read 0000:65:1a.0 reg 8bc gpa e65d08bc
> >>> I can't find a printk() that may output this message. Where does this comes from?
> >> That was a debug print. I shouldn't have used that in the patch description, but
> >> probably after "---" to better explain what's happening
> >>> Anyway, IIUC the guest physical address is 0xe65d08bc which, if I am not mistaken, doesn't belong to the range advertised for GUEST_VPCI_ECAM.
> >> This is from dom0 I am working on now.
> >>> IMHO, the stack trace should come from usptream Xen or need some information to explain how this was reproduced.
> >>>
> >>>> (XEN) Data Abort Trap. Syndrome=0x6
> >>>> (XEN) Walking Hypervisor VA 0x467a28bc on CPU0 via TTBR 0x00000000481d5000
> >>> I can understnad that if we don't substract GUEST_VPCI_ECAM, we would (in theory) not get the correct BDF. But... I don't understand how this would result to a data abort in the hypervisor.
> >>>
> >>> In fact, I think the vPCI code should be resilient enough to not crash if we pass the wrong BDF.
> >> Well, there is no (?) easy way to validate SBDF. And this could be a problem if we have a misbehaving
> >> guest which may force Xen to access the memory beyond that of PCI host bridge
> > How could that be? The ECAM region exposed to the guest you should be
> > the same as the physical one for dom0?
> Ok, I have a Designware PCI hist which has 2 ECAM regions (I am starting to
> implement the driver for it, so I can be wrong here):
> - Root Complex ECAM area ("dbi"), it is something like 0x3000 bytes long
> - "Client" ECAM area ("config")
> So from Dom0 POV we have 2 ECAM regions and for the guest
> we always emulate a single big region:

You need support for multiple ECAM regions. That's how we do it on x86
PVH dom0. See register_vpci_mmcfg_handler and related machinery.

> /*
>   * 256 MB is reserved for VPCI configuration space based on calculation
>   * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB
>   */
> #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
> #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
> 
> So, we have the base address and size of the emulated ECAM space
> not connected to the real host bridge
> >
> > And for domUs you really need to fix vpci_{read,write} to not
> > passthrough accesses not explicitly handled.
> Do you mean that we need to validate SBDFs there?
> This can be tricky if we have a use-case when a PCI device being
> passed through if not put at 0000:00:0.0, but requested to be, for
> example, 0000:0d:0.0. So, we need to go over the list of virtual
> devices and see if SBDF the guest is trying to access is a valid SBDF.
> Is this what you mean?

No, you need to prevent accesses to registers not explicitly handled
by vpci. Ie: do not forward unhandled accesses to
vpci_{read,wrie}_hw).

Regards, Roger.

