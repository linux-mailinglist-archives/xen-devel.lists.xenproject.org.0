Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1194E6731
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 17:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294479.500783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXQZH-0001zy-PD; Thu, 24 Mar 2022 16:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294479.500783; Thu, 24 Mar 2022 16:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXQZH-0001xd-Lq; Thu, 24 Mar 2022 16:44:11 +0000
Received: by outflank-mailman (input) for mailman id 294479;
 Thu, 24 Mar 2022 16:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7/3=UD=citrix.com=prvs=07544547a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXQZG-0001xX-HD
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 16:44:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f3e6714-ab91-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 17:44:08 +0100 (CET)
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
X-Inumbo-ID: 9f3e6714-ab91-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648140248;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6AK0d4ijX6oNHWSbE5A1ZAoW4wmJ7cXzRC/kFM1iJro=;
  b=ckCQQgny8NXq8I5InmGGTw/cl0mnFBxdzEnTh51aZXrP4HOKC904DzkI
   79hERITEfCm8CiOZwF1kh0djttKRubd2kCwHQlhiQ/cXfvFXRMMyITjtf
   kwr6b1XX5ZNyYxvhHQTdT2IGEJiFReaCSaxEJul0TunHO0VdMVm9CSTLh
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66539279
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1PEOvKuw11Stm9ZpiOibxcei1+fnVOVeMUV32f8akzHdYApBsoF/q
 tZmKWCHOfyIMGOjeNggbIS290oPv8TSx9BnGwdk+ys3FChB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX5
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8KH7edpOU6XCVnKA9RJbVo8ZOae2CW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 ZdCOGAwPXwsZTV+KlQdEMgUht6Kh2j5awBitwyJrIoOtj27IAtZj+G2bYu9lsaxbcdImkeVo
 ErW8mK/BQsVXPS94zeY9nOnhsfUgDj2HokVEdWQ7eV2iVeewmgSDhw+Vlahp/S9zEmkVLp3M
 1QV4CEnqaE46WShT8XxUhO1pnKJpFgXXN84O+Q78wiMzqP86QeFCmUKQzhNZcZgv8gzLRQ23
 1qAhJXtCDpgobCRYXOb6rqQ6zi1PEA9MWYHbDQsUQgB7t/ssYw3yBnIS75LAKOzy9H4Bzz06
 zSLtzQlwaUei9YR0Ke29kyBhCijzrDrYRQy/R7/RX++40VyY4vNT5OswUjW67BHNonxc7Wal
 CFawY7EtrlIVMzT0nzWKAkQIF23z9WkKmzggHlgI6Ya2Ru141CqUd0K+BgrcS+FLf04UTPuZ
 UbSvyZY65lSIGamYMdLXm6hNyg55fO+TIq4D5g4evILO8EsL1HfoEmCcGbKhwjQfF4QfbbT0
 HtxWeKlFj4kBKtu11JarM9NgOZwlkjSKY4+LK0XLihLM5LDPBZ5qp9faTNii9zVCove/205F
 P4Fa6O3J+13CrGWX8UtzaYdLEoRMV8wDo3spspce4are1Q6SDl/U6+Kn+t8K+SJepi5cM+Sr
 hlRvWcClTLCaYDvc13WOhiPlpuxNXqAkZ7LFXN1Zgv5s5TSSY2u8L0eZ/MKkUoPr4ReIQpPZ
 6BdIa2oW60XIhyeomh1RcSt/eRKKUXw7SrTbnXNXdTKV8M5LyTT5MTedxfinAFXSHLfWT0W+
 Ob7iGs2gPMrGmxfMSohQK7wngnt7ClHxIqfnSLge7FuRakly6AzQwTZhf4rOcAcbxLFwzqRz
 QGNBhkE4+LKpucIHBPh3Mhoc6/B/zNCI3dn
IronPort-HdrOrdr: A9a23:gNDOkqjI2XPZuaCC0j2lWsu4E3BQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhMY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAkqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocbTbqjVQGZgoBT+q3tYpxqdS32AXTq+/blngS+pUoJgXfxn6ck7zU9HJFUcegx2w
 2LCNUsqFh0dL5kUUtMPpZwfSKJMB2+ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,207,1643691600"; 
   d="scan'208";a="66539279"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuHlE8JYRJ2buICLzpxxbUqVAz+AwBklsSnEJ0ZjUkFAeQlj7giMjucQMFF0R9m45ZZc4tgbaS2dVOH6p6ejPeAXOCP1FgoiTTkvJQ9tOVU2gE2B2o+nk07+9Gd4u2ZiqCv/cWRMVV2NE9YRqpbf0mnCtz2rgHzTrruQD24VIXnkq6GKUqcaldIuoSfbkOHWPjd6WhfTHeMoQYk5AkQpjxYSY+gk/PZNPHuDkuSaEe/7TIMij5BArL3YuqRsqD4QqY0djIN/cCWxCZBxwrTHWUzyweJqdgbNnnNDJSbEgPat+ftLq7TKjHRb3gtOClb+GOIeWJXHepI+Mr3FPXeBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGAGIp7T5z4Kf3FAho1Gjz2xraQhXqBhGckrKyWGAMg=;
 b=aGhTMsUcS+qBiaw+AUBIbMO/BqleiOZGbzb10GfcC3J2vmCWZ+kCrd9UR8dXiudI4W40xKLyGBDq0a0oQc+5deEJZpuCBtIZx2GGDjSBbQ4PeIkzWswGs4iym2VyOPGWt2RWzC927Wk4O4Te57vgc0Qxn8L9fySr9HhN8d8Ahh08w3h/R8kf1fRLpWqgyj4rQA3TX/c5Cu8Bf9bznUCpSCLZpyaP4nooBrCECSNftUf3N58S56KX/fJeKZQKpOIqYSrRE8uR1JoKtX3lSiJBwifmDJ5uuSTuxCHaBCOAYuNL6ctMfNcyEBT6oX5cke8S1aBFxNgP/AzOmP46j9WkxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGAGIp7T5z4Kf3FAho1Gjz2xraQhXqBhGckrKyWGAMg=;
 b=vp9EM+zvyu/UBDIwILLs1Q3bfFR56AQB7OEc6eXpyzU6DwWq8mvY4j4N3Epw8sWXS3NtU22rE5O2aIwwREJHLiLdUtvYwI4O0LNxFSOasZubMjb3TD71AOvL5GBGJIeMoaqeddKNgjide4fBTJnshjWDTJecOurscQMsC4EKMH0=
Date: Thu, 24 Mar 2022 17:43:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>,
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH 3/3] x86/mem_sharing: make fork_reset more configurable
Message-ID: <Yjyfygi6pE+UVhjM@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
 <YjySMjegTNFBE5RK@Air-de-Roger>
 <CABfawhnnAehxaByyncaYAjSSbddJi8yeTnjcXX_a+st8Q+C_+Q@mail.gmail.com>
 <YjyWW2CkQv1ckvXM@Air-de-Roger>
 <CABfawhn-QiUBuq9c4tzr=9nL=J-ntm1hf23mbeRu-qCAKRDj1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhn-QiUBuq9c4tzr=9nL=J-ntm1hf23mbeRu-qCAKRDj1Q@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 246b9248-c9b9-4172-114a-08da0db57e5e
X-MS-TrafficTypeDiagnostic: BN6PR03MB2498:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB24989A9D5B6D2945105490688F199@BN6PR03MB2498.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fzvdxIPV2RT4I/lAb1fSvEzZd9ePuxQXIEpuStMPkhD9Ji4tEc1cMzZAfn+zuFNmzcc3jHBOFGYSYIVP54qUvAdLHs5QG6hX3DAaFsF0I2PqGauvZ5CHqSg2AEotquz3hi59xv056T4E4HGHOkEPb3koRjcp6Oq+OrfgfcVSJlMD36qrGJ0B/zLkE9LUVXcywGfnIIvgdiACHcNpB1PHidiSwhOQZdg/4EF+mBDTxGN7daaBguUpz6gPxn0SW0jPKY+mKw/xXd43nmreLivoaCygEnHsBp0eapPsPuw1lkiV9eJkj+ZHBe+Xh/IRxqu1aUlYrtU9Fe2uXUuUPgytQoi2UIVsNuFnjkCqkysbZnpTF4tHufoxQbZLA+3kWNKyKmMa13SiixA6DBsjzqmdecQsoyS+/31SO3ZE+wOql8QaFynx6zyKHKH4zsy3L9m19tV5MdhtnGP1tNzG8nuhMxCEv3D8217yVrDcwYWiTetQ/luGmxLowSHFucQWKiw4q/8wm7vmwxO1+16gukTaqhTpfoEEfygndaO2r0nARkoT+ufveBmlaGhIvh85gQcmLqU3K4oc+vDkbfLkU18kXZTTWiTxWDJR2CS66q8LkMxmomi3XPLTgk27L8f539NVCv9q2HMSJR4iJJ7IP4qizvYLyQoQq9skkR6E1p0uY/gN/5gsINHAd3WXvLt43NYhjnmObOSQ5ZUbHvulPfwWGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(26005)(38100700002)(86362001)(83380400001)(8936002)(66556008)(186003)(5660300002)(316002)(66476007)(8676002)(4326008)(66946007)(33716001)(85182001)(7416002)(2906002)(9686003)(6666004)(6512007)(508600001)(6506007)(53546011)(6486002)(6916009)(54906003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDFoOHlVOVc5ZGoybTRqbE5lU2sxNk1xYVBGMHVuNmlWaUQ2Qzd3cUVocE1H?=
 =?utf-8?B?UzFET1dGREFqc0RmVHpiTzJoeTFIdFc2K3Q0ejlMR3lIeVBJR293QzQvbDN5?=
 =?utf-8?B?NHQzd25oSXNOdExRRFRsQ0ZJaFpWTVdIb1BNL2ZWcHhxS3pST3E4VFVEcnlW?=
 =?utf-8?B?WVBkOFB6WGZyNDRvU0lEN0xLQnV2clRrSWlkbUgrNytDR1VJMGFrcVJONkJ5?=
 =?utf-8?B?ZU9OOHRURDVTK0pFZXUweXIwWXVlYzJDbEo0cTJ6ZkI0OEowQ01rSXVHNE0z?=
 =?utf-8?B?REJLLzUxWkJoSmZ4T2VWRkdyUEQ3RHdPQzhIbEwvTUlnM2ZVUlZ0Y3EwV0cw?=
 =?utf-8?B?cHloRkRvSy9LdlJkaXFQd3VVUWF4aCtTWk5uSisrWVUrR09GRDRHWENJdlIw?=
 =?utf-8?B?RFNyTVhJa2hYYW96c3EwQVQ2NzVFQlMvMUlGTCttRnJPZlJtalJWUVhtU3hj?=
 =?utf-8?B?Zk5WTnc1bU84MDJMbElINnhVTDYrOHl5SE1MOXR2UnNqcXBPQnFjWjJTUTBK?=
 =?utf-8?B?TnduZzg5VWUyZUtoUE1DUlVVWkhUMGs0RHdzVHhnM3RnMktoUkJJMDFhQXFR?=
 =?utf-8?B?dlJrQmh0bklsSjBCVXlHOVlRdUZ5a0pURGkvc01XUzhWNUpTTnB6bWxsNjJz?=
 =?utf-8?B?Rk0zVGJKYmhtZWxIK2dURTlmaGkrSTZydkViYStjMEtJbEFxOERxSEFsMHpY?=
 =?utf-8?B?STRmUlh1RzdBZHlRNFB3YjVPTnl3NFhka3U4OHJFazBqQ3c4MHUvV2VXb0RG?=
 =?utf-8?B?TVR3Q2o0dlMxRGlubkFSMEVYcHFHTVl5cGl6S1FzRFV2bDZ6OVBjKzBVMDFz?=
 =?utf-8?B?K3RsT0RQVmtCOW9SVHZpU0crNXRlWldWRmdHRzdDZ2NMSjlWcGthSFRGNU5l?=
 =?utf-8?B?OE9NTGM1M3RuMEZQaThEeG1MdkpoNWxuc2p4WFVkb1pzYW5Ec3oxZkFSTnpP?=
 =?utf-8?B?UzVHNmhEc3hTL3hrZkNBZXhXdmJtUG5XZFdvTjVDRHpYdC8zM1pneVVnbHBs?=
 =?utf-8?B?WFJCMVM4TFloV3VBRFVxTks3LzZsWVh2dHJKWmVZQ0ttdjdzaC9CTnN0Q1FO?=
 =?utf-8?B?dVQrUGZLN0FxTFc2THhBSTlNdXlpaE1qZ0FBK3pkZ0NmcUhlSWtvNHg2SjFP?=
 =?utf-8?B?NG1NU2NBSkpIaEYzY0Y3RjU5S3JMZDQxTFYzcDZBaEV0Q0lrYzZYVHROTG0v?=
 =?utf-8?B?YjU4K2E2Qnc3ZUNyUFVVRU0rL0ZUMi9ybnE2SWdNblFLdmJTSkd3Wml6MmFE?=
 =?utf-8?B?Ym1PSkhrdVdZTEFqVFc0TGFxVjlUQkdlcVU3aVh0eU9OU2liM3h5WWJTcWtu?=
 =?utf-8?B?YjdPcDlFeG8vUVhaQ1RQbys3QWZSMzNvWlJXemU0REFHcDdGTDJRb29SNkZV?=
 =?utf-8?B?RlNyT2d0b2plVG9PTGRWRUlkQ2VnOEFzKytIYW5yK3p1U25GOG0xQjAzVmJ3?=
 =?utf-8?B?YzlyWHpheDJJdStjSUlSd3BBNXdybkFWSzBpVi9rWVRxSEk0aTdKWXpBTitC?=
 =?utf-8?B?aVpzcXJYRkhRaUlCK1QvSzF2bTJySkM5VWZMWFhtck9GZ2lDMzZwU2l3SWFS?=
 =?utf-8?B?cGhSWWg2QXdqcithZEh0MERTNExaaXpJRHVBWHVIR0ZpM1FhQzI4b0NTaFVB?=
 =?utf-8?B?eEtmbFZ3MmM2VjVVb1ozdnh1eCtuN04zUTNSa3lPb1NEdXpHdGt6U01YaDBS?=
 =?utf-8?B?dS9SSmhLdy9Uckc2TVJmN0ZUZFVpSThiMkNuQVl2QVNpbE54TDhuVStycGRM?=
 =?utf-8?B?VDBId3ZZTTB5SFhaMnd1T1pjWDJiejV4cHhLUGJaZ1JWWDZZRDkrYVUvS1Vk?=
 =?utf-8?B?ZnFJYVhRc3ZqZ3dyRzBrVGpEVS9IdkZqZFVKTWhXalpQY3RGSnA1RHV4UlI2?=
 =?utf-8?B?K3ovRXpmTFMrQkMvMWtGVnF0M2VNMWF2cmJoQi9mSVdabXRQSzd5cnpYenly?=
 =?utf-8?B?Z1Z6OHBvS0p2TVhmemVaQVlWYjBlcFRWNk9ockltQW9hMXlyd01MSVoxaUNa?=
 =?utf-8?B?cFN2UEFSNHZLSmQwa0dlaHlES2QyUmhFSWpIRG1RQmxMZ2M2bFFsakkrMDJz?=
 =?utf-8?B?eE9FNTZRWlRwZGllc2RuQVVoZlB0LytiVEw0eVo5OXBkeTBkN3RhZzZpZkMy?=
 =?utf-8?B?anNYL0hBcjB1WUphUW5wbFNBbG4rd1IxTmJHbVFFOE1ocG9NRTB6ZWhYRWdl?=
 =?utf-8?B?c1NBTlRqZ011VkM3UU9GTDhvTndZZWZXQ0NhR3d3QjRkYzBpUFY4WEJNeHVl?=
 =?utf-8?B?SisvSVFIY2lnZlI0dTdPQTJSZzNSYjdmU2paQ0d1N3pTL1d6ZnJyd2FDRFpM?=
 =?utf-8?B?UEZuTWFSZFdodnlxR01hbFQzanZtUko4T09nVDhDaklTdVNXUmJIODMzOGtY?=
 =?utf-8?Q?VWfXXepQ2CEnF5oI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 246b9248-c9b9-4172-114a-08da0db57e5e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 16:43:58.8087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1cui56lMrCuGyMXIJyMSs2AzEuL967ty+6qMhcpjv0csUr1t84AKcB4Bp4M+nBu4GCeqwuWFx9fRega40awpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2498
X-OriginatorOrg: citrix.com

On Thu, Mar 24, 2022 at 12:22:49PM -0400, Tamas K Lengyel wrote:
> On Thu, Mar 24, 2022 at 12:04 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Mar 24, 2022 at 11:52:38AM -0400, Tamas K Lengyel wrote:
> > > On Thu, Mar 24, 2022 at 11:46 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > >
> > > > On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
> > > > > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > > > > index 208d8dcbd9..30ce23c5a7 100644
> > > > > --- a/xen/include/public/memory.h
> > > > > +++ b/xen/include/public/memory.h
> > > > > @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
> > > > >                  uint32_t gref;     /* IN: gref to debug         */
> > > > >              } u;
> > > > >          } debug;
> > > > > -        struct mem_sharing_op_fork {      /* OP_FORK */
> > > > > +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
> > > > >              domid_t parent_domain;        /* IN: parent's domain id */
> > > > >  /* These flags only makes sense for short-lived forks */
> > > > >  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> > > > >  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
> > > > >  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
> > > > > +#define XENMEM_FORK_RESET_STATE        (1u << 3)
> > > > > +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)
> > > > >              uint16_t flags;               /* IN: optional settings */
> > > > >              uint32_t pad;                 /* Must be set to 0 */
> > > > >          } fork;
> > > > > diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> > > > > index bb003d21d0..81c2ee28cc 100644
> > > > > --- a/xen/include/public/vm_event.h
> > > > > +++ b/xen/include/public/vm_event.h
> > > > > @@ -127,6 +127,14 @@
> > > > >   * Reset the vmtrace buffer (if vmtrace is enabled)
> > > > >   */
> > > > >  #define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
> > > > > +/*
> > > > > + * Reset the VM state (if VM is fork)
> > > > > + */
> > > > > +#define VM_EVENT_FLAG_RESET_FORK_STATE   (1 << 14)
> > > > > +/*
> > > > > + * Remove unshared entried from physmap (if VM is fork)
> > > > > + */
> > > > > +#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)
> > > >
> > > > I'm confused about why two different interfaces are added to do this
> > > > kind of selective resets, one to vm_event and one to xenmem_fork?
> > > >
> > > > I thin k the natural place for the option to live would be
> > > > XENMEM_FORK?
> > >
> > > Yes, that's the natural place for it. But we are adding it to both for
> > > a reason. In our use-case the reset operation will happen after a
> > > vm_event is received to which we already must send a reply. Setting
> > > the flag on the vm_event reply saves us having to issue an extra memop
> > > hypercall afterwards.
> >
> > Can you do a multicall and batch both operations in a single
> > hypercall?
> >
> > That would seem more natural than adding duplicated interfaces.
> 
> Not in a straight forward way, no. There is no exposed API in libxc to
> do a multicall. Even if that was an option it is still easier for me
> to just flip a bit in the response field than having to construct a
> whole standalone hypercall structure to be sent as part of a
> multicall.

Right, I can see it being easier, but it seems like a bad choice from
an interface PoV. You are the maintainer of both subsystems, but it
would seem to me it's in your best interest to try to keep the
interfaces separated and clean.

Would it be possible for the reset XENMEM_FORK op to have the side
effect of performing what you would instead do with the vm_event
hypercall?

Thanks, Roger.

