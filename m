Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D4547C0F0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 14:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250426.431319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfQ0-0005Ok-Go; Tue, 21 Dec 2021 13:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250426.431319; Tue, 21 Dec 2021 13:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfQ0-0005Lz-DO; Tue, 21 Dec 2021 13:43:04 +0000
Received: by outflank-mailman (input) for mailman id 250426;
 Tue, 21 Dec 2021 13:43:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w49/=RG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mzfPy-0005Lt-LE
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 13:43:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e89b4fc6-6263-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 14:43:00 +0100 (CET)
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
X-Inumbo-ID: e89b4fc6-6263-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640094180;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=F8xw53f5M5iZ5/W6F/R1i2u7wK/t2aeSvk07/sCCRzo=;
  b=hCAudejgxY55w4e1yRUCLlLwhEcWtfJOkl6L9Ex5quXbkfJS5lmREQpR
   R+3LDFAKINvNa46aZCwlz8+GLGxsL8fWz+kpAs11x0k2h6YYqvUOGF76t
   4NYssdqbEqgizBROOLdl7zCXujMKrdsS4qgKfAxzJYw0BDzjxgKvIQs88
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: V1Qejy0rpe1MiDxOBhB4QzFBf84oC318nmlW6ltHoD9eWDJKyrIb/KaqOKFvTQq6eQdeRCWH9D
 SJaF0iovRAspW2M27e+qXOCJlEyDPeVjXvsYordAjFgAPCVHfd4RHJrtS+MRupgJF9Oc3nvYLX
 BVVqmR4A9aMAPkzu9TlfSTgRUjy7Gpqq+rioae5bQWW5qN3R8z2tzj7Ii0j6DqRckctOthpFu3
 RJCGB+71pXsQkMg3JeItqE6lxQ4DkHWlgZA+gc0/Z0lM4pZyAP3vvS5r8MUSHQI5DBiI4Jumnv
 ry8pLgFsY42/UU9qK5PMywv0
X-SBRS: 5.1
X-MesageID: 60500647
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:I19baKtbr+/abFOaIMat5oV1r+fnVOdZMUV32f8akzHdYApBsoF/q
 tZmKT2APquPYWP0Ko8jPtnn9U5VvMOAyNY2TwI/r31gRisV+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy24HhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnMWoFD4LOof3g8tHcgIbLhBaYpRZ0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JgTRa6AO
 5VxhTxHcizkTyB/FQstEcw/s93rvH/9U2ZTkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krD9nj0HwoIctmY1jmM2nOqmuLL2yj8Xeo6DLSn+/osmlSVyn4SDzUXU0e2pb+yjUvWc8lEN
 0Ue9y4qrK4z3E+mVN/wW1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTGvPSkYK0cSaClCShEKi+QPu6lq0EiJFIw6Vvfo0JulQlkc3
 gxmsgAX3q1OtOwP/Z6g0grmmHGRl7yWdxEcs1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02AY3R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6ex2nMAM9vy/D5g4i+aihLArLGdrGwk0OiatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17Qmrghnmz+LHcqmkEj9iOHEDJJwdVvjGAHWBgzexPnbyDg5D
 v4Fb5fao/mheLCWjtbrHX47cglRcClT6WHeoM1LbO+TSjeK60l6Y8I9NYgJItQ/94wMz7+g1
 ijkBidwlQqu7VWaeF7iQi0yN9vSsWNX8CtT0doEZg3zhRDOoO+Hsc8iSnfAVeV9qbE4k6crF
 6JtlgfpKq0ndwkrMg81NPHVhIdjaA6qlUSJOS+kayI4ZJluW0rC/dqMQ+cl3HJm4vOfuZRsr
 ru++BncRJZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3OlmmAy
 gKbIRYEvu2R8YU7x8bE2PKfpICzHuogQkcDRzvH7ay7PDXx93a4xdMSS/6BeD3QDTum+Kira
 ehP4ev7NfkLwARDv4ZmSu45xqMi/dr/4bRdy108TnnMal2qDJJmI2WHgpYT5vEcmOcBtFLvC
 EyV+9RcNbGYA+/fEQYcdFg/c+CO9fAIgT2Ov/47F1r3uX1s972dXEQMYxTV0H5BLKF4OZ8Oy
 Ps6vJJE8BS2jxcnP4rUji1Q8GjQfHUMX79+68MfCY7vzAEq1ktDcdrXDSqvuMODbNBFM08LJ
 D6IhfWd2+QAlxSaK3djR2LQ2ed9hIgVvEEYxVAPEF2Fh97Zi6JlxxZW6zk2ElxYwxgvPzif4
 YS325mZ/Zmzwgo=
IronPort-HdrOrdr: A9a23:u26OlK9qDoDd+KC3w3Nuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,223,1635220800"; 
   d="scan'208";a="60500647"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmznKemHpnZ3+C73TTMk5DN/44o/uh7nDyK1qTAL85pWHamg7rJdKlX7Uzi6nw7SJbozqumO4IvXXkm1M4hldrY9RN3owQ1bXuCiMIFRIG7oq7OyBoiRJ+P/9e1hOkRd5J0ufBAVjY0xHBT/ZEzArDAU+4LNOVob4MrQpxqAbHIN5AyzbF9vTk79VL5bv3U1dI6mL625TADhm8KWtxCJzottL08HAecM9BsYk0WLMDVZfmORc3LnpSSNfRPkD8qWSpUasST3k3x+yvTt51Q7GREfrEDS1JdhoQtASP1trv/Go6gSzbD7ZvK0FT7IvD8Jr+tozlTcuJzo1ZibSUAklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOe4oh7wxgs4Bpg5Q4aKwfF9SpEPO3xYKDEKedyqTVg=;
 b=Et8Sr9S6Lstcm/lhv75RWHXHjRhTSz1WxY9kLln6hUNI+W9XP3hWZ3/OOWFTiJQc/xCdShq9R0+bndc6RoHLcP/jPMYwU/2+Ph5TeMS24O3srPzclGB1oIAwYDaRUgSSCJjiKazoBriW89YAy6AfD68CEIx9gjhcW3fVuf3t5EDot5odAbNSlY42dX1RL2inP3Gdp9wHNiE/5trd3bmBsWkq/qGJ2VS8tYmfO6hbepyf9M1hYm3w6u4qVfRlw1XX9kRhq+4Yzp3UIfHFBgIXVcy7JS5LlI5Mx3Lo4h2QyOMd0vqMJX+Po5ucgrUb3KtDor/DAIzEq6fmmBJ+e+Hgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOe4oh7wxgs4Bpg5Q4aKwfF9SpEPO3xYKDEKedyqTVg=;
 b=gJxqy5wAi/GlQAPWazS5z2gr5mKlWzQtqUZQ1fPHUmvOmafPcUSg+87M2XYXUdDQkoNG3zEdF96H59V+TSqWXw1115JCQah5Jyyz5gDLY8DjDyvAiuCPBKo5ast/NGxD4h17hxXFsqJhwRpBcGvAqe2vCatsRJtlq+xpy9dMBhs=
Date: Tue, 21 Dec 2021 14:42:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>,
	=?utf-8?B?UGF3ZcWC?= Randzio <pawel.randzio@intel.com>
Subject: Re: [PATCH] MAINTAINERS: update TXT section
Message-ID: <YcHZ2M4sWWASZntx@Air-de-Roger>
References: <8334f9e5-bee3-8090-595d-1d45c9af0eb0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8334f9e5-bee3-8090-595d-1d45c9af0eb0@suse.com>
X-ClientProxiedBy: MR1P264CA0060.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62995170-6ca6-4642-b6ae-08d9c487ca80
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB544512DA024E15CA80C190088F7C9@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ZvF1/flm8cluSMcpfpJ3AZJmOaIR7JMbiVFRKNPTRqT/MPNM/Rj/GuyLa/fzfSxU2DG8BXYjh/pOIWMalxA1sPwidYFVWoQ01UxM0oIWxoMqu/RvtpFexebBLA0vkvBXsBaOx/0VDngSBf+LCkAAUV7W+rc3exN1Wd5Yfyi2Z6a58jx0sdCv41oX6TNk5qSuz2CzVhdltiysdRc0mWCXDs5Na7bSflvjuUR32ap/tek009GAAxedurEwY5GcDQpwvXQL+x83/FIPj5fQrb4Hzk+6Lep4j3XkAB1i55YJnPljCYdxfB/U0+ZQqbJHo5nc/4cUM2yXCb+WfbQif2l5Hf02WkSOg9brzP0L6HlV3Tfq0MTAxpL76P7jWGU58Vr+pJsU3EH7vGr/RS4RsxileP6tUoq2Ft+g/RoyD6SagoYgEK/86usJExtnahK0Dv0QDUXKk6wcwfHm22tIUcTPMtSnFFyvOdTe/+R5H9a5SCPlzzw5Ww282j9vylVo7/CUXt3R5rqKeM5rCJFJ+WjPl/WDBxWdqzgL63Yb0xes/MeVDyvEL9kqpQ1jvdgk65ahpMMZDcQ4KZS0Jrmc/Pe1GN4N+SlMCoowvrjyeY3NWjVdJBrqw8fJC5Vtm61ym7EEeKgWOi9/KdNobF3LFI+eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(82960400001)(6486002)(86362001)(38100700002)(508600001)(85182001)(316002)(33716001)(8676002)(4326008)(5660300002)(2906002)(6916009)(54906003)(8936002)(66476007)(66556008)(6666004)(4744005)(6506007)(83380400001)(66946007)(6512007)(26005)(186003)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEFISHU0eUV6VE9BTms3NVhXUmFiVFZFUnQ4Rmg3QWhySkdWVllwcVVzRmIv?=
 =?utf-8?B?MW8yUmdSUWh5VUI4UHdKT0FBQ2VUTHhUU2IyaHBRN0lNdHNDdGNweFBvSG1k?=
 =?utf-8?B?cm02UDFyeVhVVlEwTjdFbFUwNzRIaEVVWWRTMzJHc0ppTEIvNGs3cDRYZjVn?=
 =?utf-8?B?SE5EdFFVcnJWV1A0N05sNGpyU1U0aUlqdjZZeDVDb2cvWHI5dTVpNGFrN2Fr?=
 =?utf-8?B?Y0VxODcrc3MvdlAzR1hKM3RpWmNJcFp2cmdqTXFTSWc0MURQaVZLYjd2M2Zq?=
 =?utf-8?B?NlFhUGpoVVNQMWZacVlCNHk2K3duWThucU95VzZtRTRobmZFa05qamk0T0VD?=
 =?utf-8?B?YUE2VHlMY3RHZmRHdG56MXBFRnZLUEFlekw2U2hOc2xxMDBSU0htb3h0VUdG?=
 =?utf-8?B?ZHR1Qnk0eXNXOWRiN0NnWTU4aHVlQldzaHhKc3hkS3BJOWxhbVVWSDVJWVdW?=
 =?utf-8?B?TFpGK2YyV2IyWXphMGY0M3RRMDRXRjZqKzdmcWd5bE9VNUQvSHZrcFZmdGlQ?=
 =?utf-8?B?NWE5MEJCL04yK014dW9JeDkxZUNqemN4b3paM0NRNmVBRnJ1Y1RjTVpuZW5E?=
 =?utf-8?B?VzlOMTZrTFFqK0dLZ0h1SHN1UEFzYllMcmRDMUV6emo1RVBwdmNCK2pwNEtk?=
 =?utf-8?B?allSTXFEZzd5amJiZUdsMmVYZmJZSktlbmN4Nml4ZHp0R2dQUzdwSVVOclpD?=
 =?utf-8?B?c1NaL29vc0xNY2dxNC9Bdk5qeTRGcVdPU3NhcFRTTWtsTzN4R1JTQk5oVm93?=
 =?utf-8?B?dGdDd2V4WVFKMzdNYzdJUTFvUk02ZjBMU2l3Vm5WRzdqajZ2cTV4NUFLeFN5?=
 =?utf-8?B?VWMzQ1gvTE1BbGkzOTIyZ29tWEk2ZlZ4eHZaMnk4RSs4ZUVxZVpsS05UbndH?=
 =?utf-8?B?dHhvL2Z2QlRxZUxnb3ZNcVpWTnhiYjJxN1ZySVhJWmNSKy9iK2hucS9hSC84?=
 =?utf-8?B?aVk3VmEyZW1Tc2R3eWFnZ09zQlRKNnBUd1M2ZlVUT29RSFVGMThlN29RWGI4?=
 =?utf-8?B?NTlSMStTN2UxZ2t2N1J2TkV0Q2x4alljVUZlVzJSemFoQkxqMWdhbXVLWVJ1?=
 =?utf-8?B?ZEJNMGl6ZitNVklZRFpsV2Faa0dpT3FOZHpTTUlpSEZzMUY2TjJSU3pjc0tK?=
 =?utf-8?B?UkNlTmJSQUY5VUNjMGxYL0toMy8welg1bmFzSDZJYkY3RndETnJyZHZyTkRr?=
 =?utf-8?B?MWtPelZQUzdxRjRtUXI0MUdlRlRrdzdLT0NFbm1kSHp1ajJwYUd4WHk4NUlH?=
 =?utf-8?B?d3p1akxzbVE0Q2JJMWRxVHY0MzJsK3VYQkEwRllrS0phQi8xbVE4b2RsbVlB?=
 =?utf-8?B?S0tLbFV5akN2emdkNGNoZ0tndzVPWHFPRUFhUWt5dnRlWForbWpyU29WeTM4?=
 =?utf-8?B?RHpqTnYydEJvNEVDcW5aVXh1Q1M1bGtKWStsbnk5S3JzL1NMNGZudm1FdTZR?=
 =?utf-8?B?aCtYeUk1ekF2WTcyZlhTZDZEeHBOVU5VcXI0NjFqekdJV2lqLzRpVnJ3cWRl?=
 =?utf-8?B?dWZTRkplR1c5TDRiekptT3Zma1ozNDB5eFE5ZTd1U3VwRDEzdTA2WXY5Nmkv?=
 =?utf-8?B?UmRSdVpKSHhvdEMrUFFzbXVOU1FyR1BvS3FGUFR2VGRhSDY2ZUttMDNHZlVi?=
 =?utf-8?B?WWJhdGFiVUdRd0J5MVpxdEl2aldsZzZmUlN5a041cThMU0xqaXVlOXQxLzBN?=
 =?utf-8?B?czJwRGtnbDlDUTNSZlNVdnRDQy94YjlNTXhvcnhlMGFLMUdTK1l5RWdmazBp?=
 =?utf-8?B?Um9aVjhBVWg1N3g0bjFXY0s3Y0lKYWt4NjZ6TkVTM1N4amlGRjFjZFpYdXJt?=
 =?utf-8?B?QVlweXVNNkVRMFFIdHJ5dEl4Yk1WeVg3THVjdnVsSi94SUIzRmYvSk5HSjE2?=
 =?utf-8?B?Z2hCZlNYRkpLaEVlYWJWRStBWVBSRkI5RGY1N0VKbkVVYXRvRGxQMjhFU0Yr?=
 =?utf-8?B?WUE5cDZ6UXJ4aGFYYnVkVnAwMHFWTXhOL0gvRzY1NWFpbVcyTGxVU25vRWw4?=
 =?utf-8?B?b1RwZU9OaXgybWt4ZUtESjEwdVdOWFpoYm42NEZPRDAxU1I2UXh6Y0tpSFpy?=
 =?utf-8?B?cWhSd1hSQmE2QlU2QkNnZ0poQzZHemo1VGluWUhKaEtHaG1KL1NvWkNNdE9S?=
 =?utf-8?B?WEdUKy83MUhvcnB1ZGl0REhzaDNOcjg0WTNCWnNDVFQ2UStZQzBKYmN0UndJ?=
 =?utf-8?Q?Ek+YMM7WRXFBK7FkcV/PJlU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62995170-6ca6-4642-b6ae-08d9c487ca80
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 13:42:54.7635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYvWHLyvR+pBQsST3vJN3k4HM6PGJc3wGMILuQGcajZp/b6naTCfDmK7uVOP6WjCoQ07ZnkI+/gi+K2kNsWJ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Tue, Dec 21, 2021 at 10:06:37AM +0100, Jan Beulich wrote:
> Since mail to Lukasz'es address has been bouncing, Intel have suggested
> replacement contacts.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> To be frank, I'm not fully convinced of the M: - I'd instead see us use
> R: for both just like we had it for Lukasz.

I assume it was Intel then to explicitly request for Maintainer
status?

I'm fine with either M or R, albeit I agree R might be more natural
since there's no track of record in xen-devel of any reviews AFAICT.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

