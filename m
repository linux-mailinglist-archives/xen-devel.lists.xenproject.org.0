Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB106CA5F5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 15:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515265.797956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgmvP-0000lD-HD; Mon, 27 Mar 2023 13:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515265.797956; Mon, 27 Mar 2023 13:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgmvP-0000j7-E7; Mon, 27 Mar 2023 13:30:15 +0000
Received: by outflank-mailman (input) for mailman id 515265;
 Mon, 27 Mar 2023 13:30:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d31z=7T=citrix.com=prvs=4435eb1af=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pgmvN-00082e-SM
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 13:30:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f28987a-cca3-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 15:30:12 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Mar 2023 09:30:05 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6441.namprd03.prod.outlook.com (2603:10b6:303:120::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 13:30:03 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 13:30:02 +0000
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
X-Inumbo-ID: 7f28987a-cca3-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679923812;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nVU8lbQ4eETD4LbwgxB7CidC+aE3jVZBc1x7oggwZn8=;
  b=Efzbg2ad6E8hzGQt2fy6BydevoyKFCMd2ybl+Cb56RK0REk7ZGf80WrV
   fTsK/T5qIubPINspxs6KZoImBqIIr+Ok7wvEXxgaJHVKESuQTQZYhl3jK
   MNIHiPzuwIRyu95nGLgogq6jlr/hnnGQhuZeNpgT9iBMuyj/kQjxP6bYY
   I=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 102351246
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wQzXQ64IQJ9CQe/6/mkCWQxRtOXGchMFZxGqfqrLsTDasY5as4F+v
 moZUGqDOvaDMWf0edtxb9yw80wPupPSz9Q3SgZtqnpnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mp
 OBEcxwEXy25g7zukZOBU7ljrf4HFZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+WF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXmgBdtISOPQGvhC2A2B/lMsVwcqf16h5secrhOjA4J4N
 BlBksYphe1onKCxdfH4Vge9qWSJvTYdXcRRCOww7AyRyqvS7B2dD2JCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0LYyMeXBYGy9bmqYA3yBnIS75LEqS4k9n0EjHY2
 C2RoW41gLB7pdEP/7W2+xbAmT3Em3TSZgs85wGSVGT16Ap8PdShf9bxtgWd6utcJoGESFXHp
 GIDh8WV8OEJC9eKiTCJR+IOWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdo4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:aQbP9KGX7w+jS+oGpLqEwMeALOsnbusQ8zAX/mt6Q3VuA7elfg
 6V7Y0mPH7P+U4ssRQb8+xoV5PwJE80maQFg7X5eI3SPzUO21HIEGgB1/qH/9SIIUSXndK1l5
 0BT0EUMqyWMbEVt7ed3OB6KbodKRu8nZxASd2w856ld29XV50=
X-IronPort-AV: E=Sophos;i="5.98,294,1673931600"; 
   d="scan'208";a="102351246"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZgxtSlE3tcufTxMb+Rzh/k88ETsmiMCX49AjQz47iup6XFIVqN6ivmfiKzWsqeFfUZd78aK6EURTzQSz4cRprovUu5JE1XaMXYgHvROO9NF5IbtOGtIbx7k+G9g6wgt/ullmf8TCIvX/ZQwvoVjzuEWiDomnoPMokpty3SDrQEnXaqmhlkU1WfmQH2m0iUSwTxXvnbGOONB2kQLbpRpHDfKE1qPr+lGvennYUMge9mkQcziZka3YoD1GLlw6qNwN/9DARcBAc+alM/ZlcRbF8q9HyI1jq/fIEn2ahn5ObygcsyR7pSKPBNa8aBgqokY68XAzWPH7g2HB+gxYBxKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ND637UJlccBHSdYxpX0jSr37tgN69Fg9Q3DFQKGFO1E=;
 b=BC5TWEpwsxXleVs3+S48kVQ044piw4vWBXpFZflquh8jg34GUs+L+DrtVTr3RnaSpfKbkttNuYoVwTckDdb/w995KPjwwgfmrujdxwAMM0fAW4l64r9HOmjMRTI6UtkMrxz1NUGB1tIz0buQfM5MGzPXKpC59/lBJBnOmzomBjQuJGHzhwyv7GF+NOr5XcP9xA5B3L0dQmwp1YbqUYwh2UtUVZsV3Cd5gezkLLxrBDaR1LdivfAL262GW0QyaZXDNLcPEWiVVku/mJH3CCarS+OygzLcRmpMwXplc/rA6NQaCo67UVZ8QrYxkSvWO7il6PP1pdKfYgyPq8xKr/RMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND637UJlccBHSdYxpX0jSr37tgN69Fg9Q3DFQKGFO1E=;
 b=Aknm/tpIocRu1FI29p6ayhH2ZxyfPgNPE7pco7n4KUqvhJSTWdi5UpnCgsEMFf/kzzw6+JdPuyl8If5tHhxoLJ5SEjBXyoIF27jKU7k5KbF+PMIqXDEyq1mbXxgufho2BQOEL+WgwY+wBTyqUm/kzHE7O/X410KxJvj5CtICay8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Mar 2023 15:29:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <ZCGaU1sM/z3wJzJF@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <ZCFsDbKfGvn7giN+@Air-de-Roger>
 <ZCFvPTpOixe582JU@mail-itl>
 <ZCF1HX6Dp7mrm65l@Air-de-Roger>
 <ZCF/P22HaeZs4+To@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCF/P22HaeZs4+To@mail-itl>
X-ClientProxiedBy: LO4P123CA0369.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: bddd2cbf-e882-4bb6-9686-08db2ec75e9f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H98yjVI1JfvxW1kHKiDLBaKqKR6tCpVNwWCrWFI+9ulNLzZuRdgFUXjC8OAcxK33qx7v4HiYcZ7cDVAosunLTrPvrJqEcpEVsabtRbjBLZBkZp4sOPjLHwqCRT2GyDfdHeNZhdXN7ZX/uhEBjOUTWeU8Hx9bHFiLjJbgTuUeWtblK00bb43okix7nWoLTT/ttol7xVqhJuagVknzAUWEzBhMgZOQkU2vYdv+9ntl2dZ62/5apAah8w5pUQ8qpm+cPpmoDO5iJzopyqJ8bvQY9ggOtuEDx9irDcM2VtC4SSfqvgsLDxuNCPJgrcOM9NOdD4wCPIhMfk+BR6qju56pcQ7PSFUghckhP0hG5JciuO+j4RthD5BBblTVMjxAChi1nHpd2iErKC4/CnUYKPgbN646GbX0Jl12VYx2PdyUjIbV7QHcBCzISSFIn8shUD+hw+xsVLzB0qhEZkTpaC3KZLvOMSWW8ACD0pTZLU2ig7rMBucngNt6Hd1DncA80pfepTHbs9LrwJ9jCg8RYUkDk+qacDDn0Ck74jwW/x+uBLna73Xr2yafjQ1hR38K8VKA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(5660300002)(316002)(8676002)(6916009)(4326008)(6666004)(8936002)(6512007)(6506007)(9686003)(83380400001)(38100700002)(26005)(41300700001)(82960400001)(66899021)(2906002)(33716001)(85182001)(66946007)(66556008)(66476007)(54906003)(6486002)(478600001)(66574015)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1pBbnBGUG5BS1Znd2xBTkRRUzdtN0VVS09pMVZDdUNvN29uY1FXVTNxVVJr?=
 =?utf-8?B?Q2dOem53UUhiamxUNXZMb1FJZlRqTFhoTGNJK25wUlBCbTdybzJCNlkzMFVw?=
 =?utf-8?B?RE4xRUtoL0RBYlVqNG5HUUltb0tKenJOdTlYdGZ6TnhYOWI0ZGp0cUI5T3Jo?=
 =?utf-8?B?aFFrOXlGT3AyTEwvLzFCOUlDQytsbHBFVktGaitoRWk3ZGhncjVvaGd2S0lJ?=
 =?utf-8?B?YmJCVWluNFJvVUQ0NGoxWno2dzBJYlpzdHZLQ1FVY0JJSTM4MWRtenJacWpr?=
 =?utf-8?B?NHg1bDFsNUJnbDg5M0VMZzJYbmo3MHU5NHVjcmdVcUJQMExLWmw3NmtRM1hK?=
 =?utf-8?B?ejBkeUJYY3M5dHlmOGY5WWMyYTg2TGQ5aTJhZko5N1I4WXpIOUVEWXlLZCt3?=
 =?utf-8?B?RXhVM0ZpRTBkWFQ2TmJzd2RzU0I2YmRsS0lHRzhxc3lFZTNFcFAya3Q3OU13?=
 =?utf-8?B?dDFRR1FVQVh3bUVuYjd4bnNESVUwdVJOdGYxWmloQkZNeExPZDE5Yjgya3BL?=
 =?utf-8?B?TWJqRnpXMGpMV29IWjVGd09lcnQyQlIvZlhwV2R3RDJjT0dGS3M3Z3NEeHFJ?=
 =?utf-8?B?b1pMVU5QVW8yTzBZZnZwMUsvaVVmTjh3ZG5VU1BBUzVGRXRKNVVnUmRjbUNj?=
 =?utf-8?B?aEE1MFRBY2ZqaytWa003OUkyRkl1c2t1eFlTQXF2TkNTc0NuQmJZKy9BaHlY?=
 =?utf-8?B?aHRtYnNvQ3FZV0VXK2FPY2gzaHM3ejk5T1BuQm1zTW4vT2xKRTZ4ZkF1MjRz?=
 =?utf-8?B?OGErWkd5U3U0azZ2OEthS2Nvam53SUpmU1JXUENLSWs1cjh5ak95VlFwSUtG?=
 =?utf-8?B?RHMrQmRDODRwWXNZTmVncDQrY3hpY1JkbjlyUUtJSEFxYVNQNzQrbFJ6VWF4?=
 =?utf-8?B?WVFmSFdiOFQrNThBZDVEaisyNEM2NFF1dzVReXVWWXNNRnVJY21UTG1QbUd3?=
 =?utf-8?B?L3EyazZRdDBPWCsvRUlOOGlHU2tFQ3R4UG9EZ0J4eUsxQVBxQ3dWRGZ5VW1x?=
 =?utf-8?B?dTZQNDZ5SWYyVVU5ZWRmcndidElUNHpIK05vMkd3UlUvUkNkMHJRUHpOdXla?=
 =?utf-8?B?YTZYRHA4S013dXpidHNhNzVsUUZVTVhDTWdEZ0E0M3crNTNhcVhOSFRsNm05?=
 =?utf-8?B?akQzeVc4UlF6bCtpa0dqdGkrQ2w4a0JvalBVRFc3dmtXZWZIY05TUjNuemZV?=
 =?utf-8?B?UHpBNm5DQkNENjVNQ2hlTTZZSlhTS01GaGUyZ053aVdHZzlhVCtzWXRLeHVi?=
 =?utf-8?B?MHljMjBNRnVoUHpOQ1FTeUZiOHhIeFJVTWltejI5eWhVQ01MS3dWNUlqM0d2?=
 =?utf-8?B?ckFQWWVvSnN3cmRoQ3l3STJ5aWFyVU9ORHpZSjBMVDM5K2RST2xNSXBFV01S?=
 =?utf-8?B?SnFydjYxNFBIeUxFeGlSOVVuUUgwZDNib1VoM3ZVeCt0R1pQbXJobmJQcmhO?=
 =?utf-8?B?SzJmRTVHNmlIV3JYT2ZTdWRtTkIzTFlHNk9ib2IwUm8rRzhqdVJoMDMvSzJi?=
 =?utf-8?B?VzhtTjZ0Y2lFUFhPV0NQODBqSnVva1BVdHdiZGw5Y0ZBdFJtUEhVQ3UwS1dq?=
 =?utf-8?B?Qm8vVnNadkJPYTZ2MHBrUjdJbDZnNVZOcUlPVUtCeCtoSk5xaDRjLzh4YTFz?=
 =?utf-8?B?R3JVZFJmZ09OelE0cnhEVElqTzg5Qy9MMkV5V21LaWlsci9MNlNwVzBUMVla?=
 =?utf-8?B?dURZWnhvdXJQcVo5MjZ5WkIydllST1RXWE5MT0FhTnY2NXN0OS9abHBBQlBO?=
 =?utf-8?B?Rzd6eTUrR0tMSWJXaVVmWDJLOElSMHJpS1o1WjVEeExLd3hDam12TGJCTVBj?=
 =?utf-8?B?N3NnVWpXS3RxTzJCUjN1ZVd1a251aGhmajBHS2JuNC9GL0NsU0IrS3BHYWhW?=
 =?utf-8?B?WTl6bGgvdEg0NGMxLzJCRW92ZVhsYUo3YWtuT2FSNU45a29QUWZqT1pwU2Fa?=
 =?utf-8?B?NjE5dFhPenZINE9jcEtMQkdlVzYycUE1bEVlMzhIRUVSK3hyQTh0NkdwSlk5?=
 =?utf-8?B?TlFUa2o3THIwd2p3QUNzSnVVNDkyemRuTE5TM2d5ZEV3SXpFM2JXV0dqZDFJ?=
 =?utf-8?B?eUlFR3lud1Zhb1NlTHUwZEc1OEl5WGRWczh2VDZzdGRjM044NWlEUkNBbVhX?=
 =?utf-8?Q?BYmhkPYjIO6FSTsTF2fWzKyBE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C0LZM5j1k4QS2YkhhtawGLpVqdcm8fYOyMEdvQwaY821cAH9MVlHghBhQPEm9CJVAIVtiMJQzg3E9zo4RmXV4lmXsfDHB7fhIho0n730lOpVMm7e14NmQUU5ME2Zp67d5XtOaAUN4UlQOd+Ucg57T2u8cb3/kbggrPUDjs2WUG7feIAH8TxfAgJDW6qt84IdU3RLaDXVLADUyNNakt1dCzfEfQLlfkP22/rsp+zWsWUh5GQRSN4zGFfcuPY/kIYEiwMSIai/mx1Ux2K6lABxEU/HZkfoHzgrsZ6+u5RMOY03FSRSwdTk9zpSizVlAHRORi5aZDBF3hKIiEk3j9CvQxv0P8aFGEs2a9wpyBfy022hFehgIrPOIlrtofrT4+1GnVJF/G4v6DIP4hyaWh7sUOyoLD89PIl8GtBKfoqlWOX85PapWVVzz8oo2bD370S9YGkuPEESnKa+KNDsgMHrj0YkqH8KV7yj/Jw5jqvMI7BmnlyWfHV1ZKODInNVcB6poUiHvT6sU5sRxusODycub/8kymXwirb5VKt4xdVAp1Js+PRmBR8GsRfTvDPqjcyXBgC2MLdf9MQ2hoYYxJ21JZ+BjAsoMd7+p/rfoSEWbSnmPppYd+V+DTVp6qAhbajYfWAxn4+E0+wkN25ioNAlki/Ig/4i5SVLRH7qcyyViEGblakca27xqkg60J2UrY2AfMvFOoggg0UCkEAd+RNW1s4j/yMDsqLUbiKVGHknDnUTh7Nwdys40Bxal+hOBDC6v0/2BbhEwbvb3s5hd+2nRPEW50NU428kPyaIH/OJWI/E3drkuN+FcIAEq3rNNFcMK+oaPIOJupycgcU35QymBrXkd9C2UxnpSdTEntLpwzeJGDSdEEJSfY5C5RDmDqDTmki1XXk/ao2JFwnTBXC+ROjLSBGRD8B/qUMzy8Mc5EI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddd2cbf-e882-4bb6-9686-08db2ec75e9f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 13:30:02.7536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mO40bVMm0Um2NBhw84LyaBKRqrNzcqqQi6NMoAFoZXJfF9gWJdEKgboHFFOPQogmIqa9QmYD4lSm31T4OEm93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6441

On Mon, Mar 27, 2023 at 01:34:23PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 27, 2023 at 12:51:09PM +0200, Roger Pau Monné wrote:
> > On Mon, Mar 27, 2023 at 12:26:05PM +0200, Marek Marczykowski-Górecki wrote:
> > > On Mon, Mar 27, 2023 at 12:12:29PM +0200, Roger Pau Monné wrote:
> > > > On Sat, Mar 25, 2023 at 03:49:22AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > QEMU needs to know whether clearing maskbit of a vector is really
> > > > > clearing, or was already cleared before. Currently Xen sends only
> > > > > clearing that bit to the device model, but not setting it, so QEMU
> > > > > cannot detect it. Because of that, QEMU is working this around by
> > > > > checking via /dev/mem, but that isn't the proper approach.
> > > > > 
> > > > > Give all necessary information to QEMU by passing all ctrl writes,
> > > > > including masking a vector. This does include forwarding also writes
> > > > > that did not change the value, but as tested on both Linux (6.1.12) and
> > > > > Windows (10 pro), they don't do excessive writes of unchanged values
> > > > > (Windows seems to clear maskbit in some cases twice, but not more).
> > > > 
> > > > Since we passthrough all the accesses to the device model, is the
> > > > handling in Xen still required?  It might be worth to also expose any
> > > > interfaces needed to the device model so all the functionality done by
> > > > the msixtbl_mmio_ops hooks could be done by QEMU, since we end up
> > > > passing the accesses anyway.
> > > 
> > > This was discussed on v1 already. Such QEMU would need to be able to do
> > > the actual write. If it's running in stubdomain, it would hit the exact
> > > issue again (page mapped R/O to it). In fact, that might be an issue for
> > > dom0 too (I haven't checked).
> > 
> > Oh, sorry, likely missed that discussion, as I don't recall this.
> > 
> > Maybe we need an hypercall for QEMU to notify the masking/unmasking to
> > Xen?  As any change on the other fields is already handled by QEMU.
> > 
> > > I guess that could use my subpage RO feature I just posted then, but it
> > > would still mean intercepting the write twice (not a performance issue
> > > really here, but rather convoluted handling in total).
> > 
> > Yes, that does seem way too convoluted.
> > 
> > > > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > > > ---
> > > > > v2:
> > > > >  - passthrough quad writes to emulator too (Jan)
> > > > >  - (ab)use len==0 for write len=4 completion (Jan), but add descriptive
> > > > >    #define for this magic value
> > > > > 
> > > > > This behavior change needs to be surfaced to the device model somehow,
> > > > > so it knows whether it can rely on it. I'm open for suggestions.
> > > > 
> > > > Maybe exposed in XEN_DMOP_get_ioreq_server_info?
> 
> Make flags IN/OUT parameter (and not reuse the same bits)? Or introduce
> new field?

I think it would be fine to make it IN/OUT, but see below.

> > > > 
> > > > But I wonder whether it shouldn't be the other way arround, the device
> > > > model tells Xen it doesn't need to handle any MSI-X accesses because
> > > > QEMU will take care of it, likely using a new flag in
> > > > XEN_DMOP_create_ioreq_server or maybe in XEN_DOMCTL_bind_pt_irq as
> > > > part of the gflags, but then we would need to assert that the flag is
> > > > passed for all MSI-X interrupts bound from that device to the same
> > > > domain.
> > > 
> > > Is is safe thing to do? I mean, doesn't Xen need to guard access to
> > > MSI-X configuration to assure its safety, especially if no interrupt
> > > remapping is there? It probably doesn't matter for qemu in dom0 case,
> > > but both with deprivileged qemu and stubdom, it might matter.
> > 
> > Right - QEMU shouldn't write directly to the MSI-X table using
> > /dev/mem, but instead use an hypercall to notify Xen of the
> > {un,}masking of the MSI-X table entry.  I think that would allow us to
> > safely get rid of the extra logic in Xen to deal with MSI-X table
> > accesses.
> 
> But the purpose of this series is to give guest (or QEMU) more write
> access to the MSI-X page, not less.

Right, but there are two independent issues here: one is the
propagation of the MSIX entry mask state to the device model, the
other is allowing guest accesses to MMIO regions adjacent to the MSIX
table.

> If it wouldn't be this Intel AX
> wifi, indeed we could translate everything to hypercalls in QEMU and not
> worry about special handlers in Xen at all. But unfortunately, we do
> need to handle writes to the same page outside of the MSI-X structures
> and QEMU can't be trusted with properly filtering them (and otherwise
> given full write access to the page).

Indeed, but IMO it would be helpful if we could avoid this split
handling of MSIX entries, where Xen handles entry mask/unmask, and
QEMU handles entry setup.  It makes the handling logic very
complicated, and more likely to be buggy (as you have probably
discovered).

Having QEMU always handle accesses to the MSI-X table would make
things simpler, and we could get rid of a huge amount of logic and
entry tracking in msixtbl_mmio_ops.

Then, we would only need to detect where an access falls into the same
page as the MSI-X (or PBA() tables, but outside of those, and forward
it to the underlying hardware, but that's a fairly simple piece of
logic, and completely detached from all the MSI-X entry tracking that
Xen currently does.

> So, while I agree translating {un,}masking individual vectors to
> hypercalls could simplify MSI-X handling in general, I don't think it
> helps in this particular case. That said, such simplification would
> involve:
> 1. Exposing the capability in Xen to the qemu
> (XEN_DMOP_get_ioreq_server_info sounds reasonable).
> 2. QEMU notifying Xen it will handle masking too, somehow.

I think it's possible we could get away with adding a new flag bit to
xen_domctl_bind_pt_irq, like: XEN_DOMCTL_VMSI_X86_MASK_HANDLING that
would tell Xen that QEMU will handle the mask bit for this entry.

QEMU using this flag should be prepared to handle the mask bit, but if
Xen doesn't know the flag it will keep processing the mask bit.

> 3. QEMU using xc_domain_update_msi_irq and XEN_DOMCTL_VMSI_X86_UNMASKED
> to update Xen about the mask state too.
> 4. Xen no longer interpreting writes to mask bit, but still intercepting
> them to passthorugh those outside of MSI-X structures (the other patch
> in the series). But the handler would still need to stay, to keep
> working with older QEMU versions.

Xen would need to intercept writes to the page(s) containing the MSI-X
table in any case, but the logic is much simpler if it just needs to
decide whether the accesses fall inside of the table region, and thus
needs to be forwarded to the device model, or fails outside of it and
needs to be propagated to the real address.

While true that we won't be able to remove the code that partially
handles MSIX entries for guests in Xen, it would be unused for newer
versions of QEMU, hopefully making the handling far more consistent as
the logic will be entirely in QEMU rather than split between Xen and
QEMU.

Thanks, Roger.

