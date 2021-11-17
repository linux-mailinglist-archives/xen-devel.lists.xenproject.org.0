Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E909454444
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 10:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226659.391739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHdv-0000UP-Us; Wed, 17 Nov 2021 09:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226659.391739; Wed, 17 Nov 2021 09:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHdv-0000Ph-PV; Wed, 17 Nov 2021 09:54:15 +0000
Received: by outflank-mailman (input) for mailman id 226659;
 Wed, 17 Nov 2021 09:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74+5=QE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnHdt-0000MY-Sa
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 09:54:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5143adc2-478c-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 10:54:12 +0100 (CET)
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
X-Inumbo-ID: 5143adc2-478c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637142852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ZacOT3ITkAa+MdjgGs6b4ewjRyVE7nbo3488q4xNj14=;
  b=XOGU3HIwjLzLDbPBWAj+N6M/g8HeJ5YiztWkXAEqz2Z41EsubX9xzLKr
   VaiDGti8PYgYo72/G/jTCS5NUMF2hwduAgZyNhlYMxYymiT91/MwkEVEY
   74lPjfo/RQuPd0uNyarjQwu7So75QKp7/OxWmM6vFfxrsPdsHFVkxTslQ
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aaySobvWiIWSzmHK+iWyjJGnbdBDfd3oAgAxYvRJlR80ibooHo6nONTCFFYCIx0lA55+7sBiu/
 rDHAVlQAO5uYHxAmQ5nFhNrOmtD2bE5y/Z+ajECxpigoMfCDQz2iA9zoyG/cLxnh8IgVdbjg91
 G1EaxTaDgZE9+0rQJo987J8m6AUIx7ilzh8wtLTeDKtDLriYcOdUqr+7wofJSZ5gKIiWH5OSt7
 6v6UICBtsRRfZ9pfB25m+O60VV+JF3UJixLcntYzf2e09LATzRZU4QVZaGiGONrIov2WAcavC6
 aJziFY84ZNJcqhkdedSi4pbZ
X-SBRS: 5.1
X-MesageID: 59994920
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bUt99K2f3/9vUPwOvfbD5Sd2kn2cJEfYwER7XKvMYLTBsI5bpz0Em
 DQbUWjVafjZZmTxf912aNi+pkoF6sTUz4dhHgA+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wrFh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhsO5r0
 MdLkbaJdCwZB6LMt8kkdz4ADHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuI4JjWth3Jgm8fD2a
 sokcCs1YBn6Y0NEMXYVGaMHnv6XiSyqG9FfgA3M/vdmi4TJ9yR6173oLdzUZs3MQMxTl0mVv
 ErW8mLhGBYYOdeDjz2f/RqEh/DNtTP2XpoIE7+1/eIsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLkc6VCZTbvgMjfIddQUl1
 nCkpvfOXSM65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM53jXznG0gpkmRF4g+ScZZmvWwQGitm
 G7S8EDSkp1K1ZZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CRU8yR9xLpXZX1oqMBraL9VdF1Oz6zbWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPv8ALbCT2MvMtMt/Z5yEWIU7IT4+Nuhf8NIQmX3SMXFXfoHEGibC4gQgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe95YKK7Xde1U+QwnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTZETA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:Boyi96M2+wts0sBcT1v155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwPU80lKQFnLX5WI3NYOCIghrPEGgP1/qB/9SkIVyEygc/79
 YQT0EdMqyIMbESt6+Ti2PZYrVQsOVvsprY/9s2p00dMz2CAJsQiDuRZDzrd3GfE2J9dOUE/d
 enl4B6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1sjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvC/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdm11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixttqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWzHAbgcYa
 pT5fznlbRrmQvwVQGdgoAv+q3iYp0LJGbHfqBY0fbllwS/nxhCvj0lLYIk7zA9HakGOut5Dt
 L/Q9NVfYF1P7wrhJ1GdZI8qLOMexTwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="59994920"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqFcPBT16fUm28iTNBxVRA1sa4BJnIhsWRN3TaU7SHUKHH5a5tIHV1ca+3ZmODVPykWB2BsyNw/XvSyn4bzonxe8H68uKX8HchgmZd46cuDDHd3iMuEmYG6kkCkYwn0o1bl7FdO8uPzw8IxhIisOhGPyw5+zegzYhfyuZhKwr5auVrijOdqjAFe6zcXDK/ixsmLilRF8veAsuuyyayY17L4CFF1EQQmGBA/aPqUWFIhwao9yrz8zv/k8nQ32IFxUuQ9Yk04mTql28GKjDyKvpVQ+o/OPt+8+etBELV8ernCvpvgF4tr1J6kYJtGBWK9t3njNN2GFJT1UKcHQSmmoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ws8aUy8F+EVvPCLmY4ejokUBqMwMeb6CAM8JrY6H6w=;
 b=ZO7jDd/MbYx6SNeex2kJjtUzL6DmW+wXcSt/IQDVwX1KyTpA+PLN8jlMpQT0Gxz9FGFMDAMHUneFXU79ue3K12PvaLOiYrhbNH9+TchwSvZWx0uJcZk0wfknzJ6YTDk/tAc+Ae76hybCMX6AK/4gzRtIqMS4ir/CrFDkPQhmsWd2BZDlkHNjPPTTFGgQtqC5kCAj9B+WCY1N+GCnFPGSpe2iJLow6+DDzPgbPh7ma/yKjvjWclzzbzBrXGlnREuJXizXEAF1e8zr2TLp6onw7RHXkA7VNa+j9jR90WQ9TmYECgich7MY6TQgjl8smY8seunBP0R5FqR/f7252Gu9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ws8aUy8F+EVvPCLmY4ejokUBqMwMeb6CAM8JrY6H6w=;
 b=GmL/oiFtY7wAdBmyCceKr9EHLMS21MSBDQLVgQQx2B3fpnsHksTnwK7UsuMCv1YN2MDDXjzxY9YO/O0aNV8RHS5SF5YAAWq3us9XaWp+pf55el+XGPKwgOg6xVHs6yj5O1iUNLftNZys8XYDPMKJv280EgBdn4ybLf/bkgCGVX0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH for-4.16 1/2] CHANGELOG: set Xen 4.15 release date
Date: Wed, 17 Nov 2021 10:53:37 +0100
Message-ID: <20211117095338.14947-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117095338.14947-1-roger.pau@citrix.com>
References: <20211117095338.14947-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAYP264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cc01efe-13ee-4044-fee4-08d9a9b0302a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3577:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3577D14C43800EA9988BB49B8F9A9@DM6PR03MB3577.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s7Z0Onyl5n5xymLLdet4DZ8c4HzlhkqTO7sCQwn7GLZ532ffdeS756RHebajBipaYowZy2hNATwn4CCsKfuRkY814xgYI73BoMGUnX4FKvELrt2MRs5+6tT2dSoBRkzyX98nzlVvcPGX5AZRrtgjXNvVnIPmNWBmgrf34PcGtOzpOyDEVqG3p25MOgeNFQFCVr6MhOfxgCmX48veqbWO3+NgsdfRZdFgRUB8dfTVf5fHgIZ2SlLPZ1njqsgm13gcdkSOIrnbbX4NXLenIsX40zEswml+st7fMO6mO9ww4s68Y7aeA5arqm5ogmDX12puVlzj/SJA9+HLYGIEFIG22UG9F9s+1BhQQefAef3JU/8GjLqk+ogPcpg9yJYXHUojJKkHM2r7VnWFcX1qNSv2ytF+B2IxPRPO+7vaf05YK04MGErG5tywAbZT6ORex7/CIiNsqTkH8zbjuBA4AorD2IQq8X62EMRJQAiwinER9slaLyIz75l2iiB90gTHX5DQzdlDxW6sH8M2M9iU6lloo3/loy4dZNNuzLz+V9O1CyWtvonnnH+ROFa/Db5vUAmWeAlFqLRhQxp3qJANYDrLNDUWjT9BlyAYfxeOyAPpitE9ZC4tWYDpj7bxOkrabsG85Qv4C0xCLsw014W2fdIAC671Phsbv1znxK40EkROxPuT/C7U8PoVtM7kJm3MBxOAlSaK4zrWrxxQwzttYQ27xedNIMqH1YRH5wFk1NNEv8qtrcxQMa6wsbbpTR97xnX+UWkh5pzDeScWjZRxqAjgjLezPJIHcyTE0LLSyM7Xgg5C9tD0ZP3maIJeH6hxp7hQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(66556008)(38100700002)(316002)(6916009)(186003)(86362001)(82960400001)(8676002)(4326008)(5660300002)(4744005)(54906003)(2906002)(26005)(6666004)(83380400001)(2616005)(508600001)(6486002)(36756003)(66946007)(6496006)(956004)(66476007)(8936002)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzM0RVE0YU8vay91QTVKTUxUZjhHbXhqUHVuQ1VTOWduL2FRbGNaR1EvQjUv?=
 =?utf-8?B?NVM0c2lxNWQ4YkpFU21waDRPb3FvZFdCV0srRDkwaGswRlRYVzRObzBXZzlh?=
 =?utf-8?B?Y0h4cEh1NmJDNE5HQ2QwUGswcjRzYUNqK29PYlV5UUNGaUx5SlB5K1BJUjJS?=
 =?utf-8?B?QkUxVGhBMldtMml2Ny80bXZOVllhUFQ5bFBub3ZEWHZlYWp2QitJdGg5OXVq?=
 =?utf-8?B?c2F2bGkvbmJMSXZmUGMxbndrYTJ2WmdSRXNGY29qUVFOOUFLM3g5VktHa1FL?=
 =?utf-8?B?b29rakpjeXNZK281Qzk5RTZaaHB6eEFoS2dOZ0tFczBpaXdWN2NMYm5TTjBZ?=
 =?utf-8?B?VCtHaUZ5ZjVIVTMwQTNBUTZ4VU1iV0xoU0RVK2RmY0l5cXljMmQzcGdYQnhn?=
 =?utf-8?B?MEtWMEJnTTF1M3B2eWE1RUt1WHNXMXBENTdxMllsVGx6YTZUUDc2emYwNUcv?=
 =?utf-8?B?WUhIRkg1S3lIUWhMekg1T3BTbVA5c29ZWFZZWnF3UUV4M1NybnhoSElnYjQy?=
 =?utf-8?B?UzNvL2NOT1RJeUNHUFpwV3Fhc2d0bTdWZ09mY3BGM0dwYWRrT0J3RXU3MFVB?=
 =?utf-8?B?Sm1Gc1Uwb2NVRFc5d2Vkdy96NGdER2ZwbnRtMnpCdmM3alhVcmFLcExWYzNB?=
 =?utf-8?B?VkVEUXprUW00c1BOR0dDZWdGUkE1VFRRQm94RzlWWFRvL255QkN3YnFrM3JI?=
 =?utf-8?B?NDhPNUdQTWtKK0xjUVlxdlozc2s5WFVDNVFCYzV1L2R0WlYwWTJ5QjQxSjRO?=
 =?utf-8?B?VDRTM3FwM05RVzZJUitRZWNad0tyemZ4dnlxN0FMWklPR2ptcDVGSUs2a1BK?=
 =?utf-8?B?ejY4Q0EvTzJSUzllYUthQ0tPRjNGUnR5NTlXbkNTTFp3ZzNBMHM0QzR5TUIz?=
 =?utf-8?B?OTFoRFM0Ri9RMEhRUVIxeGJrWjlmNWw3UnF1bTlLSHBmTkQzbTRtb2ZHeHZC?=
 =?utf-8?B?UEdqWnRYSjRpbWZOQTVyTHBzYUxYbW9nVGhhQk1icHd2SXp1UHVNeWRpTTc0?=
 =?utf-8?B?RGV3a3BlVzJYcEIyMmFQYm5BdjR1RE9MVEl4SHc4RURGVE9GMGtJYjZOUjlU?=
 =?utf-8?B?dUszUlFhaC91ZlZqMDFTRnBRZ0VFN3JBOE1Rb2Y5MkZaa0EybUxqYkFkYUo2?=
 =?utf-8?B?V3kxRFZZb2JFQ2Nna3R2cDdqNXBRY29QaDFhM0FuNkhBVlFlSXJ4Ymwzai9C?=
 =?utf-8?B?bXI4SHYrbGlnYnl4UGVVM2NqcVRWWkZBbE05NDRkTGViSU14VVJZTTRscklV?=
 =?utf-8?B?SExKekpnZy8vODcvRlZPMEVuZThTdWVoYUZTZjN4Q2k5SzRWZGtnOGNaWUtk?=
 =?utf-8?B?bXFLRzl1eFcrQzlrc3FGN01TeGowVHBLZ1U0emRPR2xlSjBTMVVKb1NXRU04?=
 =?utf-8?B?QkFXeFdEOUZ1QWZSUUdmTXhGNnFiOHMyTkwwSkM2cHVOaTFNYkJFWU9wQzdH?=
 =?utf-8?B?V3pjT0Q0Wm1nNnNRUmdubm1RYTUzOHNFSnA4ekRJUjVsemZReSt3K2ZmZUNh?=
 =?utf-8?B?Q1VROEEzem50eFBZZlJsRy9ZbDY0NUtHKzJDK3RsZ2JNNDhZM2NVREwyMWVv?=
 =?utf-8?B?NG9LRXlSV25UL0FxSDV5Z0F3VXNKRElEZ0pjNXdOMWhUTFpBUmFxUU92S3p0?=
 =?utf-8?B?WlhUa1lCU09zNnpTbmpuVlBlcGpFbUhPRW1YY2tLbGRUb0s2TVpOb3p0TVZJ?=
 =?utf-8?B?MDBzL1llb0Qra2U3bVlibXpFT3FSbVpvZHhvMHFGMTdrdjFyZjkvUXZIbE1C?=
 =?utf-8?B?RUN4ajFSRlp6U2VkSTBPSnNyRm1YQjl4R1ZuYVdvNVBkUDF4UjVtYmxYTmVD?=
 =?utf-8?B?K2FTVEh5SDBtWFYxc1BWYlF5TEdqY05Bejlkb3VqVlhwM0lzSHdXZ0ZWOE1Z?=
 =?utf-8?B?UjBvc1RpVkljQ0s4WlVNUHpQT0VRemdaWDRCK1ZjT1hsNHhxT2taN09SbXMx?=
 =?utf-8?B?eEFlcUlqYVJSajRPa1d0cWN1OEgrODI3aGIzL3lpSURYMUxwSVJnRkdqSTZl?=
 =?utf-8?B?K2lZZjFFVUx1cHZSN2FwVytDcTcwYmxxaW1CVEZYaFdKclQxNm5FR2h1dWw1?=
 =?utf-8?B?NFdHU0FxVUtzcElteFViVGVUd01qOWk1WW55N1djTWRyQ1FsemREelBsY0tG?=
 =?utf-8?B?Kzdaa3F3dW5rSmxMTWJOanE2THFENlRKNUhGM0o0Z0hxYXFqMFdHdUVQR3pC?=
 =?utf-8?Q?fAr2qII3YCxOMRlBoW+Isi0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc01efe-13ee-4044-fee4-08d9a9b0302a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:54:03.7964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9+ukcnx5BC2MPHFCVhe3gWuWxB601+qwjZnvuUq8FjI9XoKQjNoqWVZ714rKvBkzNBOoRZwzSg6p+1abvqm3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3577
X-OriginatorOrg: citrix.com

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index e5ab49e779..ad1a8c2bc2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,7 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    no longer be built per default. In order to be able to use those, configure needs to
    be called with "--enable-qemu-traditional" as parameter.
 
-## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
+## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
 
 ### Added / support upgraded
  - ARM IOREQ servers (device emulation etc.) (Tech Preview)
-- 
2.33.0


