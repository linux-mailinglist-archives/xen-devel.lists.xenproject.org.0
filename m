Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED76F498475
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 17:13:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259916.448699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1yG-0001Sd-8r; Mon, 24 Jan 2022 16:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259916.448699; Mon, 24 Jan 2022 16:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1yG-0001Q4-5q; Mon, 24 Jan 2022 16:13:32 +0000
Received: by outflank-mailman (input) for mailman id 259916;
 Mon, 24 Jan 2022 16:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDBv=SI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nC1yE-0001Pv-VJ
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:13:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9069033b-7d30-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 17:13:29 +0100 (CET)
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
X-Inumbo-ID: 9069033b-7d30-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643040809;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=yj/jG1xVfgrU/pPdzCgTgyhHbNBYErsWfaAudd38ZNk=;
  b=Tafr1tAktFkFivT3pgixPfQzrWt4Kh7NBFmWpvPZ1mh0UhzuG7YI1Fvp
   Y/K1wDUzstSu9We/7xTDRPbwPAKPCjU1fixqQh8In1usaxrArvNnKBH+4
   g/wY21r7OP8Ylm+d+0dzPNzgZkiWuOgES5GoBdl6gwZ40r/2EdzrYqIDo
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5J1XyW7jpxnKwvS4Hl1hgWRZvOekUtORXIdWyblPDbHRqUnAzFpS+OCiEA1Pb5XaemoC6tJEbT
 4fsCoXipJV+BpvEydsi/Z9j86Aonnwh/e2IvqtS/79+hn8UcCW0eSie+W6E24mrKPyNro7seRm
 VvwNvxH8m/7zm3Mtvr/IYHyt37b22jnTDTgG+O8/ttd/5269Q+ZRdEIyN+oIw8d/ykYOQRK4ur
 KDD16seAs+pTgfZSrQkWM/pWPQP5vQAg7qMZAP9Yc7nIcCyqZ2FVjGDnV/yAsQFvcwEw4T6SDx
 qE54bN2O1hdiCfuSYlzk9dAs
X-SBRS: 5.2
X-MesageID: 63046361
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Wnmf9qw/4ITS8RavTr96t+flwSrEfRIJ4+MujC+fZmUNrF6WrkVRm
 2ZMDzjXbq2JYTejL9knOYm080wAu5+Bz4dkSFNsqCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt91h6
 t5iloGwcyIWHqPCsskxdiEALD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEDhGtu3Z4XdRrYT
 9YiSgJrPErtXz9KNxRPDpA7lsn3v1CqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19nEyVu
 2bH9GTRGQwBOZqUzj/t2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQrW6mtTE/RtpqNtIa5g+n54bx216mGT1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tGuVh6b/PuREDGQ3Ct4bdO6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2QcV7pmr2oCPyLN4JiN2bGKuOGp1cEQIFn
 WeJ4V8BjHOtFCXCgVBLj3KZVJ1xkPmI+SXNXfHIdNteCqWdhyfclByCkXW4hji3+GB1yPlXE
 c7CLa6EUChGYYw6kmveb7pNgNcDm3FlrUuOFM+T8vhS+efEDJJjYe1bYALmgyFQxP7snTg5B
 P4GZ5LVkE0OCbOnCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnmMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:W+REa6kotpZwy73uy4K7oQEOd37pDfPAimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTM2ftWjdyRCVxeRZg7cKrAeQfREWmtQtt5
 uIEJIOd+EYb2IK9PoSiTPQe71LoKjlzEnBv5aj854Hd3AMV0gP1XYdNu7NeXcGOTWuSKBJXa
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWCSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLLhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqn3d+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7k16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXavoJBiKprzPLd
 MeTf01vJ1tABOnhjHizyNSKeWXLzsO9kzseDlAhiSXuwIm6UyRgXFohvD3pU1wha7VfaM0ld
 gsAp4Y6o2mcfVmHZ6VfN1xOfdfKla9Ni4kY1jiV2gOKsk8SgHwQtjMkfAI2N0=
X-IronPort-AV: E=Sophos;i="5.88,311,1635220800"; 
   d="scan'208";a="63046361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miygD46idXtazNb3cKXt1ZD3UKev3kuAvBeaBnbKXlKkULHDqPpN7FecGA0LzQi1I2eWQHGiHGQ8JC/CKnLaH7ySkSNj8oFmy3c9ykxhJd94e6YOidD7A8oo2f5XOHSAX1g38nXCinUw5mmCOJCQDhTGhB3kSlwQH9bJeaMZ/mU6KiWYh5Vpb6mtyQiMjTlkhCsUmwSCd/NVSfsxjl04GaaAmAgYKs7ov++B5p0Z130GSmeCZZK7S/WEOUiPUfASXvpigQdQCJVb52wg9McFxMU3513uRnjGHY6yZz+CFm1gj/jZ6KClRq4CpiWxESPib921nDyB2MC4zwR8V/v0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDywZwv3SCqlZfNHbQvneXAQdtFlWktPZEYLJwrCW/k=;
 b=MKECp8V1iPB9ziwyZSEffYK1rZdfWLzKxnxDXjucj6AHxtMqH6FMXnyVTvfTWP3SMip/MUSkKfNeHeCzpSL45RahLS2/jJV8HOqayOvr8r4XojPlk2LqRF67HGHs7S6E/AtQ1sqLpQE3A+ajaWrpqtfthWcyWK6LwVCeYcwXEa3Wq2botc1V6bgeaCRHcOCuUJlwosuEGUfx0Dm7KQmjJAozq+iF9QNSlXvBrkHuPYrZ9q0OlY9HXKi/DRRRKlX5PTFhU3wzqkx7pvrop6AGblwyiV+089dvOP7vQRUvZDC3Sf051cOK1wUqniyqLph/17kjRZiDwXyDrPIh3ShCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDywZwv3SCqlZfNHbQvneXAQdtFlWktPZEYLJwrCW/k=;
 b=XZQ9Dxkgok4WKfAa5AITN6maqcThue8AQkK902P4GD9bZXpB6jBr1sNRLSlMmD5kjxCk0UOpXEOPyA+kPuPb4OHiDXeIW1kUZPqzJh31Xc0Tp5TlPfvf2ZeOoHZ3Zx2VQuUpJQI3X+f85kUVAhGXmUMEnESu7aDufd8Vk9cxlwM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/pvh: fix population of the low 1MB for dom0
Date: Mon, 24 Jan 2022 17:13:12 +0100
Message-ID: <20220124161312.38296-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0060.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeacef23-8a04-40cd-8e23-08d9df54717e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB40599045C7CB3E6753AD7FE38F5E9@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EoVrtGOM6pE/QvR8KZ6VVlEPeP1CqHC8i2PQ68ZFJorbJFUMHoGyGIm2EWQfUgTJ294P91gW/Hj2MoptmkuqgXmwe/bB0djh/Zl7SoIn2ptwerpfdiDDTFNAY8F+NdG+G3eYDJLHTippzVGqbWII66dv78WMwJ1ghk89wZhFveURl3yi/ue175ow6M7HNdpiVJ5C3P6jw+9BOfkuYShHIE2sxIdWfgVvhzb1b/+2Xbu7gB0fTMeVe3C9qzKwkG2QI+HVspxLKQ53GDRBlfwNCtqXJxMZhk6HJ9MaoYQCsBnLdX1kZ91V1zfQ8uagftRboWI6JiyNXToMIfa1ecxO6vUikdRFZgO80tEMWqwYumkgZdyp+7QavKKE6Ck6GUDCXRAt26/RH6FCOMz6GUbJtAMTY/BlCpQIWhgshnEBoU6b/6nM+/Wtr6N7D/sHlzV4qlIh7X4xSHJgmtmGpmJQn1mdoBnCqaJjMUI4cKM9fwXCsgfbBRS6VqRgB239uFNx0KfuICbo/pgeXM41oDwIJnuqTcwnYBDEgcQDUztG7OS2tUBJHHhtSdfDl4gkZ3Ah6lJW/FYgZwzA6+wu3n1keHDa2gbI1D+UrGmXhhRUsBEzO8mpQnTdXLEqqondcNhDo//82xr4ubovJGgDHuAfeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(2906002)(2616005)(5660300002)(83380400001)(316002)(36756003)(6486002)(1076003)(6512007)(8936002)(6666004)(6506007)(8676002)(186003)(66946007)(26005)(4326008)(66556008)(508600001)(66476007)(6916009)(86362001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFlRODdlM2xPcGcxYkJKNjRHdXhGL3ZEM2RwTkpRRDRxdStoRitRQ1NhWXBt?=
 =?utf-8?B?M2FWUWc5eUlqR3U5S0VOa04xeUdoa09iVW12cURvU2h6TlI4K29tdlU0bitB?=
 =?utf-8?B?Mk1zNjFJOUVxemJya09kYXZ3MEVKdzdFUy92N3NyWDdnWmpVK3V1Nnd1SFNq?=
 =?utf-8?B?ZzVvVVZ6aCtVdGRGeldkZkx2alpERTVmUkw1eHN5NWN0OGJEeGkrSVFvWFN6?=
 =?utf-8?B?REJ1LzZQNjRsQzl3OVhNaFZvdW5HUEMvZ3pBcjZ2TnBhSmZjUGFDY2RYZVVN?=
 =?utf-8?B?cEtjMXZvaEQzanZyV3JlWU1ZYkt6U3FGS01uRUE5UThqOHpqa083aGs5eUZu?=
 =?utf-8?B?VEtoOEMvSFNyUlpZT0V1RithdTd1WEttc0h1VzRxZUpWQmFnUjc4dTJVZWJG?=
 =?utf-8?B?RVowSUw2eTFDb3BMYnBSVWJYb0txUlEzV1loc2xTcm83Uk5kOTBMejhJOU5C?=
 =?utf-8?B?b2t5OVlBbTZqS2xpUlEwK2J3VW5CZmFSaEtNakYyV3NrOXUvRS9Ga1Q4bnll?=
 =?utf-8?B?ZjlHa2RYTHpRaHJaU3ZyTlBTNG9ITVhVSWVScFlaY2pieUNWQWltQ0drYjZE?=
 =?utf-8?B?QnRFRURUcUV0OTdVMGhvMExFajdOTkVzWVNmK2lmVTNxaFR3aWxDbGxyRUl3?=
 =?utf-8?B?QjArWlFJZG1yVURFY0x2UWlMZEVHZ2hzMFQvck1Dc3ppTklZUUU4bTY2dDRK?=
 =?utf-8?B?QitrK0c2ZkdBSHJqWE54SGE0QnRXY1pVNGlKbm5qSGJpK1ZUWjYwdHQzcVRY?=
 =?utf-8?B?RjMxK1VRV0pzTXBPeWplK2ZqZ25YZ2NUTVloTndYZzQvQ0FHKzBXMFB5UkFW?=
 =?utf-8?B?Z1RkOW93Y1RPaFNCNW9SME1zQlcwaERPR3JjOWVSZDN2ZUdBd2FGYW45UmJT?=
 =?utf-8?B?Smd3WXJkTnh6bC9tSW9XL3I1cEhRcUQxRldGcFNKa0JXa3h5VUdnVDdTZ3RJ?=
 =?utf-8?B?YTdXL0JoTVJlcjN5cmUxNDcyM2ZHY2FrM2MwcWdNRm9oSFNJZFNlYi80NnE1?=
 =?utf-8?B?QnQrUzBPNEh5RDlqd21ET1BaOU9taVVORlpKdlBXVmZXS1FxMnFsRTd4NHht?=
 =?utf-8?B?Ti9NaFF3eGZJYjlzanRxS3FvRUFYQUhLcUFwVmYxMkg4YW9yc01PODZWcDMz?=
 =?utf-8?B?OUpoWEcwR1phYUYwOUtRNUZINWVrT2dEbU03MFNwUm1RSFBPT25sS0Z1cDAw?=
 =?utf-8?B?eFdxMUNvKytXVDBlcEhXQXR5d3kyYm9ySzFPckRCTjd1SCtSTm4zVzRuMGZo?=
 =?utf-8?B?cDBRK1RKbkFQZFJvNUM5MkhxOTRqVExPWlBPeE9CNEdvWVoyck9xYUlub3FE?=
 =?utf-8?B?TGdyMHNqRVNKWmRGUksyTmQzM0FtODRyZmhzLzYvMDhmc25OY1FsbjhVeVR6?=
 =?utf-8?B?NWY5Und5TWpkQ1k2SVBFQ25BNWFkdTNNQkFVS0tjeTVIYVl4SDB5YVdKeWFh?=
 =?utf-8?B?Ulozc3VSNUNMTzlaWXc5d015SXdpQkx1dFBrSThhd1l1SFdTejJkTGtkQ20r?=
 =?utf-8?B?cFBRaXVhaEhFZlN1QmJkeDVFdmJaVnhxaC9JelAvb3JCQk8yTzZMQUdTSzN0?=
 =?utf-8?B?K3lHeHBHRFZndDQ5SXNWWXVFMnRtTFkvMFJBSzZDSWROcHM3dEdQZWorWUds?=
 =?utf-8?B?ZkVZWHphOUN1UEV0SlZ0MEwveEh4VHVxRkZCMUNBOUEveE5CUVN3aDlWMm94?=
 =?utf-8?B?RmIrNGRLVDB2SUt6SkJUb09hdFoyRTNlMW9WZlBKR0JRWU1XWHpmQkZkd2l6?=
 =?utf-8?B?VE1SMEV3RDBzbEh4WEEvVkNqUFVudm1NOTlFUGt6OVpsVExXS0hJQ0sybHJD?=
 =?utf-8?B?ZldWMXhHSmdGOXpSV0R6VVFqYXRVdTZ0RFRsRHI3a0x1OGwxMHNOVVBKNkJK?=
 =?utf-8?B?aG9ZV3dEQUtiQVB1QjUwbVVIUEJlSVZ0d0pRZFpaNGEyRHNPLzhRbHdiSzU0?=
 =?utf-8?B?TlJZQkJ3S1pDN1VwUEpNV3ZrUW1MKytmUmU4aDZvZFBqMXREUGFSb3RzWDht?=
 =?utf-8?B?d3dHdVNIMFlzRk5iUC9nSDF2Mm40aCtFUVdrTmtiNFN3SmNxa1lqQkdrcUF0?=
 =?utf-8?B?eVd4c2ZjdzY1RG1OTHdkckVwdUVXMDQyOXVYbWliOGZJNEJHVHE4R0FmU1ZJ?=
 =?utf-8?B?MkRGdjVBa3M0WTZHRmx4VG84RUVmMnNreENkYjFad0R4cWE4enhYYkZPTWw3?=
 =?utf-8?Q?9FRKE+qLJsaRmUI39rHCrXQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeacef23-8a04-40cd-8e23-08d9df54717e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 16:13:22.5876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWG+COFerUATD78ii8JFVUF6h8t7hogMYqsKrsbiw9tYHRD3itd25KEI+uCDjGK+OVVkzR3bE3IarX477msbgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

RMRRs are setup ahead of populating the p2m and hence the ASSERT when
populating the low 1MB needs to be relaxed when it finds an existing
entry: it's either RAM or a RMRR resulting from the IOMMU setup.

Rework the logic a bit and introduce a local mfn variable in order to
assert that if the gfn is populated and not RAM it is an identity map.

Fixes: 6b4f6a31ac ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Fix indentation.
 - Expand existing assert.
---
 xen/arch/x86/hvm/dom0_build.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index b00e45885c..63dceb2116 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -466,11 +466,16 @@ static int __init pvh_populate_p2m(struct domain *d)
     for ( i = rc = 0; i < MB1_PAGES; ++i )
     {
         p2m_type_t p2mt;
+        mfn_t mfn = get_gfn_query(d, i, &p2mt);
 
-        if ( mfn_eq(get_gfn_query(d, i, &p2mt), INVALID_MFN) )
+        if ( mfn_eq(mfn, INVALID_MFN) )
             rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
         else
-            ASSERT(p2mt == p2m_ram_rw);
+            /*
+             * If the p2m entry is already set it must belong to a RMRR and
+             * already be identity mapped, or be a RAM region.
+             */
+            ASSERT(p2mt == p2m_ram_rw || mfn_eq(mfn, _mfn(i)));
         put_gfn(d, i);
         if ( rc )
         {
-- 
2.34.1


