Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC994D1AED
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287032.486810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRb6u-0008PV-D8; Tue, 08 Mar 2022 14:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287032.486810; Tue, 08 Mar 2022 14:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRb6u-0008N7-95; Tue, 08 Mar 2022 14:46:48 +0000
Received: by outflank-mailman (input) for mailman id 287032;
 Tue, 08 Mar 2022 14:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRb6s-0008N1-K6
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:46:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9236d3bf-9eee-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:46:45 +0100 (CET)
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
X-Inumbo-ID: 9236d3bf-9eee-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646750805;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BainXa3cvDQhGc9K50Ki8EfFbUbKTlSpdwdoha6WAHY=;
  b=RDB3rGYqd43b64GIO+H1haSstMlviTNiuyvAL2igpmhgNapcrlQc/ual
   6E53819EeYGsm7XJ2uZmgfQ3oFpXeMvHTFlM1DyjPGlIzeyoHDDiNRmZG
   wSj7ol/DIMIKs131lWrZT1BiX6fQ9MJAX2Kx0dNaRLna2TzfxUIZJlAsn
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66110360
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:o5MpCath3U5QDAGxmpj5I2glP+fnVKJeMUV32f8akzHdYApBsoF/q
 tZmKWHQOv6DMWHyKdB1btmw9EsB7Z/TzdBrSANp/i9jEy8U+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV6
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi91JpfAp+4/CiMGDnpDO/BW/5zWGGCG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 ZNAMWExNHwsZTVfK0UFNa4Vk9uJrXvRKRpIqQmnt6w4tj27IAtZj+G2bYu9lsaxbc9YhFqCr
 2TKuWHwGAgHNce3wCCAtHmrg4fnoyT/X44DEayiwdRjilaT2287BQUfUB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4DOkS+AyLjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht9H0AT1itpWFRHTb8a2bxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY3n5WrLvDiO/6KXU1UI4FjHWUG01xtAMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFpib7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2MBjatSsIoHONiwM2ITRTIt4wKuBJw+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jeTAOy7IEu5VbQDmggUFAEWs+l69H
 zF3bZfi9vmieLemPnm/HXA7dzjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9cNokihrc+Rp
 ivVchYBkDLX3CSbQS3XOiELQO6+Bv5X8CNkVRHAyH71ghDPl670t/xBH3b2FJF6nNFeIQlcE
 6FVK5/eU64UFlwqOV01NPHAkWCrTzzy7SqmNCu5ejkvOZlmQg3C4Nj/eQXzsiIJC0KKWQEW+
 dVMCiuzrUI/ejlf
IronPort-HdrOrdr: A9a23:Sn+waK3SDQoKxjG7Gu3nOgqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXyOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idgrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNId3AL3Z
 WADk1SrsA8ciYnV9MMOA4/e7rENoXse2O7DIvAGyWvKEk4U0i93qIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="66110360"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaPOWhLGJm8y/Pll84bVL0H6A7vKaSZv8of+Bi7zgAJmp09z4mjAwv7ubzDj1Zgn1ZlJAJHEb8manb98VnUsusfyXGBBSOT7iB1Hi3oH+DvSvBI4WtinjANFnZv0csDLvudXMfH36ryli/JV5igGOylwJaXawwHXPXcDHax9IqEJACCEzkI8PbJLp02BrsgwY6LZehPNr7HbdtLrVOFRoeZNpqnKns6wCBmuRmZeGeK9e6jlUenCp6uh2neAiRthLlLMLrrFWaY+7N9OCQhgriOFYNJsKaOY+jP+LOq+CgzNkQ4ph3An8xH7ujoFqZHcn6k193gi5Vn1lJg4WXiu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kF/Y7x+EaR4NgtF/xj4yHlhreyRRqf4Q2AKZ4rRQWyI=;
 b=EuJgR6jKLTBGsq7bbwW8TCuusr8KRURwkeGfVLbWxOc+INhOLwIo8ve5aT/DoII/q2Ys6b6KOp/empc8JG9xQiZ2MEJs88lEOKsPzL59Ua684UYqaJhCGSHr91BH8fow92VLTvKCogHM3RDMBiCXY1DsjFCufJr/ihoQOu90VBu0w7bCLvlSO2xzypI4flSXmxDaUdL5JS1e11N8194iNTDE2T9Yk/13Ga8bw6AECp4sLJkICBaBEBgxIQfjplu3LxrPF7uuCwtRwUF5jM7iGwlk2Wao71Dh+GhGe554hq/RGYgnpU5ZtEgXbVWiSSE66diJ8wrre97zdOaLTe+5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF/Y7x+EaR4NgtF/xj4yHlhreyRRqf4Q2AKZ4rRQWyI=;
 b=HaozPMwLbHjKIRy+1lmqkjISCRhdR4kCxnVB1xiHdnYz+9i4dUjE1OfJI1EYKPpw6uuzyjNSHyjGTyBka0nN/xIGK/wS1pLrjmnVx0P/QuksYpYp+UZp5eONdVth7OhpqkfoM7+pS81djcXB1T1GcAi5BFFhSGq4qE5X2N4pRrY=
Date: Tue, 8 Mar 2022 15:46:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] livepatch: set -f{function,data}-sections
 compiler option
Message-ID: <YidsSmPV1Pqulp+h@Air-de-Roger>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-3-roger.pau@citrix.com>
 <c35415ef-b3c1-cc1c-2fb2-aa2de2602cd5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c35415ef-b3c1-cc1c-2fb2-aa2de2602cd5@suse.com>
X-ClientProxiedBy: LO2P265CA0087.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4002a6d9-fe8b-4ee4-4d4f-08da0112738a
X-MS-TrafficTypeDiagnostic: MWHPR03MB2893:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2893D8814C80C4F3EAF3CC618F099@MWHPR03MB2893.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7x1/wwpZxopqWBXFPzRsVQFL/6hcF0I8pj+cszRLCUI692aTO2jbz7S6r3Xduow+Hbza5GXj1HlvVm860bAdftnmrFinDHfkmfeLN9LXehbxDKmnkuci6B+9ucVVimr0KX9dIVQxAPRIiXhcU80gf/zoLLYi8jqaCS/wcwkQb8lVLehVtaAm0rY5+qJyi0k241B8jyGg0tniEJi/ytFuR+2s7Wo74L02qtHQnUwu+P0IzFT94OJROlI7NWFSx/mrTyi+ER7x35isZCA/pIJAhgK9LEWWon4rQ7yiHVeyaPGXixYo3DPPZMFXbmaZ7HCmsPIkB3wZDVeTw4+vNWyFCveHZNqdotAx2Qi0CdfcohepEKI8GZrHjs44zwuB/FlPKyBoTqdS+ZYnoR7HRFFUCxZ2Nt72dT97U9qvZAlwPB2Fqhq0nN/HDythNIjOWZkDom0JfwqweJrUs2u4XRHPj/ybDLRgulOIKxQU+TJzdDeohMqR9M1TGfcohlQNxQBuAjVs9T55IEJdmDhLatGEz9Xdtt/G+6w8BKbZ1coWTzJjrdTMmdRG4UaESVyL15+LS1YCR4gM0HE9zoizUjNYumZbKzf/aslGCvarABnPzHyTBiWUPl0fdoCXWrSNNvrKxr+dJSc/9ibRdK3vRNQ+QhEXz2L6oVw3eloe8kAFJJz3tTrF/Xnf6tJiXQNjUeoxkkkogbYnmHQF2mjYclKE1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(508600001)(6486002)(6666004)(8936002)(186003)(86362001)(53546011)(26005)(9686003)(82960400001)(83380400001)(5660300002)(6506007)(4326008)(66946007)(8676002)(66556008)(66476007)(33716001)(85182001)(2906002)(54906003)(6916009)(316002)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjVBK3Fnay9jKytLVm5Gd1c3M0VCdlNjOTRSTU9CWFROcmc5TzhrQjVxZktK?=
 =?utf-8?B?U2hETkFhT21Yb1dGY2JKa0tLMmtycGVKOUhSVHZBdU00cHFhekdrZ3d5M3Zz?=
 =?utf-8?B?T3VyN3I3bHNadFZ6ZDBkQXZzKzg1cGJoSWxvTkdGUWRjMWs3U0Z4U1V3MERG?=
 =?utf-8?B?azF1VkpqQmZLdURRa05JTkdxalRsTE96Zysxd0szdE1scURmQWxqMUVISHVw?=
 =?utf-8?B?bjMxOWdwMDBQOGRnanVLdDM2Z0xoUHpYbVFnZjFCV0IxdllkZjk5dFhqbGRD?=
 =?utf-8?B?d3g3MXIxR081bXhjYk5QWm5saXpJZTBKM24zMklRRCtnbzIvalVySFhyTjFI?=
 =?utf-8?B?SkdIUkYrNzQ0WmRQMStvb1JNVnpUVXBrdE9pUkNBVkw5Sy9XbmI5WE9MbTJn?=
 =?utf-8?B?MUdjd09rZllZL2pWdW56ZnFJYktCclI4bGJabTJQR1NlRlJHaHBPZHQ1OWI2?=
 =?utf-8?B?VTA2VHd3OStiRWlxdXM2T0dzYy9scWl5aFpZKzFhVTlZOWttNVg4NjF1d0hD?=
 =?utf-8?B?dlE4OVRyblBCRzFYczZMWG5kZElqTFJSd3IyZjdwalhkczZ0ZUVkbUVObnVP?=
 =?utf-8?B?WjJ1RThpWCtPeUpIei83ZHEzZXRJMkVlbnB5ZVdyUDlnL3haSEk0RFhOak1o?=
 =?utf-8?B?Vms0aTRSd1psRWVFckpNZCsxZ2o0TkhvU3llTEVWSHFMMUdIMHplV2Uya085?=
 =?utf-8?B?bTJlcDBBRm5SSFRPUHVLUHJSZGFBcFJGbTJMZjduMmt4bnpCUnhSZXVibC9D?=
 =?utf-8?B?Y2VsaU0vbU5UaXhwdEovVmliZGVPTU9HWnR1d0c3RE11WWpZcDFyOERpNU5j?=
 =?utf-8?B?YVEwT0VmbkYrbjJzaTJWbTNQZTE5N1l4MnlGSUh2TUdxWnhwZ2h0MkZPajh0?=
 =?utf-8?B?eWYwNktaT0R0b0tacUdUc1FyVFBsQXJMcXlIbEhDbmdvVloxMWxqTnI5L2w5?=
 =?utf-8?B?c0pKU3o0eFZzWk9wL1M3ellXNktVSTF2cWRrakFwYXJaRTRBT1p1aWNPZS9D?=
 =?utf-8?B?dzh2MWJzVlJKSmN0V0t4bzFIV1RRY0o5MzE5KzY2QnVDSzZwSEQvcXI5WGcw?=
 =?utf-8?B?dUsyNGNYRFF6UVhpTUZGeUhZVUt1aWRDbWZMbldKalJ2K0Jka09ETXQ2MXV2?=
 =?utf-8?B?QmwxQmU4Z0FObDk3Zy94OG1NeU9GVnFUM25jSDY4cFdiS1RmTHYzSzBZb1o1?=
 =?utf-8?B?dTBmY25YWlc0cTNidjI3WnVXVFFWL3NIYTF2UjRudFZibWdsRThPaU8xQUxk?=
 =?utf-8?B?WEtFcm0yeW5WWm9MTmJ5cjI2bTJnUHdka2ZramVPYjB5MmIwb3pDTUFuMzdP?=
 =?utf-8?B?MDhiVnlkUU12OVlyU1I0YjduZmxra2tNVmowdGhJRUJHVlI5Vkg3SzRKbXBh?=
 =?utf-8?B?RG41eXBxNjVwRzJmT0wxaFNGTGVlZG45RTA2VDJVRVZUeFdCUmNYVWd2bFcw?=
 =?utf-8?B?NUZZd2syWmVBQVE4YTBzbjlEc2F1M3F3RzRER24xbWhZZGhUSUJrNXprTDJv?=
 =?utf-8?B?QTFYMzR3MFNJU3ZnVVc4R0lsTkhPdnVnRHFGei9tTUpVTU83SU9KcDdyWDdH?=
 =?utf-8?B?STFuTlEyaEovSzNLU2tTTzVxQWF1MDhOMjBPRzBnTXZIdDRGb0o5Y0g3NWQy?=
 =?utf-8?B?a2RnZXF6VVZJeXRleWRUU3BEUjZvMDB3dVFGVEJCU09JTDF5emVIT244T1d0?=
 =?utf-8?B?d3gxdTk4WndKSGxZeGRsRlRFbGNPZkpJTE9BWTcrWEFoY2VOTjhrbmJHaHlD?=
 =?utf-8?B?WEFYblIrOVhKUDZ4Mms2R0RnVjBqTzdUNG5GUEFLMEhKTVZTbHphUDVoQXFT?=
 =?utf-8?B?cjlPS1Z4Z1RwOTY1S3RUM25xMXBkTmEvaVI3a3REMng2MGhYTEh6NTJtN1dJ?=
 =?utf-8?B?Qno4YW1TaWRRNms0WnZIRGs3YjYrbEM5YVJnT096dzZqYnZ0Q3ZTbnk1cE5D?=
 =?utf-8?B?OGpLRVZCSEVnUDUwbDZJY0xtVmQwVDNoY1BWaEVxM2VTOGxmalhqaTNyVEFj?=
 =?utf-8?B?N3lYa2h1b21ic0Q0NGszamxpWjJhM0lTQTM4NUcrcVM2aFBrcmZCQklCdFlY?=
 =?utf-8?B?ejh6R0w4V2ZOYWpRVVNXd1N1eE1KcytsaGhBNldjMXJjRS9hb2xjajgwRHQv?=
 =?utf-8?B?MlJwYWErUndoZisxUGZkM0cxdGFHSkpUZ2ZRTTJ4dGgrbFZJMW1oS0dhN05h?=
 =?utf-8?Q?FmA5C9uDAbz49HzdaY1gc1o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4002a6d9-fe8b-4ee4-4d4f-08da0112738a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:46:38.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvw3qwy2AGuEXbIOFJ35qYPRwGC7by4QVFKcyNjKTUBfSAgPIW3NaNAlH/nHJl2UDvXWd/w0Es51IpXKQnOrfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2893
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 03:09:17PM +0100, Jan Beulich wrote:
> On 08.03.2022 14:49, Roger Pau Monne wrote:
> > If livepatching support is enabled build the hypervisor with
> > -f{function,data}-sections compiler options, which is required by the
> > livepatching tools to detect changes and create livepatches.
> > 
> > This shouldn't result in any functional change on the hypervisor
> > binary image, but does however require some changes in the linker
> > script in order to handle that each function and data item will now be
> > placed into its own section in object files. As a result add catch-all
> > for .text, .data and .bss in order to merge each individual item
> > section into the final image.
> > 
> > The main difference will be that .text.startup will end up being part
> > of .text rather than .init, and thus won't be freed. .text.exit will
> > also be part of .text rather than dropped. Overall this could make the
> > image bigger, and package some .text code in a sub-optimal way.
> > 
> > On Arm the .data.read_mostly needs to be moved ahead of the .data
> > section like it's already done on x86, so the .data.* catch-all
> > doesn't also include .data.read_mostly. The alignment of
> > .data.read_mostly also needs to be set to PAGE_SIZE so it doesn't end
> > up being placed at the tail of a read-only page from the previous
> > section. While there move the alignment of the .data section ahead of
> > the section declaration, like it's done for other sections.
> > 
> > The benefit of having CONFIG_LIVEPATCH enable those compiler option
> > is that the livepatch build tools no longer need to fiddle with the
> > build system in order to enable them. Note the current livepatch tools
> > are broken after the recent build changes due to the way they
> > attempt to set  -f{function,data}-sections.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -88,6 +88,9 @@ SECTIONS
> >         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> >  
> >         *(.text)
> > +#ifdef CONFIG_CC_SPLIT_SECTIONS
> > +       *(.text.*)
> > +#endif
> >         *(.text.__x86_indirect_thunk_*)
> >         *(.text.page_aligned)
> 
> These last two now will not have any effect anymore when
> CC_SPLIT_SECTIONS=y. This may have undesirable effects on the
> overall size when there is more than one object with a
> .text.page_aligned contribution. In .data ...

Agreed. I wondered whether to move those ahead of the main text
section, so likely:

       *(.text.unlikely .text.*_unlikely .text.unlikely.*)

       *(.text.page_aligned)
       *(.text.__x86_indirect_thunk_*)
       *(.text)
#ifdef CONFIG_CC_SPLIT_SECTIONS
       *(.text.*)
#endif

FWIW, Linux seems fine to package .text.page_aligned together with the
rest of .text using the .text.[0-9a-zA-Z_]* catch-all.

> > @@ -292,9 +295,7 @@ SECTIONS
> >  
> >    DECL_SECTION(.data) {
> >         *(.data.page_aligned)
> > -       *(.data)
> > -       *(.data.rel)
> > -       *(.data.rel.*)
> > +       *(.data .data.*)
> >    } PHDR(text)
> 
> ... this continues to be named first. I wonder whether we wouldn't
> want to use SORT_BY_ALIGNMENT (if available) instead in both places.

We could use the command line option if available
(--sort-section=alignment) to sort all wildcard sections?

Thanks, Roger.

